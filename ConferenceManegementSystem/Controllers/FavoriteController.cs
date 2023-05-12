using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using ConferenceManegementSystem.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManegementSystem.Controllers
{
    public class FavoriteController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();
        public ActionResult AddFavorites(int roomId)
        {
            try
            {
                int userId = Convert.ToInt32(Session["userId"].ToString());

                Favorite favorite = new Favorite()
                {
                    RoomId = roomId,
                    UserId = userId
                };
                context.Favorites.Add(favorite);
                context.SaveChanges();
                var roomName = context.Rooms.Where(x => x.Id == favorite.RoomId).FirstOrDefault().RoomName;
                logManager.SaveActivity(userId,"Added favorite room: " +roomName);
            }
            catch (Exception ex)
            {
                

            }
            return RedirectToAction("Index", "Home");

        }
        public ActionResult RemoveFavorite(int roomId)
        {
            try
            {
                int userId = Convert.ToInt32(Session["userId"].ToString());

                var favorite = context.Favorites.Where(x => x.RoomId == roomId && x.UserId == userId);
                if (favorite!=null)
                {
                    context.Favorites.Remove(favorite.FirstOrDefault());
                    context.SaveChanges();
                    var roomName = context.Rooms.Where(x => x.Id == roomId).FirstOrDefault().RoomName;
                    logManager.SaveActivity(userId, "Removed favorite room: " + roomName);
                }
               
            }
            catch (Exception ex)
            {

            }
            return RedirectToAction("Index", "Home");

        }
        
    }
}