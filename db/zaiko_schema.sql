--
-- File generated with SQLiteStudio v3.4.4 on Wed Jun 21 18:44:36 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Categories
DROP TABLE IF EXISTS Categories;

CREATE TABLE IF NOT EXISTS Categories (
    Id           INTEGER PRIMARY KEY ON CONFLICT ABORT AUTOINCREMENT
                         UNIQUE ON CONFLICT ABORT
                         NOT NULL ON CONFLICT ABORT,
    CategoryName TEXT    NOT NULL ON CONFLICT ABORT
                         UNIQUE ON CONFLICT ABORT
)
STRICT;


-- Table: RoleMemberships
DROP TABLE IF EXISTS RoleMemberships;

CREATE TABLE IF NOT EXISTS RoleMemberships (
    Id     INTEGER PRIMARY KEY ON CONFLICT ABORT AUTOINCREMENT
                   NOT NULL ON CONFLICT ABORT
                   UNIQUE ON CONFLICT ABORT,
    RoleId INT     REFERENCES Roles (Id) 
                   NOT NULL ON CONFLICT ABORT,
    UserId INT     REFERENCES Users (Id) 
                   NOT NULL ON CONFLICT ABORT
)
STRICT;


-- Table: Roles
DROP TABLE IF EXISTS Roles;

CREATE TABLE IF NOT EXISTS Roles (
    Id              INTEGER PRIMARY KEY ON CONFLICT ABORT AUTOINCREMENT
                            UNIQUE
                            NOT NULL,
    RoleName        TEXT    NOT NULL ON CONFLICT ABORT
                            UNIQUE ON CONFLICT ABORT,
    RoleDescription TEXT    NOT NULL
)
STRICT;


-- Table: SaleItems
DROP TABLE IF EXISTS SaleItems;

CREATE TABLE IF NOT EXISTS SaleItems (
    Id                   INTEGER PRIMARY KEY ON CONFLICT ABORT AUTOINCREMENT
                                 UNIQUE ON CONFLICT ABORT
                                 NOT NULL ON CONFLICT ABORT,
    SellerId             INT     REFERENCES Users (Id) 
                                 NOT NULL ON CONFLICT ABORT,
    CategoryId           INT     REFERENCES Categories (Id) 
                                 NOT NULL ON CONFLICT ABORT,
    AllowNegotiatedPrice INT     DEFAULT (0) 
                                 NOT NULL,
    MinimumPrice         REAL    NOT NULL
                                 DEFAULT (0.0),
    MaximumPrice         REAL    NOT NULL
                                 DEFAULT (0.0),
    Sold                 INT     NOT NULL
                                 DEFAULT (0),
    PurchasedPrice       REAL    NOT NULL
                                 DEFAULT (0.0),
    ItemShortDescription TEXT    NOT NULL,
    ItemLongDescription  TEXT,
    ItemPhoto            BLOB
)
STRICT;


-- Table: Users
DROP TABLE IF EXISTS Users;

CREATE TABLE IF NOT EXISTS Users (
    Id           INTEGER UNIQUE ON CONFLICT ABORT
                         PRIMARY KEY ON CONFLICT ABORT AUTOINCREMENT
                         NOT NULL ON CONFLICT ABORT,
    UserName     TEXT    NOT NULL
                         UNIQUE,
    IsLocked     INT     NOT NULL
                         DEFAULT (0),
    CreationDate INTEGER NOT NULL,
    Hash         TEXT    NOT NULL
                         DEFAULT deadbeef
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
