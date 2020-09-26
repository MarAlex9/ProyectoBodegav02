using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoBodegav02.Models;

namespace ProyectoBodegav02.Controllers
{
    public class ProductosController : Controller
    {
        private dbBodegaEntities db = new dbBodegaEntities();

        // GET: Productos
        public ActionResult Index()
        {
            var producto = db.Producto.Include(p => p.Categoria).Include(p => p.Proveedor);
            return View(producto.ToList());
        }

        // GET: Productos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producto producto = db.Producto.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            return View(producto);
        }

        // GET: Productos/Create
        public ActionResult Create()
        {
            ViewBag.fk_idCategoria = new SelectList(db.Categoria, "idCategoria", "nombre_Cat");
            ViewBag.fk_idProveedor = new SelectList(db.Proveedor, "idProveedor", "nombre_Prove");
            return View();
        }

        // POST: Productos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProducto,nom_Producto,marca_Producto,precio_Producto,fk_idProveedor,fk_idCategoria")] Producto producto)
        {
            if (ModelState.IsValid)
            {
                db.Producto.Add(producto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.fk_idCategoria = new SelectList(db.Categoria, "idCategoria", "nombre_Cat", producto.fk_idCategoria);
            ViewBag.fk_idProveedor = new SelectList(db.Proveedor, "idProveedor", "nombre_Prove", producto.fk_idProveedor);
            return View(producto);
        }

        // GET: Productos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producto producto = db.Producto.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            ViewBag.fk_idCategoria = new SelectList(db.Categoria, "idCategoria", "nombre_Cat", producto.fk_idCategoria);
            ViewBag.fk_idProveedor = new SelectList(db.Proveedor, "idProveedor", "nombre_Prove", producto.fk_idProveedor);
            return View(producto);
        }

        // POST: Productos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProducto,nom_Producto,marca_Producto,precio_Producto,fk_idProveedor,fk_idCategoria")] Producto producto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.fk_idCategoria = new SelectList(db.Categoria, "idCategoria", "nombre_Cat", producto.fk_idCategoria);
            ViewBag.fk_idProveedor = new SelectList(db.Proveedor, "idProveedor", "nombre_Prove", producto.fk_idProveedor);
            return View(producto);
        }

        // GET: Productos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producto producto = db.Producto.Find(id);
            if (producto == null)
            {
                return HttpNotFound();
            }
            return View(producto);
        }

        // POST: Productos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Producto producto = db.Producto.Find(id);
            db.Producto.Remove(producto);
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
