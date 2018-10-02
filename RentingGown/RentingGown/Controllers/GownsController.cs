using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RentingGown.Models;

namespace RentingGown.Controllers
{
    public class GownsController : Controller
    {
        private RentingGownDB db = new RentingGownDB();

        // GET: Gowns
        public ActionResult Index()
        {
            var gowns = db.Gowns.Include(g => g.Catgories).Include(g => g.Renters).Include(g => g.Seasons).Include(g => g.Seasons1).Include(g => g.Sets).Include(g => g.Colors);
            return View(gowns.ToList());
        }

        // GET: Gowns/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gowns gowns = db.Gowns.Find(id);
            if (gowns == null)
            {
                return HttpNotFound();
            }
            return View(gowns);
        }

        // GET: Gowns/Create
        public ActionResult Create()
        {
            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory");
            ViewBag.id_renter = new SelectList(db.Renters, "id_renter", "fname");
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season");
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season");
            ViewBag.id_set = new SelectList(db.Sets, "id_set", "id_set");
            ViewBag.color = new SelectList(db.Colors, "id_color", "color");
            return View();
        }

        // POST: Gowns/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_gown,id_renter,id_catgory,picture,id_season,is_long,price,is_light,color,id_set,is_available,size")] Gowns gowns)
        {
            if (ModelState.IsValid)
            {
                db.Gowns.Add(gowns);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory", gowns.id_catgory);
            ViewBag.id_renter = new SelectList(db.Renters, "id_renter", "fname", gowns.id_renter);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_set = new SelectList(db.Sets, "id_set", "id_set", gowns.id_set);
            ViewBag.color = new SelectList(db.Colors, "id_color", "color", gowns.color);
            return View(gowns);
        }

        // GET: Gowns/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gowns gowns = db.Gowns.Find(id);
            if (gowns == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory", gowns.id_catgory);
            ViewBag.id_renter = new SelectList(db.Renters, "id_renter", "fname", gowns.id_renter);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_set = new SelectList(db.Sets, "id_set", "id_set", gowns.id_set);
            ViewBag.color = new SelectList(db.Colors, "id_color", "color", gowns.color);
            return View(gowns);
        }

        // POST: Gowns/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_gown,id_renter,id_catgory,picture,id_season,is_long,price,is_light,color,id_set,is_available,size")] Gowns gowns)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gowns).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_catgory = new SelectList(db.Catgories, "id_catgory", "catgory", gowns.id_catgory);
            ViewBag.id_renter = new SelectList(db.Renters, "id_renter", "fname", gowns.id_renter);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_season = new SelectList(db.Seasons, "id_season", "season", gowns.id_season);
            ViewBag.id_set = new SelectList(db.Sets, "id_set", "id_set", gowns.id_set);
            ViewBag.color = new SelectList(db.Colors, "id_color", "color", gowns.color);
            return View(gowns);
        }

        // GET: Gowns/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gowns gowns = db.Gowns.Find(id);
            if (gowns == null)
            {
                return HttpNotFound();
            }
            return View(gowns);
        }

        // POST: Gowns/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Gowns gowns = db.Gowns.Find(id);
            db.Gowns.Remove(gowns);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
