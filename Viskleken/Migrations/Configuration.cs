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
            context.Languages.AddOrUpdate(p => p.Id, new Language
            {
                Id = 1,
                Name = "1. Latin, javanesiska, gaeliska, kanaresiska, urdu"
            });

            context.Languages.AddOrUpdate(p => p.Id, new Language
            {
                Id = 2,
                Name = "2. Hebreiska, chichewa, gujarati, hindi, maori"
            });

            context.Languages.AddOrUpdate(p => p.Id, new Language
            {
                Id = 3,
                Name = "3. Polska, hmong, xhosa, pashto, isl�ndska"
            });

            context.Languages.AddOrUpdate(p => p.Id, new Language
            {
                Id = 4,
                Name = "4. Swahili, igbo, frisiska, tadzjikiska, sindhi"
            });

            context.Languages.AddOrUpdate(p => p.Id, new Language
            {
                Id = 5,
                Name = "5. Marathi, kirgiziska, tamil, esperanto, danska"
            });

            context.SaveChanges();
        }
    }
}
