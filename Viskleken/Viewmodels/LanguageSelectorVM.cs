using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Viskleken.Models;

namespace Viskleken.Viewmodels
{
    public class LanguageSelectorVM
    {
        public string Heading { get; set; }

        [Display(Name="E-post")]
        public string Email { get; set; }

        [Display(Name = "Fras")]
        [Required(ErrorMessage = "Var god ange en fras.")]
        public string Phrase { get; set; }

        [Display(Name = "Språk")]
		[Required(ErrorMessage = "Var god ange minst ett språk.")]
		[MinLength(1, ErrorMessage = "Var god ange minst ett språk.")]
        public string[] SelectedLanguages { get; set; } = new string[0];
		
	    public List<Language> AllLanguages { get; set; }

		public string StartMessage { get; set; }

        public int StageInProcess { get; set; }

        public LanguageSelectorVM()
        {
            StartMessage = "ViskROBOTEN startar";
        }
    }
}