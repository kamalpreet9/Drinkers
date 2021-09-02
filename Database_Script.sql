-- Script Date: 1/09/2021 11:36 pm  - ErikEJ.SqlCeScripting version 3.5.2.90
-- Database information:
-- Database: C:\Users\atind\source\repos\Drinkers\Drinkers.db
-- ServerVersion: 3.35.5
-- DatabaseSize: 36 KB
-- Created: 1/09/2021 10:32 pm

-- User Table information:
-- Number of tables: 4
-- __EFMigrationsHistory: -1 row(s)
-- Categories: -1 row(s)
-- Order: -1 row(s)
-- Product: -1 row(s)

SELECT 1;
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE [Product] (
  [Id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Name] text NOT NULL
, [Price] text NOT NULL
);
CREATE TABLE [Categories] (
  [Id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [Name] text NOT NULL
, [Description] text NULL
);
CREATE TABLE [Order] (
  [Id] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
, [CategoriesId] bigint NOT NULL
, [ProductId] bigint NOT NULL
, [Qty] bigint NOT NULL
, CONSTRAINT [FK_Order_0_0] FOREIGN KEY ([ProductId]) REFERENCES [Product] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
, CONSTRAINT [FK_Order_1_0] FOREIGN KEY ([CategoriesId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE ON UPDATE NO ACTION
);
CREATE TABLE [__EFMigrationsHistory] (
  [MigrationId] text NOT NULL
, [ProductVersion] text NOT NULL
, CONSTRAINT [sqlite_autoindex___EFMigrationsHistory_1] PRIMARY KEY ([MigrationId])
);
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
1,' Dancing Gopher Fruit Hazy ','34.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
2,'Hoppy Gilmore West Coast ''Green'' IPA ','45.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
3,'NZ Lagar','32.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
4,'Corona','34.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
5,'Heinken','12.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
6,'CHAMPAGNE','45.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
7,'SPARKLING','56.0');
INSERT INTO [Product] ([Id],[Name],[Price]) VALUES (
8,'SAUVIGNON BLANC','44.0');
INSERT INTO [Categories] ([Id],[Name],[Description]) VALUES (
1,'Beer','Beer is the most popular alcoholic beverage worldwide. In fact, after water and tea, beer is the most commonly-consumed drink in the world. Beer is also most likely the oldest alcoholic drink in history. A standard beer, whether it be a lager or an ale, has between 4% to 6% ABV, although some beers have higher or lower concentrations of alcohol. For example, “light beers” only have between 2% to 4% ABV while “malt liquors” have between 6% to 8%.');
INSERT INTO [Categories] ([Id],[Name],[Description]) VALUES (
2,'Wine','Wine is another popular and ancient alcoholic beverage. Standard wine has less than 14% ABV. Champagne, the most well-known sparkling wine, has an alcohol concentration of about 10% to 12%. Some wines are “fortified” with distilled alcohol. Port, Madeira, Marsala, Vermouth, and Sherry are examples of fortified wines. They usually have about 20% ABV');
INSERT INTO [Categories] ([Id],[Name],[Description]) VALUES (
3,'Gin','Gin is a spirit made from juniper berries. It can have anywhere from 35% to 55% ABV.');
INSERT INTO [Categories] ([Id],[Name],[Description]) VALUES (
4,'Brandy','Brandy is distilled wine. The concentration of alcohol in brandy ranges from 35% to 60%. For example, one famous brandy, Cognac, has 40% ABV.');
INSERT INTO [Categories] ([Id],[Name],[Description]) VALUES (
5,'Whiskey','Whiskey is a spirit made from  fermented grain. The ABV of whiskey ranges from 40% to 50%.');
INSERT INTO [Order] ([Id],[CategoriesId],[ProductId],[Qty]) VALUES (
1,3,5,456);
INSERT INTO [Order] ([Id],[CategoriesId],[ProductId],[Qty]) VALUES (
2,1,5,667);
INSERT INTO [__EFMigrationsHistory] ([MigrationId],[ProductVersion]) VALUES (
'20210901103127_initail','5.0.9');
CREATE INDEX [Order_IX_Order_ProductId] ON [Order] ([ProductId] ASC);
CREATE INDEX [Order_IX_Order_CategoriesId] ON [Order] ([CategoriesId] ASC);
CREATE TRIGGER [fki_Order_ProductId_Product_Id] BEFORE Insert ON [Order] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Insert on table Order violates foreign key constraint FK_Order_0_0') WHERE (SELECT Id FROM Product WHERE  Id = NEW.ProductId) IS NULL; END;
CREATE TRIGGER [fku_Order_ProductId_Product_Id] BEFORE Update ON [Order] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Update on table Order violates foreign key constraint FK_Order_0_0') WHERE (SELECT Id FROM Product WHERE  Id = NEW.ProductId) IS NULL; END;
CREATE TRIGGER [fki_Order_CategoriesId_Categories_Id] BEFORE Insert ON [Order] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Insert on table Order violates foreign key constraint FK_Order_1_0') WHERE (SELECT Id FROM Categories WHERE  Id = NEW.CategoriesId) IS NULL; END;
CREATE TRIGGER [fku_Order_CategoriesId_Categories_Id] BEFORE Update ON [Order] FOR EACH ROW BEGIN SELECT RAISE(ROLLBACK, 'Update on table Order violates foreign key constraint FK_Order_1_0') WHERE (SELECT Id FROM Categories WHERE  Id = NEW.CategoriesId) IS NULL; END;
COMMIT;

