CREATE DATABASE IF NOT EXISTS ClubDeportivoDB;

USE ClubDeportivoDB;

CREATE TABLE DEMARCACION (
    CodDem INT PRIMARY KEY,
    Demarcacion VARCHAR(50) NOT NULL
);

CREATE TABLE PAISES (
    CodPais INT PRIMARY KEY,
    Nombrepais VARCHAR(100) NOT NULL,
    Comunitario BOOLEAN NOT NULL
);

CREATE TABLE JUGADORES (
    CodJugador INT PRIMARY KEY,
    CodClub INT NOT NULL,
    dorsal TINYINT NOT NULL,
    CodPais INT NOT NULL,
    CodDem INT NOT NULL,
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub),
    FOREIGN KEY (CodPais) REFERENCES PAISES(CodPais),
    FOREIGN KEY (CodDem) REFERENCES DEMARCACION(CodDem)
);

CREATE TABLE CLUBES (
    CodClub INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Poblacion VARCHAR(100),
    Provincia VARCHAR(100),
    CosPostal VARCHAR(10),
    Tlfno VARCHAR(15),
    Colores VARCHAR(50),
    Himno VARCHAR(100),
    Fax VARCHAR(15),
    AñoFundacion YEAR,
    Presupuesto DECIMAL(15, 2),
    Presidente VARCHAR(100),
    Vicepresidente VARCHAR(100)
);

CREATE TABLE SOCIOS (
    NumSocio INT PRIMARY KEY,
    CodClub INT NOT NULL,
    Codpost VARCHAR(10),
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Provincia VARCHAR(100),
    FechaAlta DATE,
    CuotaActual DECIMAL(10, 2),
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub)
);

CREATE TABLE EQUIPACION (
    CodEquip INT PRIMARY KEY,
    Encasa BOOLEAN NOT NULL,
    CodClub INT NOT NULL,
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub)
);

CREATE TABLE PALMARES (
    CodClub INT,
    CodTrofeo INT,
    Año YEAR,
    PRIMARY KEY (CodClub, CodTrofeo),
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub),
    FOREIGN KEY (CodTrofeo) REFERENCES CAMPEONATO(CodTrofeo)
);

CREATE TABLE CAMPEONATO (
    CodTrofeo INT PRIMARY KEY,
    NombreTrofeo VARCHAR(100) NOT NULL
);

CREATE TABLE ENTRENADORES (
    CodEntren INT PRIMARY KEY,
    Entrenador VARCHAR(100) NOT NULL,
    FechaNcmto DATE,
    Poblacion VARCHAR(100),
    Provincia VARCHAR(100)
);

CREATE TABLE ENTREN_CLUBES (
    CodClub INT,
    CodEntren INT,
    PRIMARY KEY (CodClub, CodEntren),
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub),
    FOREIGN KEY (CodEntren) REFERENCES ENTRENADORES(CodEntren)
);

CREATE TABLE CLUB_JUG (
    CodJugador INT,
    CodClub INT,
    Liga VARCHAR(100),
    PRIMARY KEY (CodJugador, CodClub),
    FOREIGN KEY (CodJugador) REFERENCES JUGADORES(CodJugador),
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub)
);

CREATE TABLE ESTADIOS (
    CodEstadio INT PRIMARY KEY,
    Estadio VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    CodPostal VARCHAR(10),
    Poblacion VARCHAR(100),
    Provincia VARCHAR(100),
    Capacidad INT,
    Sentados INT,
    Inauguracion YEAR,
    Dimensiones VARCHAR(50),
    CodClub INT,
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub)
);

CREATE TABLE SPONSOR (
    CodEspon INT PRIMARY KEY,
    Esponsor VARCHAR(100) NOT NULL,
    CodClub INT NOT NULL,
    FOREIGN KEY (CodClub) REFERENCES CLUBES(CodClub)
);
