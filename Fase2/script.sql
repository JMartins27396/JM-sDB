
CREATE TABLE "Construtor"(
  "Nome" VARCHAR2(30 CHAR) PRIMARY KEY,
  "Construção Amadora" VARCHAR(3 CHAR)
) TABLESPACE JMsDB;



CREATE TABLE "Aeroporto"(
  "Nome" VARCHAR2(30 CHAR),
  "Pais" VARCHAR2(30 CHAR),
  "Região" VARCHAR2(30 CHAR),
  "Estado" VARCHAR2(25 CHAR),
  "Código Aeroporto" VARCHAR(25 CHAR),
  CONSTRAINT "chaves primarias Aeroporto" primary key("Nome","Pais", "Região","Estado")
) TABLESPACE JMsDB;



CREATE TABLE "Acidente"(
  "Tipo de Investigação" VARCHAR2(10 CHAR),
  "Número do Acidente" VARCHAR2(15 CHAR),
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
  "Total de Feridos Ilesos" NUMBER(3),
  CONSTRAINT "chaves primarias Aeroporto" primary key("Tipo de Investigação","Número do Acidente")
) TABLESPACE JMsDB;


CREATE TABLE "Investigador"(
"Investigador" VARCHAR2(50 CHAR) PRIMARY KEY,
"Crachá" VARCHAR2(10 CHAR),
"Morada" VARCHAR2(100 CHAR)
) TABLESPACE JMsDB;

CREATE TABLE "Transportadora"(
"Transportadora" VARCHAR2(20) PRIMARY KEY,
"Código" VARCHAR2(5 CHAR),
"Demonização Completa" VARCHAR2(20 CHAR),
"Pais" VARCHAR2(15 CHAR)
) TABLESPACE JMsDB;


CREATE TABLE "Investigação"(
  "Investigador" VARCHAR2(50 CHAR),
  "Tipo de Investigação" VARCHAR2(10 CHAR),
  "Número do Acidente" VARCHAR2(15 CHAR),
  "Data de Inicio" DATE,
  "Data de Fim" DATE,
  "Estado" VARCHAR2(15 CHAR),
  CONSTRAINT "CE Investigador" FOREIGN KEY("Investigador") REFERENCES "Investigador"("Investigador"),
  CONSTRAINT "CE Acidente" FOREIGN KEY("Tipo de Investigação", "Número do Acidente") REFERENCES "Acidente"("Número do Acidente", "Tipo de Investigação")
) TABLESPACE JMsDB;

CREATE TABLE "Aeronave"(
  "Registo" VARCHAR2(6 CHAR),
  "Nome Construtor" VARCHAR2(30 CHAR),
  "Categoria" VARCHAR2(25 CHAR),
  "Modelo" VARCHAR2(25 CHAR),
  "Tipo de Motor" VARCHAR(25 CHAR),
  "Numero de Motores" NUMBER(1),
  CONSTRAINT "CP aeronave" PRIMARY KEY("Registo"),
  CONSTRAINT "CE Construtor" FOREIGN KEY("Nome Construtor") REFERENCES "Construtor"("Nome")

) TABLESPACE JMsDB;

CREATE TABLE "Voo"(
  "Identificador Aeronave" VARCHAR2(30 CHAR),
  "Nome Aeroporto" VARCHAR2(30 CHAR),
  "Pais" VARCHAR2(30 CHAR),
  "Região" VARCHAR2(30 CHAR),
  "Estado" VARCHAR2(30 CHAR),
  "Transportadora Aérea"  VARCHAR2(30 CHAR),
  "Tipo de Voo" VARCHAR2(30 CHAR),
  "Propósito de Voo" VARCHAR2(30 CHAR),
  CONSTRAINT "CE Aeronave" FOREIGN KEY("Identificador Aeronave") REFERENCES "Aeronave"("Registo"),
  CONSTRAINT "CE Aeroporto" FOREIGN KEY("Nome Aeroporto", "Pais","Região", "Estado") REFERENCES "Aeroporto"("Nome", "Pais","Região", "Estado"),
  CONSTRAINT "CE Transportadora" FOREIGN KEY("Transportadora Aérea") REFERENCES "Transportadora"("Transportadora")
) TABLESPACE JMsDB;