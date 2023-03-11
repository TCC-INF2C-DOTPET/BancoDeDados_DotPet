DROP DATABASE dotPet

CREATE DATABASE dotPet
GO



USE dotPet
GO


DROP TABLE Animal 
	
	CREATE TABLE Animal
(
	id					INT IDENTITY	NOT NULL,
	tipoAnimal			VARCHAR(10)		NOT NULL,
	raca				VARCHAR(50)		NOT NULL,
	nome				VARCHAR(100)	NOT NULL,
	cor					VARCHAR(20)		NOT NULL,
	porte				VARCHAR(20)		NOT NULL,
	deficiencia			CHAR(1)			NOT NULL,
	sexo				CHAR(1)			NOT NULL, 
	vacinado			CHAR(1)			NOT NULL,
	dt_registro			DATE			NOT NULL,
	castrado			CHAR(1)			NOT NULL,
	status				CHAR(1)			NOT NULL,
	descricao			TEXT			NOT NULL,

	PRIMARY KEY (id),
)




DROP TABLE Usuario

	CREATE TABLE Usuario
(
	id					INT IDENTITY	NOT NULL,
	nome 				VARCHAR(100)	NOT NULL,
	tipo				CHAR(1)			NOT NULL,
	email				VARCHAR(100)	NOT NULL,
	senha				VARCHAR(20)		NOT NULL,
	telefone			VARCHAR(25)		NOT NULL,
	dt_nasc				DATE			NOT NULL, 

	PRIMARY KEY (id),
)




DROP TABLE Adotante 

	CREATE TABLE Adotante
(
	id					INT IDENTITY	NOT NULL,
	nome				VARCHAR(100)	NOT NULL,
	sexo				CHAR(1)			NOT NULL,
	logradouro			VARCHAR(100)	NOT NULL,
	numero_resid		VARCHAR(100)	NOT NULL,
	complemento			VARCHAR(100)	NULL,
	cep					CHAR(8)			NOT NULL,
	bairro				VARCHAR(100)	NOT NULL,
	cidade				VARCHAR(100)	NOT NULL,
	uf					CHAR(2)			NOT NULL,
	dt_nasc				DATE			NOT NULL,
	tipo_residenc		VARCHAR(100)	NOT NULL,
	telefone			VARCHAR(25)		NOT NULL,
	email				VARCHAR(100)	NOT NULL,
	cpf					VARCHAR(11)		NOT NULL,
	trabalho			CHAR(1)			NOT NULL,
	periodo_trab		VARCHAR(100)	NULL,
	usuario_id			INT				NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) 
		REFERENCES Usuario(id)
)




DROP TABLE Cargo 

	CREATE TABLE Cargo
(
	id					INT	IDENTITY	NOT NULL,
	nomeCargo			VARCHAR(100)	NOT NULL,

	PRIMARY KEY (id),
)



DROP TABLE Funcionario

	CREATE TABLE Funcionario
(
   id				INT IDENTITY				NOT NULL,
   cargo_id			INT							NOT NULL,
   nome				VARCHAR(100)				NOT NULL,
   cpf				CHAR(11)					NOT NULL,
   rg				VARCHAR(12)					NOT NULL,
   sexo				CHAR(1)						NOT NULL,
   dataNasc			DATE						NOT NULL,
   telfone			VARCHAR(25)					NOT NULL,
   email			VARCHAR(100)				NOT NULL,
   logradouro		VARCHAR(100)				NOT NULL, -- nome da rua, avenida e etc --
   numero_resid		VARCHAR(10)					NOT NULL,
   complemento		VARCHAR(100)				NULL,
   cep				CHAR(8)						NOT NULL,
   bairro			VARCHAR(100)				NOT NULL,
   cidade			VARCHAR(100)				NOT NULL,
   uf				CHAR(2)						NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (cargo_id) 
		REFERENCES Cargo (id)
)



DROP TABLE Adoção

	CREATE TABLE Adoção
(	
	id				INT IDENTITY	NOT NULL,
	adotante_id		INT				NOT NULL,
	animal_id		INT				NOT NULL,
	funcionario_Id	INT				NOT NULL,
	data_adoção		DATE			NOT NULL,
	observações		VARCHAR(100)	NULL,

	PRIMARY KEY (id),

	FOREIGN KEY (adotante_id)
		REFERENCES Adotante (id),

	FOREIGN KEY (animal_id) 
		REFERENCES Animal (id),

	FOREIGN KEY (funcionario_id) 
		REFERENCES Funcionario (id),
)

DROP TABLE Agenda 

	CREATE TABLE Agenda
(
	id					INT IDENTITY	NOT NULL,
	nome 				VARCHAR(100)	NOT NULL,
	cpf					CHAR(11)		NOT NULL,
	telefone			VARCHAR(25)		NOT NULL,
	data_visita			SMALLDATETIME	NOT NULL,
	observações			VARCHAR(100)	NOT NULL,
	funcionario_id		INT				NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (funcionario_id) 
		REFERENCES Funcionario(id)

)