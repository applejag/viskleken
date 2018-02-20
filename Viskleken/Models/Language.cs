using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Viskleken.Models
{
    public class Language
    {
		[Key]
		[MaxLength(5)]
        public string Code { get; set; }

		[Required]
		[MaxLength(256)]
        public string Name { get; set; }
	}
}