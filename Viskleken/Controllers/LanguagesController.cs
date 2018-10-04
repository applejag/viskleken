using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using Viskleken.Models;
using Viskleken.Viewmodels;
using System.Speech.Synthesis;


namespace Viskleken.Controllers
{
    public class LanguagesController : Controller
    {
        SpeechSynthesizer synth = new SpeechSynthesizer();
        private readonly VisklekenContext db = new VisklekenContext();

        // GET: Languages/Select
        public async Task<ActionResult> SelectLanguage()
        {
            ViewData["Header"] = "Viskleken";

            var languageSelectorVM = new LanguageSelectorVM
            {
                StageInProcess = 1,
                AllLanguages = await db.LanguageCodes.ToListAsync(),
            };
            return View(languageSelectorVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SelectLanguage(LanguageSelectorVM model)
        {
            model.AllLanguages = await db.LanguageCodes.ToListAsync();



            if (ModelState.IsValid)
            {
                model.StageInProcess = 2;

                string pathFile = Environment.ExpandEnvironmentVariables("%appdata%\\Bitoreq AB\\Viskleken\\");
                string path = Environment.ExpandEnvironmentVariables("%appdata%\\Bitoreq AB\\Viskleken\\" + model.Email);
                System.IO.Directory.CreateDirectory(path);
                System.IO.Directory.CreateDirectory(pathFile);
                System.IO.File.WriteAllText(pathFile + "\\done.txt", "");
                string selectedlanguageString = "";
                foreach (var item in model.SelectedLanguages)
                {
                    selectedlanguageString += (item + " ");
                    System.IO.File.WriteAllText(path + "\\" + item.ToString() + ".txt", "");
                }
                using (var writer = XmlWriter.Create(pathFile + "\\File.xml"))
                {
                    writer.WriteStartDocument();
                    writer.WriteStartElement("information");
                    writer.WriteElementString("Email", model.Email);
                    writer.WriteElementString("Phrase", model.Phrase);
                    writer.WriteElementString("SelectedLanguage", selectedlanguageString);
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                }

                string detectedLanguage = "";
                string detectedLanguageCode = "";
                bool keepdoing2 = true;
                while (keepdoing2)
                {
                    try
                    {
                        if (System.IO.File.Exists(pathFile + "\\code.txt"))
                        {

                             detectedLanguage = System.IO.File.ReadAllText(pathFile + "\\UserLanguage.txt");
                             detectedLanguageCode = db.LanguageCodes.FirstOrDefault(c => c.Name == detectedLanguage).Code;
                            System.IO.File.WriteAllText(pathFile + "\\code.txt", detectedLanguageCode);
                            System.IO.File.WriteAllText(path + "\\" + detectedLanguageCode + ".txt", "");
                            System.IO.File.Delete(pathFile + "\\UserLanguage.txt");

                            keepdoing2 = false;

                        }
                    }
                    catch (System.AccessViolationException)
                    {
                        System.Threading.Thread.Sleep(1000);
                    }
                }


                Dictionary<string, string> text = new Dictionary<string, string>();
                bool keepdoing = true;
                while (keepdoing)
                {
                    if (!System.IO.File.Exists(pathFile + "\\done.txt"))
                    {
                        foreach (var item in model.SelectedLanguages)
                        {
                            text.Add(item, System.IO.File.ReadAllText(path + "\\" + item.ToString() + ".txt"));
                        }
                        keepdoing = false;
                    }
                }


                text.Add(detectedLanguageCode, System.IO.File.ReadAllText(path + "\\" + detectedLanguageCode + ".txt"));
                model.TranslatedTexts = text;
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
