using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RegistroCrud;

namespace RegistroCrud.Controllers
{
    public class test_usuarioController : Controller
    {
        private DB_RegistroCrudEntities db = new DB_RegistroCrudEntities();

        // GET: test_usuario
        public ActionResult Index()
        {
            List<test_usuario> tu = new List<test_usuario>();
            List<test_mostrar_Result> SP_usuarios;
            SP_usuarios = db.test_mostrar().ToList();

            //tu = SP_usuarios;
            foreach (test_mostrar_Result usuario in SP_usuarios)
            {
                test_usuario tu2 = new test_usuario();
                tu2.usu_ced = usuario.usu_ced;
                tu2.usu_tipoUsuario = usuario.usu_tipoUsuario;
                tu2.usu_nombreCompleto = usuario.usu_nombreCompleto;
                tu2.usu_correo = usuario.usu_correo;
                tu2.usu_tipoIdent = usuario.usu_tipoIdent;
                tu2.usu_usuario = usuario.usu_usuario;

                tu.Add(tu2);
            }
            return View(tu.ToList());
        }


        // GET: test_usuario/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            test_usuario test_usuario = db.test_usuario.Find(id);
            if (test_usuario == null)
            {
                return HttpNotFound();
            }
            return View(test_usuario);
        }

        // GET: test_usuario/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: test_usuario/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "usu_ced,usu_tipoUsuario,usu_nombreCompleto,usu_correo,usu_tipoIdent,usu_usuario,usu_clave,usu_activo")] test_usuario test_usuario)
        {
            if (ModelState.IsValid)
            {
                db.test_insertar(test_usuario.usu_tipoUsuario, test_usuario.usu_nombreCompleto,
                                 test_usuario.usu_correo, test_usuario.usu_tipoIdent, test_usuario.usu_ced,test_usuario.usu_usuario, test_usuario.usu_clave);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.nombres = db.test_mostrarHabilidades();

            return View(test_usuario);
        }

        // GET: test_usuario/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            test_usuario test_usuario = db.test_usuario.Find(id);
            if (test_usuario == null)
            {
                return HttpNotFound();
            }
            return View(test_usuario);
        }

        // POST: test_usuario/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "usu_ced,usu_tipoUsuario,usu_nombreCompleto,usu_correo,usu_tipoIdent,usu_usuario,usu_clave,usu_activo")] test_usuario test_usuario)
        {
            if (ModelState.IsValid)
            {
                db.test_actualizar(test_usuario.usu_tipoUsuario, test_usuario.usu_nombreCompleto,
                                 test_usuario.usu_correo, test_usuario.usu_tipoIdent, test_usuario.usu_ced, test_usuario.usu_usuario, test_usuario.usu_clave);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(test_usuario);
        }

        // GET: test_usuario/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            test_usuario test_usuario = db.test_usuario.Find(id);
            if (test_usuario == null)
            {
                return HttpNotFound();
            }
            return View(test_usuario);
        }

        // POST: test_usuario/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            db.test_eliminar(id);
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
