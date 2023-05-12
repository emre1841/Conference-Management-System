using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using ConferenceManagementSystem.Models.ViewModels;
using ConferenceManegementSystem.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManegementSystem.Controllers
{
    public class RoomController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();
        // GET: Room
        public ActionResult Index()
        {
            var rooms = context.Rooms.Include(r => r.User).ToList();

            return View(rooms);
        }
        public ActionResult Details(int roomId)
        {
            var userId = Convert.ToInt32(Session["userId"].ToString());
            var userRoom = context.RoomUsers.Where(u => u.RoomId == roomId && u.UserId == userId).FirstOrDefault();
            var checkRoomUserCount = context.Rooms.Where(x=>x.Id==roomId).FirstOrDefault().MaxUserCount;
            var userCount = context.RoomUsers.Where(x => x.RoomId == roomId).Count();
            
            if (userRoom == null)
            {
                var checkUserRoom = CheckUserRoom(userId);
                if (checkUserRoom)
                {
                    var room = context.RoomUsers.Include(r => r.Room).Where(r => r.UserId == userId).FirstOrDefault();
                    TempData["Room"] = room;
                    TempData["RoomId"] = roomId;
                    logManager.SaveActivity(userId, "Join the Room: " + room.Room.RoomName);

                    return RedirectToAction("Index", "Home");
                }
            }

            if (Session["userRole"].ToString() != "Admin")
            {
                var checkUser = context.RoomUsers.Where(r => r.UserId == userId && r.RoomId == roomId).FirstOrDefault();
                if (checkUser == null)
                {
                    if (userCount >= checkRoomUserCount)
                    {
                        TempData["Error"] = "This room has reached the maximum count of users. Please try later";
                        return RedirectToAction("Index", "Home");
                    }
                    RoomUser roomUser = new RoomUser()
                    {
                        RoomId = roomId,
                        UserId = Convert.ToInt32(Session["userId"].ToString())
                    };
                    context.RoomUsers.Add(roomUser);
                    context.SaveChanges();

                }
               

            }
            var roomUsers = context.RoomUsers.Include(r => r.User).Include(r => r.Room).Where(r => r.RoomId == roomId).ToList();
            var messages = context.Messages.Include(m => m.User).Where(m => m.RoomId == roomId).ToList();
            RoomMessagesViewModel model = new RoomMessagesViewModel()
            {
                Messages = messages,
                RoomUsers = roomUsers,
                RoomId = roomId,
                UserId = Convert.ToInt32(Session["userId"].ToString()),
                RoomName = context.Rooms.Where(r => r.Id == roomId).FirstOrDefault().RoomName
            };

            return View(model);
        }
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(Room room)
        {
            if (ModelState.IsValid)
            {
                room.CreatedDate = DateTime.Now;
                room.CreatedUserId = Convert.ToInt32(Session["userId"].ToString());
                context.Rooms.Add(room);
                context.SaveChanges();
                var result = context.Rooms.Where(r => r.Id == room.Id).FirstOrDefault();
                logManager.SaveActivity(room.CreatedUserId, "Created Room: " + result.RoomName);
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Exit(int id)
        {
            var roomUser = context.RoomUsers.Include(x => x.User).Include(x => x.Room).Where(x => x.Id == id).FirstOrDefault();
            context.RoomUsers.Remove(roomUser);
            context.SaveChanges();
            var roomName = context.Rooms.Where(x => x.Id == roomUser.RoomId).FirstOrDefault().RoomName;
            logManager.SaveActivity(roomUser.UserId, "Leave the Room : " + roomName);

            return RedirectToAction("Index", "Home");
        }
        public ActionResult ChangeSituation(int roomId, int? pageId)
        {
            var room = context.Rooms.Where(r => r.Id == roomId).FirstOrDefault();
            if (room.IsActive)
            {
                room.IsActive = false;
                var roomUsers = context.RoomUsers.Where(x=>x.RoomId==roomId).ToList();
                foreach (var item in roomUsers)
                {
                    context.RoomUsers.Remove(item);
                    context.SaveChanges();
                }
            }
            else
            {
                room.IsActive = true;
            }
            context.Entry(room).State = EntityState.Modified;
            context.SaveChanges();
            var userId = Convert.ToInt32(Session["userId"].ToString());

            logManager.SaveActivity(userId, room.IsActive ? "Room Activated" : "Deactivated" + " room situation" + room.RoomName);

            if (pageId == null)
            {
                return RedirectToAction("Index");

            }
            else
            {
                return RedirectToAction("Index", "Home");

            }
        }
        public bool CheckUserRoom(int userId)
        {
            var result = context.RoomUsers.Where(u => u.UserId == userId).Any();
            return result;
        }
        public ActionResult Leave(int roomId)
        {
            var userId = Convert.ToInt32(Session["userId"].ToString());
            var userRoom = context.RoomUsers.Where(r => r.UserId == userId).FirstOrDefault();
            context.RoomUsers.Remove(userRoom);
            context.SaveChanges();
            logManager.SaveActivity(userId, "Leave the Room : " + context.Rooms.Where(x=>x.Id==roomId).FirstOrDefault().RoomName) ;

            return RedirectToAction("Details", new { roomId = roomId });
        }

        public ActionResult Delete(int roomId)
        {
            var room = context.Rooms.Where(r => r.Id == roomId).FirstOrDefault();
            var roomUser = context.RoomUsers.Where(r => r.RoomId == roomId).ToList();
            var message = context.Messages.Where(r => r.RoomId == roomId).ToList();
            foreach (var item in message)
            {
                context.Messages.Remove(item);
                context.SaveChanges();
            }
            foreach (var item in roomUser)
            {
                context.RoomUsers.Remove(item);
                context.SaveChanges();
            }
            context.Rooms.Remove(room);
            context.SaveChanges();
            var userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Deleted the Room : " + room.RoomName);

            return RedirectToAction("Index", "Room");
        }
        public ActionResult Update(int roomId)
        {
            var room = context.Rooms.Where(r => r.Id == roomId).FirstOrDefault();
            return View(room);
        }
        [HttpPost]
        public ActionResult Update(Room room)
        {
            var result = context.Rooms.Where(r => r.Id == room.Id).FirstOrDefault();
            result.MaxUserCount = room.MaxUserCount;
            result.RoomName = room.RoomName;
            result.Description = room.Description;
            if (result.IsPrivate)
            {
                result.IsPrivate = true;
                result.Password = room.Password;
            }
            else
            {
                result.IsPrivate = false;
                result.Password = null;
            }
            context.Entry(result).State = EntityState.Modified;
            context.SaveChanges();
            var userId = Convert.ToInt32(Session["userId"].ToString());
            logManager.SaveActivity(userId, "Update the Room : " + result.RoomName);
            return RedirectToAction("Index");

        }
        public JsonResult SearchUser(string name,int roomId)
        {
            var users = context.RoomUsers.Include(u=>u.User).Where(u =>u.RoomId==roomId && u.User.Name.Contains(name)).Select(x=>new { x.UserId,x.User.Name,x.User.Gender}).ToList();
            return Json(users, JsonRequestBehavior.AllowGet);

        }
        public ActionResult CheckPassword(int id, string password)
        {
            var room = context.Rooms.Where(x => x.Id == id).FirstOrDefault();
            if (room.Password == password)
            {
                return RedirectToAction("Details", new { roomId = room.Id });
            }
            else
            {
                TempData["Error"] = "Wrong room password!! Please try again";

            }
            return RedirectToAction("Index", "Home");
        }
        public JsonResult PrivateCheckUserRoom(int id)
        {
            var userId = Convert.ToInt32(Session["userId"].ToString());
            var isInRoom = context.RoomUsers.Where(x => x.RoomId == id && x.UserId == userId).FirstOrDefault();
            if (isInRoom==null)
            {
                return Json(true, JsonRequestBehavior.AllowGet);

            }
            return Json(false, JsonRequestBehavior.AllowGet);
        
        }
    }
}