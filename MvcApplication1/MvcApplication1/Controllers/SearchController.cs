using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;
namespace MvcApplication1.Controllers
{
    public class SearchController : Controller
    {

        private RentingGownEntities db = new RentingGownEntities();
        public ActionResult Search()
        {
            return View();
        }
        public ActionResult AddGown()
        {
            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory");
            return View();
        }
        public ActionResult AddGown1()
        {
            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory");
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season");
            ViewBag.color = new SelectList(db.Colors, "id_color", "color");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddGown(int password, int id_catgory, int id_season, string is_long, int price, string is_light, int color, int num_of_dress, string fileset, string arrFiles, string arrSizes)
        {
            System.Web.Helpers.WebImage photo = null;

            //var imagePath = "";


            //int error = 0;

            //var q = db.Renters.FirstOrDefault(p => p.password == password);
            //if (ModelState.IsValid && q != null)
            //{

            //    string[] arrayFiles;
            //    string[] arraySizes;
            //    string[] arrfilenames;
            //    arraySizes = arrSizes.Split(' ').ToArray();
            //    arrayFiles = arrFiles.Split('?').ToArray();
            //    int idGown = 0;
            //    foreach (Gowns currentGown in db.Gowns)
            //    {
            //        idGown = currentGown.id_gown;
            //    }
            //    if (arraySizes.Count() > 2)
            //    {
            //        Sets set = new Sets();
            //        int id = 0;
            //        foreach (Sets currentset in db.Sets)
            //        {
            //            id = currentset.id_set;
            //        }
            //        set.num_of_set = arraySizes.Count() - 1;
            //        set.id_set = id + 1;
            //        arrfilenames = arrayFiles[0].Split('\\').ToArray();
            //        var filenameSet = Guid.NewGuid().ToString() + "_" + arrfilenames[arrfilenames.Count() - 1];
            //        set.picture = filenameSet;
            //        photo = WebImage.GetImageFromRequest("fileset");
            //        if (photo != null)
            //        {
            //            //Path.GetFileName(photo.FileName);
            //            imagePath = @"Images\" + filenameSet;

            //            photo.Save(@"~\" + imagePath);
            //        }
            //        int i = 0;

            //        foreach (string size in arraySizes)
            //        {

            //            if (size != "")
            //            {
            //                Gowns gown = new Gowns();
            //                arrfilenames = arrayFiles[i].Split('\\').ToArray();
            //                gown.id_gown = idGown + 1;
            //                gown.id_renter = q.id_renter;
            //                gown.id_catgory = id_catgory;
            //                var filename = Guid.NewGuid().ToString() + "_" + arrfilenames[arrfilenames.Count() - 1];
            //                gown.picture = filename.ToString();
            //                gown.id_season = id_season;
            //                if (is_long == "ארוך")
            //                    gown.is_long = true;
            //                else gown.is_long = false;
            //                gown.price = price;
            //                if (is_light == "בהיר")
            //                    gown.is_light = true;
            //                else gown.is_light = false;
            //                gown.color = color;
            //                gown.id_set = set.id_set;
            //                gown.size = int.Parse(size);
            //                photo = WebImage.GetImageFromRequest("file" + ++i);
            //                if (photo != null)
            //                {

            //                    //photo.Resize((int)(photo.Width*0.8), (int)(photo.Height * 0.8));
            //                    //Path.GetFileName(photo.FileName);
            //                    imagePath = @"Images\" + filename;

            //                    photo.Save(@"~\" + imagePath);
            //                }
            //                db.Sets.Add(set);
            //                db.Gowns.Add(gown);

            //            }

            //        }
            //    }
            //    else
            //    {
            //        Gowns gown = new Gowns();
            //        gown.id_gown = idGown + 1;
            //        gown.id_renter = q.id_renter;
            //        gown.id_catgory = id_catgory;
            //        arrfilenames = arrayFiles[0].Split('\\').ToArray();
            //        var filename = Guid.NewGuid().ToString() + "_" + arrfilenames[arrfilenames.Count() - 1];
            //        gown.picture = filename.ToString();
            //        gown.id_season = id_season;
            //        if (is_long == "ארוך")
            //            gown.is_long = true;
            //        else gown.is_long = false;
            //        gown.price = price;
            //        if (is_light == "בהיר")
            //            gown.is_light = true;
            //        else gown.is_light = false;
            //        gown.color = color;
            //        gown.id_set = 1;
            //        gown.size = int.Parse(arraySizes[0]);

            //        photo = WebImage.GetImageFromRequest("file1");
            //        if (photo != null)
            //        {
            //            //Path.GetFileName(photo.FileName);
            //            imagePath = @"Images\" + filename;

            //            photo.Save(@"~\" + imagePath);
            //        }

            //        db.Gowns.Add(gown);
            //    }
            //    db.SaveChanges();
            //    // return RedirectToAction("Index");
            //    return RedirectToAction("Index", "Home");

            //}
            //else
            //{
            //    if (q == null)
            //    {
            //        error = 1;
            //    }

            //}
            //ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory");
            //ViewBag.id_renter = new SelectList(db.Renters, "id_renter", "fname");
            //ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season");
            //ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season");
            //ViewBag.id_set = new SelectList(db.Sets, "id_set", "id_set");
            //ViewBag.color = new SelectList(db.Colors, "id_color", "color");

            return RedirectToAction("AddGown");


        }
       

    }
}
