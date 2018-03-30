

CREATE TABLE "Construtor"(
  "Nome" VARCHAR2(30 CHAR) PRIMARY KEY,
  "Construção Amadora" VARCHAR(3 CHAR)
) TABLESPACE JMsDB;


CREATE TABLE "Aeroporto "(
  "Nome" VARCHAR2(30 CHAR) PRIMARY KEY,
  "Pais" VARCHAR2(30 CHAR) PRIMARY KEY,
  "Região" VARCHAR2(30 CHAR) PRIMARY KEY,
  "Estado" VARCHAR2(25 CHAR) PRIMARY KEY,
  "Código Aeroporto" VARCHAR(25 CHAR)
) TABLESPACE JMsDB;


CREATE TABLE "Acidente "(
  "Tipo de Investigação" VARCHAR2(10 CHAR) PRIMARY KEY,
  "Número do Acidente" VARCHAR2(15 CHAR) PRIMARY KEY,
  "Latitude" NUMBER(8,6),
  "Longitude" NUMBER(9,6),
  "Fase de Voo" VARCHAR2(15 CHAR),
  "Data do Acidente" DATE,
  "Dano Causado" VARCHAR2(13 CHAR),
  "Severidade do Acidente" VARCHAR2(13 CHAR),
  "Condições Atmosféricas" VARCHAR2(3 CHAR),
  "Total de Feridos Fatais" NUMBER(2),
  "Total de Feridos Sérios" NUMBER(2),
  "Total de Feridos Menores" NUMBER(2),
  "Total de Feridos Ilesos" NUMBER(3)
) TABLESPACE JMsDB;


CREATE TABLE "Investigador "(
"Investigador" VARCHAR2(50 CHAR) PRIMARY KEY,
"Crachá" VARCHAR2(10 CHAR)
"Morada" VARCHAR2(100 CHAR)
) TABLESPACE JMsDB;

CREATE TABLE "Transportadora "(
"Transportadora" VARCHAR2(20) PRIMARY KEY,
"Código" VARCHAR2(5 CHAR),
"Demonização Completa" VARCHAR2(20 CHAR),
"Pais" VARCHAR2(15 CHAR)
) TABLESPACE JMsDB;

CREATE TABLE "Investigação "(
  "Investigador" VARCHAR2(50 CHAR) FOREIGN KEY REFERENCES "Investigador"("Investigador"),
  "Tipo de Investigação" VARCHAR2(10 CHAR) FOREIGN KEY REFERENCES "Acidente"("Tipo de Investigação"),
  "Número do Acidente" VARCHAR2(15 CHAR) FOREIGN KEY REFERENCES "Acidente"("Número de Acidente"),
  "Data de Inicio" DATE,
  "Data de Fim" DATE,
  "Estado" VARCHAR2(15 CHAR)
) TABLESPACE JMsDB;


CREATE TABLE "Voo "(
  "Identificador Aeronave" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Aeronave"("Registo"),
  "Nome Aeroporto" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Aeroporto"("Nome"),
  "Pais" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Aeroporto"("Pais"),
  "Região" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Aeroporto"("Região"),
  "Estado" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Aeroporto"("Estado"),
  "Transportadora Aérea"  VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Transportadora"("Transportadora"),
  "Tipo de Voo" VARCHAR2(30 CHAR),
  "Propósito de Voo" VARCHAR2(30 CHAR)
) TABLESPACE JMsDB;

CREATE TABLE "Aeronave "(
  "Registo" VARCHAR2(6 CHAR) PRIMARY KEY,
  "Nome Construtor" VARCHAR2(30 CHAR) FOREIGN KEY REFERENCES "Construtor"("Nome"),
  "Categoria" VARCHAR2(25 CHAR),
  "Modelo" VARCHAR2(25 CHAR),
  "Tipo de Motor" VARCHAR(25 CHAR),
  "Numero de Motores" NUMBER
) TABLESPACE JMsDB;
