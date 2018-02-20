using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Viskleken.Models;
using Viskleken.Viewmodels;

namespace Viskleken.Controllers
{
    public class LanguagesController : Controller
    {
        private readonly VisklekenContext db = new VisklekenContext();
		
        // GET: Languages/Select
        public async Task<ActionResult> SelectLanguage()
        {
	        var languageSelectorVM = new LanguageSelectorVM
	        {
		        Heading = "Viskleken",
		        StageInProcess = 1,
				AllLanguages = await db.LanguageCodes.ToListAsync(),
			};

	        return View(languageSelectorVM);
        }

        // POST: Languages/Select
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SelectLanguage(LanguageSelectorVM model)
        {
	        model.AllLanguages = await db.LanguageCodes.ToListAsync();
			
			if (ModelState.IsValid)
            {   
                model.StageInProcess = 2;

                //string builder = "";
                //System.IO.File.WriteAllText("C:\\Users\\paulh\\OneDrive\\Documents\\Bitoreq AB\\APL\\Viskleken\\File.txt", builder);

                string path = Environment.ExpandEnvironmentVariables("%appdata%\\Bitoreq AB\\Viskleken");
                System.IO.Directory.CreateDirectory(path);
                System.IO.File.WriteAllText(path + "\\File.txt", "");

                return View(model);
            }

            model.StageInProcess = 1;

            return View(model);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db?.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
