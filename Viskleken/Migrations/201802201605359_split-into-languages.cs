namespace Viskleken.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class splitintolanguages : DbMigration
    {
        public override void Up()
        {
			Sql("DELETE FROM dbo.Languages");
            DropPrimaryKey("dbo.Languages");
            AddColumn("dbo.Languages", "Code", c => c.String(nullable: false, maxLength: 5));
            AlterColumn("dbo.Languages", "Name", c => c.String(nullable: false, maxLength: 256));
            AddPrimaryKey("dbo.Languages", "Code");
            DropColumn("dbo.Languages", "Id");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Languages", "Id", c => c.Int(nullable: false, identity: true));
            DropPrimaryKey("dbo.Languages");
            AlterColumn("dbo.Languages", "Name", c => c.String());
            DropColumn("dbo.Languages", "Code");
            AddPrimaryKey("dbo.Languages", "Id");
        }
    }
}
