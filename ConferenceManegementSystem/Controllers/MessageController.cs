using ConferenceManagementSystem.Models.Context;
using ConferenceManagementSystem.Models.Entities;
using ConferenceManegementSystem.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferenceManegementSystem.Controllers
{
    public class MessageController : Controller
    {
        ConferenceManagementDbContext context = new ConferenceManagementDbContext();
        LogManager logManager = new LogManager();
        // GET: Message
        public JsonResult SendMessage(Message message)
        {
            HttpFileCollectionBase files = Request.Files;
            if (files.Count>0)
            {
                HttpPostedFileBase inputFile = files[0];
                if (inputFile != null && inputFile.ContentLength > 0)

                    try
                    {
                        var path = Path.Combine(Server.MapPath("~/Content/images"),
                         Path.GetFileName(inputFile.FileName));
                        message.Link = inputFile.FileName;
                        inputFile.SaveAs(path);
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Message = "ERROR:" + ex.Message.ToString();
                    }
                else
                {
                    ViewBag.Message = "You have not specified a file.";
                }
            }
            
            try
            {
                context.Messages.Add(message);
                context.SaveChanges();
                var userId = Convert.ToInt32(Session["userId"].ToString());
                var activity = "Sended Message: ";
                logManager.SaveActivity(userId, activity+=message.Text != null?message.Text:" ");
            }
            catch (Exception ex)
            {
                return Json(ex.Message);
               
            }
            return Json(message.RoomId);

        }
        public JsonResult GetMessage(int roomId)
        {
            var messages = context.Messages.Include(u=>u.User).Where(m => m.RoomId == roomId).ToList();
            return Json(messages,JsonRequestBehavior.AllowGet);
        }
    }
}