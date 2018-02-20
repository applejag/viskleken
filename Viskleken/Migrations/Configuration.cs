namespace Viskleken.Migrations
{
	using System;
	using System.Data.Entity;
	using System.Data.Entity.Migrations;
	using System.Linq;
	using Models;

	internal sealed class Configuration : DbMigrationsConfiguration<VisklekenContext>
	{
		public Configuration()
		{
			AutomaticMigrationsEnabled = false;
		}

		protected override void Seed(VisklekenContext context)
		{

			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "af", Name = "Afrikaans" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sq", Name = "Albanian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "am", Name = "Amharic" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ar", Name = "Arabic" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "hy", Name = "Armenian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "az", Name = "Azeerbaijani" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "eu", Name = "Basque" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "be", Name = "Belarusian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "bn", Name = "Bengali" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "bs", Name = "Bosnian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "bg", Name = "Bulgarian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ca", Name = "Catalan" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ceb", Name = "Cebuano" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "zh-CN", Name = "Chinese (Simplified)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "zh-TW", Name = "Chinese (Traditional)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "co", Name = "Corsican" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "hr", Name = "Croatian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "cs", Name = "Czech" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "da", Name = "Danish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "nl", Name = "Dutch" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "en", Name = "English" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "eo", Name = "Esperanto" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "et", Name = "Estonian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "fi", Name = "Finnish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "fr", Name = "French" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "fy", Name = "Frisian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "gl", Name = "Galician" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ka", Name = "Georgian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "de", Name = "German" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "el", Name = "Greek" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "gu", Name = "Gujarati" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ht", Name = "Haitian Creole" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ha", Name = "Hausa" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "haw", Name = "Hawaiian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "iw", Name = "Hebrew" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "hi", Name = "Hindi" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "hmn", Name = "Hmong" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "hu", Name = "Hungarian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "is", Name = "Icelandic" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ig", Name = "Igbo" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "id", Name = "Indonesian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ga", Name = "Irish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "it", Name = "Italian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ja", Name = "Japanese" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "jw", Name = "Javanese" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "kn", Name = "Kannada" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "kk", Name = "Kazakh" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "km", Name = "Khmer" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ko", Name = "Korean" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ku", Name = "Kurdish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ky", Name = "Kyrgyz" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "lo", Name = "Lao" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "la", Name = "Latin" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "lv", Name = "Latvian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "lt", Name = "Lithuanian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "lb", Name = "Luxembourgish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mk", Name = "Macedonian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mg", Name = "Malagasy" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ms", Name = "Malay" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ml", Name = "Malayalam" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mt", Name = "Maltese" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mi", Name = "Maori" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mr", Name = "Marathi" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "mn", Name = "Mongolian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "my", Name = "Myanmar (Burmese)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ne", Name = "Nepali" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "no", Name = "Norwegian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ny", Name = "Nyanja (Chichewa)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ps", Name = "Pashto" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "fa", Name = "Persian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "pl", Name = "Polish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "pt", Name = "Portuguese (Portugal, Brazil)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "pa", Name = "Punjabi" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ro", Name = "Romanian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ru", Name = "Russian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sm", Name = "Samoan" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "gd", Name = "Scots Gaelic" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sr", Name = "Serbian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "st", Name = "Sesotho" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sn", Name = "Shona" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sd", Name = "Sindhi" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "si", Name = "Sinhala (Sinhalese)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sk", Name = "Slovak" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sl", Name = "Slovenian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "so", Name = "Somali" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "es", Name = "Spanish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "su", Name = "Sundanese" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sw", Name = "Swahili" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "sv", Name = "Swedish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "tl", Name = "Tagalog (Filipino)" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "tg", Name = "Tajik" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ta", Name = "Tamil" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "te", Name = "Telugu" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "th", Name = "Thai" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "tr", Name = "Turkish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "uk", Name = "Ukrainian" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "ur", Name = "Urdu" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "uz", Name = "Uzbek" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "vi", Name = "Vietnamese" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "cy", Name = "Welsh" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "xh", Name = "Xhosa" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "yi", Name = "Yiddish" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "yo", Name = "Yoruba" });
			context.LanguageCodes.AddOrUpdate(e => e.Code, new Language { Code = "zu", Name = "Zulu" });

			context.SaveChanges();
		}
	}
}
