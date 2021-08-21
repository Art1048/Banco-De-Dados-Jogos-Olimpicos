 CREATE TABLE Atletas(
     id_atleta INTEGER,
     Nome CHARACTER,
     Peso FLOAT,
     Altura FLOAT,
     Idade INTEGER,
     id_treinador INTEGER,
     PRIMARY KEY(id_atleta),
     FOREIGN KEY(id_treinador) REFERENCES Treinadores(id_treinador)
 );

 CREATE TABLE Atletas_Medalistas(
       id_atleta INTEGER,
       Potucao FLOAT,
       PRIMARY KEY(id_atleta),
       FOREIGN KEY (id_atleta) REFERENCES Atletas(id_atleta) ON DELETE CASCADE
 );
 
 CREATE TABLE Atletas_Não_Medalistas(
       id_atleta INTEGER,
       Potucao FLOAT,
       PRIMARY KEY(id_atleta),
       FOREIGN KEY (id_atleta) REFERENCES Atletas(id_atleta) ON DELETE CASCADE
 );
 
 CREATE TABLE Medalhas(
       id_medalha INTEGER,
       Cor CHAR,
       Classificacao CHAR,
       PRIMARY KEY(id_medalha)
 );
 
 CREATE TABLE Tem_Medalha_A(
       id_medalha INTEGER,
       id_atleta INTEGER,
       PRIMARY KEY(id_medalha),
       FOREIGN KEY (id_atleta) REFERENCES Atletas_Medalistas(id_atleta)
 );
 
 CREATE TABLE Modalidades(
       Codigo INTEGER,
       Nome CHAR,
       Dat DATE,
       PRIMARY KEY(Codigo)
 );
 
 CREATE TABLE Tem_Medalha_M(
       id_medalha INTEGER,
       Codigo INTEGER,
       PRIMARY KEY(id_medalha),
       FOREIGN KEY (Codigo) REFERENCES Modalidades(Codigo)
 );
 
 CREATE TABLE Participa(
       Codigo INTEGER,
       id_atleta INTEGER,
       PRIMARY KEY(Codigo , id_atleta),
       FOREIGN KEY (Codigo) REFERENCES Modalidades(Codigo),
       FOREIGN KEY (id_atleta) REFERENCES Atletas(id_atleta)
 );
 
 CREATE TABLE Treinadores(
       id_treinador INTEGER,
       Nome CHAR,
       Idade INTEGER,
       PRIMARY KEY(id_treinador)
 );
 
 CREATE TABLE Paises(
       Nome CHAR,
       Lingua CHAR,
       Bandeira CHAR,
       PRIMARY KEY(Nome)
 );
 
 CREATE TABLE Pertence_T(
       Nome CHAR,
       id_treinador INTEGER,
       PRIMARY KEY(id_treinador),
       FOREIGN KEY (Nome) REFERENCES Paises(Nome)
);

CREATE TABLE Pertence_A(
       Nome CHAR,
       id_atleta INTEGER,
       PRIMARY KEY(id_atleta),
       FOREIGN KEY (Nome) REFERENCES Paises(Nome)
);
 
 CREATE TABLE Pais_Sede(
       Nome CHAR,
       Ano_Edicao YEAR,
       PRIMARY KEY(Nome , Ano_Edicao),
       FOREIGN KEY (Nome) REFERENCES Paises(Nome)
 );
 
 CREATE TABLE Localidade(
       Nome_Local CHAR,
       Cidade CHAR,
       Estado CHAR UNIQUE,
       PRIMARY KEY (Nome)
 );
 
 CREATE TABLE Reside(
	  Nome_Local CHAR,
      Nome CHAR,
      PRIMARY KEY(Nome_Local),
      FOREIGN KEY (Nome) REFERENCES Pais_Sede(Nome)
);

CREATE TABLE Acontece(
     Nome_Local CHAR,
     Codigo INTEGER,
     PRIMARY KEY(Codigo),
     FOREIGN KEY (Nome_Local) REFERENCES Localidade(Nome_Local)
);
 
 CREATE TABLE Jurados(
        id_jurados INTEGER,
        Nome CHAR,
        idade INTEGER,
        PRIMARY KEY (id_jurados)
 );
 
 CREATE TABLE Jornalistas(
        CPF CHAR,
        Nome CHAR,
        idade INTEGER,
        PRIMARY KEY(CPF)
 );
 
 CREATE TABLE Imprensa(
		CNPF CHAR,
        Nome CHAR,
        Tipo CHAR,
        PRIMARY KEY(CNPJ)
 );
 
 CREATE TABLE Possui(
       CNPF CHAR,
       CPF CHAR,
       PRIMARY KEY(CPF),
       FOREIGN KEY (CNPF) REFERENCES Imprensa(CNPF)
 );
 
 CREATE TABLE Da_nota(
       id_jurados INTEGER,
       Codigo INTEGER,
       PRIMARY KEY(id_jurados , Codigo),
       FOREIGN KEY (id_jurados) REFERENCES Jurados(id_jurados),
       FOREIGN KEY (Codigo) REFERENCES Modalidades(Codigo)
 );
 
 CREATE TABLE Cobre(
       CPF CHAR,
       Codigo INTEGER,
       PRIMARY KEY(CPF , Codigo),
       FOREIGN KEY (CPF) REFERENCES Jornalistas(CPF),
       FOREIGN KEY (Codigo) REFERENCES Modalidades(Codigo)
 );
 