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
    public class Pedido_ProductoController : Controller
    {
        private dbBodegaEntities db = new dbBodegaEntities();

        // GET: Pedido_Producto
        public ActionResult Index()
        {
            var pedido_Producto = db.Pedido_Producto.Include(p => p.Pedido).Include(p => p.Producto);
            return View(pedido_Producto.ToList());
        }

        // GET: Pedido_Producto/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pedido_Producto pedido_Producto = db.Pedido_Producto.Find(id);
            if (pedido_Producto == null)
            {
                return HttpNotFound();
            }
            return View(pedido_Producto);
        }

        // GET: Pedido_Producto/Create
        public ActionResult Create()
        {
            ViewBag.fk_Pedido_idPedido = new SelectList(db.Pedido, "idPedido", "descripcion_Pedido");
            ViewBag.fk_Producto_idProducto = new SelectList(db.Producto, "idProducto", "nom_Producto");
            return View();
        }

        // POST: Pedido_Producto/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPedido_Producto,fk_Pedido_idPedido,fk_Producto_idProducto,Cantidad")] Pedido_Producto pedido_Producto)
        {
            if (ModelState.IsValid)
            {
                db.Pedido_Producto.Add(pedido_Producto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.fk_Pedido_idPedido = new SelectList(db.Pedido, "idPedido", "descripcion_Pedido", pedido_Producto.fk_Pedido_idPedido);
            ViewBag.fk_Producto_idProducto = new SelectList(db.Producto, "idProducto", "nom_Producto", pedido_Producto.fk_Producto_idProducto);
            return View(pedido_Producto);
        }

        // GET: Pedido_Producto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pedido_Producto pedido_Producto = db.Pedido_Producto.Find(id);
            if (pedido_Producto == null)
            {
                return HttpNotFound();
            }
            ViewBag.fk_Pedido_idPedido = new SelectList(db.Pedido, "idPedido", "descripcion_Pedido", pedido_Producto.fk_Pedido_idPedido);
            ViewBag.fk_Producto_idProducto = new SelectList(db.Producto, "idProducto", "nom_Producto", pedido_Producto.fk_Producto_idProducto);
            return View(pedido_Producto);
        }

        // POST: Pedido_Producto/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPedido_Producto,fk_Pedido_idPedido,fk_Producto_idProducto,Cantidad")] Pedido_Producto pedido_Producto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedido_Producto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.fk_Pedido_idPedido = new SelectList(db.Pedido, "idPedido", "descripcion_Pedido", pedido_Producto.fk_Pedido_idPedido);
            ViewBag.fk_Producto_idProducto = new SelectList(db.Producto, "idProducto", "nom_Producto", pedido_Producto.fk_Producto_idProducto);
            return View(pedido_Producto);
        }

        // GET: Pedido_Producto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pedido_Producto pedido_Producto = db.Pedido_Producto.Find(id);
            if (pedido_Producto == null)
            {
                return HttpNotFound();
            }
            return View(pedido_Producto);
        }

        // POST: Pedido_Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pedido_Producto pedido_Producto = db.Pedido_Producto.Find(id);
            db.Pedido_Producto.Remove(pedido_Producto);
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
