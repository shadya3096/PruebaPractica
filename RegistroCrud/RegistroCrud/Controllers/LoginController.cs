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
    public class LoginController : Controller
    {
        private DB_RegistroCrudEntities db = new DB_RegistroCrudEntities();


        // GET: Login/Details/5/6
        public ActionResult Details(string user,string pass)
        {
            if (user == null || pass == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            test_login_Result loginData;

            loginData = db.test_login(user, pass).FirstOrDefault();

            test_usuario test_usuario = new test_usuario();

            test_usuario.usu_ced = loginData.usu_ced;
            test_usuario.usu_tipoUsuario = loginData.usu_tipoUsuario;
            test_usuario.usu_nombreCompleto = loginData.usu_nombreCompleto;
            test_usuario.usu_correo = loginData.usu_correo;
            test_usuario.usu_tipoIdent = loginData.usu_tipoIdent;
            test_usuario.usu_usuario = loginData.usu_usuario;
            test_usuario.usu_clave = loginData.usu_clave;
            test_usuario.usu_activo = loginData.usu_activo;


            if (test_usuario == null)
            {
                return HttpNotFound();
            }

            if (test_usuario.usu_tipoUsuario == "ADM")
            {
                return RedirectToAction("Index", "test_usuario");
            }
            else if (test_usuario.usu_tipoUsuario == "CON")
            {
                return RedirectToAction("ConView");
            }
            return View(test_usuario);
        }

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ConView()
        {
            return View();
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
