-- Таблица BD_biblio содержит данные книжных библиотек филиалов России с возможностью
-- получать список все книг
-- получать список книг по фильтрам (автор, филиал)
-- добавлять новую книгу
-- получать список филиалов
-- получать список мест хранения в филиале
-- удалять книгу
-- редактировать данные о книге

--------------------------------------------------------------------------------

-- Таблица книг--
DROP TABLE IF EXISTS Book;
CREATE TABLE Book (
  BookID int AUTO_INCREMENT not null,
  BookName varchar(128) not null,
  BookYear decimal(4,0) not null,
  BookPublish varchar(128) not null,
  BookAuthor varchar(128) not null,
  BookSheets decimal(4,0) not null,
  BookLemma varchar(max) not null,

  primary key (BookID)
);



-- Таблица филиалов--
DROP TABLE IF EXISTS Filial;
CREATE TABLE Filial (
  FilialID int AUTO_INCREMENT not null,
  FilialName varchar(128) not null,
  FilialPhone decimal(12,0) not null,
  FilialBookQuantity decimal(10,0) not null,

  primary key (FilialID)
);



--Таблица мест хранения в библиотеке филиала--
DROP TABLE IF EXISTS Place;
CREATE TABLE Place (
  PlaceID int AUTO_INCREMENT not null,
  PlaceNubmer varchar(10) not null,
  FilialID int not null,

  primary key (PlaceID),

  foreign key (FilialID) references Filial(FilialID)
);


--Таблица тематических разделов--
DROP TABLE IF EXISTS Theme;
CREATE TABLE Theme (
  ThemeID int AUTO_INCREMENT not null,
  Theme varchar(128) not null,

  primary key (ThemeID)
);


--Таблица списка книг филиала
DROP TABLE IF EXISTS BookFilial;
CREATE TABLE BookFilial (
  BookFilialID int AUTO_INCREMENT not null,
  BookID int not null,
  FilialID int not null,
  ThemeID int not null,
  PlaceID int not null,
  BookFilialQuantity decimal(3,0) not null,
  BookFilialComments varchar(128) not null,

  primary key BookFilialID

  foreign key (BookID) references Book(BookID)
  foreign key (FilialID) references Filial(FilialID)
  foreign key (ThemeID) references Theme(ThemeID)
  foreign key (PlaceID) references Place(PlaceID)
);

	
