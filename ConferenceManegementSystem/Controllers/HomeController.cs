using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.ViewModels;
using ConferenceManegementSystem.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManagementSystem.Controllers
{
    public class HomeController : Controller
    {
        ConferenceManagementDbContext _context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();

        public ActionResult Index(bool? favorites, bool? isLock)
        {
            int userId = Convert.ToInt32(Session["userId"].ToString());

            List<RoomViewModel> roomViewModels = new List<RoomViewModel>();
            var rooms = _context.Rooms.ToList();
            foreach (var item in rooms)
            {
                var userCount = _context.RoomUsers.Where(r => r.RoomId == item.Id).ToList().Count;
                var isFavorite = _context.Favorites.Where(x => x.RoomId == item.Id && x.UserId == userId).FirstOrDefault();
                roomViewModels.Add(new RoomViewModel()
                {
                    UserCount = userCount,
                    Room = item,
                    IsFavorite = isFavorite != null ? true : false,
                    IsLock = item.IsActive
                });
            }
            if (favorites != null)
            {
                if (favorites.Value)
                {
                    var favoriteRooms = roomViewModels.Where(x => x.IsFavorite == true).ToList();
                    if (favoriteRooms.Count == 0)
                    {
                        TempData["Error"] = "Your favorites room is empty. Please add a favorite room.";
                    }
                    return View(favoriteRooms);

                }
            }
            if (isLock != null)
            {
                if (!isLock.Value)
                {
                    var favoriteRooms = roomViewModels.Where(x => x.IsLock == false).ToList();

                    return View(favoriteRooms);
                }
            }
            if (Session["userRole"].ToString()!="Admin")
            {
                return View(roomViewModels.Where(x => x.IsLock == true).ToList());

            }
            return View(roomViewModels.ToList());
        }

        
    }
}