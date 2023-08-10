DROP DATABASE dotPet 
 
CREATE DATABASE dotPet 
GO 
 
 
 
USE dotPet 
GO 
 
DROP TABLE Animal 
CREATE TABLE Animal 
( 
id INT IDENTITY NOT NULL, 
tipoAnimal VARCHAR(50) NOT NULL, 
raca VARCHAR(50) NOT NULL, 
nome VARCHAR(100) NOT NULL, 
cor VARCHAR(20) NOT NULL, 
porte VARCHAR(20) NOT NULL, 
deficiencia VARCHAR(100) NOT NULL, 
sexo CHAR(1) NOT NULL, 
vacinas VARCHAR(100) NOT NULL, 
idade VARCHAR(20) NOT NULL, 
castrado CHAR(1) NOT NULL, 
descricao VARCHAR(100) NOT NULL, 
status_animal VARCHAR(8) NOT NULL,
 
PRIMARY KEY (id), 
) 
GO 
 
 
 
 
 
DROP TABLE Usuario 
 
CREATE TABLE Usuario 
( 
id INT IDENTITY NOT NULL, 
nome VARCHAR(100) NOT NULL, 
email VARCHAR(100) NOT NULL, 
senha VARCHAR(20) NOT NULL, 
telefone VARCHAR(25) NOT NULL, 
dt_nasc DATE NOT NULL, 
 
PRIMARY KEY (id), 
) 
GO 
 
 
 
 
 
DROP TABLE Adotante 
 
CREATE TABLE Adotante 
( 
id INT IDENTITY NOT NULL, 
nome VARCHAR(100) NOT NULL, 
sexo CHAR(1) NOT NULL, 
numero_resid VARCHAR(100) NOT NULL, 
complemento VARCHAR(100) NULL, 
cep CHAR(8) NOT NULL, 
logradouro VARCHAR(100) NOT NULL,
bairro VARCHAR(100) NOT NULL, 
cidade VARCHAR(100) NOT NULL, 
uf CHAR(2) NOT NULL, 
dt_nasc DATE NOT NULL, 
tipo_residenc VARCHAR(100) NOT NULL, 
telefone VARCHAR(25) NOT NULL, 
email VARCHAR(100) NOT NULL, 
cpf VARCHAR(11) NOT NULL, 
trabalho CHAR(1) NOT NULL, 
periodo_trab VARCHAR(100) NULL, 
usuario_id INT NOT NULL, 
 
PRIMARY KEY (id), 
FOREIGN KEY (usuario_id) 
REFERENCES Usuario(id) 
) 
GO 
 
 
 
 
 
DROP TABLE Cargo 
 
CREATE TABLE Cargo 
( 
id INT IDENTITY NOT NULL, 
nomeCargo VARCHAR(100) NOT NULL, 
 
PRIMARY KEY (id), 
) 
GO 
 
 
 
 
 
DROP TABLE Funcionario 
 
CREATE TABLE Funcionario 
( 
 id INT IDENTITY NOT NULL, 
 cargo_id INT NOT NULL, 
 nome VARCHAR(100) NOT NULL, 
 cpf CHAR(11) NOT NULL, 
 rg VARCHAR(12) NOT NULL, 
 sexo CHAR(1) NOT NULL, 
 dataNasc DATE NOT NULL, 
 telefone VARCHAR(25) NOT NULL, 
 email VARCHAR(100) NOT NULL, 
 logradouro VARCHAR(100) NOT NULL, 
 numero_resid VARCHAR(10) NOT NULL, 
 complemento VARCHAR(100) NULL, 
 cep CHAR(8) NOT NULL, 
 bairro VARCHAR(100) NOT NULL, 
 cidade VARCHAR(100) NOT NULL, 
 uf CHAR(2) NOT NULL, 
 senha VARCHAR(10) NOT NULL,
PRIMARY KEY (id), 
FOREIGN KEY (cargo_id) 
REFERENCES Cargo (id) 
) 
GO 
 
 
 
 
 
DROP TABLE Adoção 
 
CREATE TABLE Adoção 
(
id INT IDENTITY NOT NULL, 
adotante_id INT NOT NULL, 
animal_id INT NOT NULL, 
funcionario_Id INT NOT NULL, 
data_adoção DATE NOT NULL, 
observações VARCHAR(100) NULL, 
 
PRIMARY KEY (id), 
FOREIGN KEY (adotante_id) 
REFERENCES Adotante (id), 
FOREIGN KEY (animal_id) 
REFERENCES Animal (id), 
FOREIGN KEY (funcionario_id) 
REFERENCES Funcionario (id), 
) 
GO 
 
 
 
 
 
DROP TABLE Agenda 
 
CREATE TABLE Agenda 
( 
id INT IDENTITY NOT NULL, 
status_visita VARCHAR(8) NOT NULL,
data_visita DATE NOT NULL, 
observações VARCHAR(100) NULL, 
funcionario_id INT NOT NULL, 
usuario_id INT NOT NULL, 
 
PRIMARY KEY (id), 
FOREIGN KEY (funcionario_id) 
REFERENCES Funcionario(id), 
FOREIGN KEY (usuario_id) 
REFERENCES Usuario(id) ,
 
) 
GO 
 
 
SELECT * FROM Animal 
DELETE from Animal WHERE id=1; 
 
INSERT INTO Animal VALUES ('gato porte medio','vira-lata','jubileu','cinza','medio','n','m','vacina de 
raiva e contra PIF','5 anos','s','muito dócil','inativo') 
GO 
INSERT INTO Animal VALUES ('cachorro porte pequeno','viralata','Bucky','marrom','pequeno','n','m','vacina de raiva e contra PIF','3 anos','s','muito dócil','ativo') 
GO 
INSERT INTO Animal VALUES ('cachorro porte medio','vira-lata','Floquinho','branco e 
preto','medio','n','m','vacina de raiva e contra PIF','4 anos','s','muito dócil','inativo') 
GO
UPDATE
 Animal
SET
 status_animal = 'inativo'
WHERE
 id = 1
 
 
 
SELECT * FROM Usuario 
DELETE from Usuario WHERE id=4; 
 
INSERT INTO Usuario VALUES ('Maria Antonia 
Castro','mariacastro1@gmail.com','maria12345?','11987674532','12/09/1980') 
GO 
INSERT INTO Usuario VALUES ('Manoel 
Gomes','man0elg0mes@gmail.com','manoel12345','11956435567','15/12/2000') 
GO 
 
 
SELECT * FROM Adotante 
DELETE from Adotante WHERE id=4; 
 
INSERT INTO Adotante VALUES ('Maria Antonia Castro', 'f','123','casa 2','12345665','rua 
alcantra','jardim 
doria','barueri','sp','12/09/1980','casa','11987674532','mariacastro1@gmail.com','45654345676','s','
meio','1') 
GO 
INSERT INTO Adotante VALUES ('Manoel Gomes', 'm','242','torre 22','12345665','rua marcia','parque 
dos 
rezendes','barueri','sp','15/12/2000','casa','11956435567','man0elg0mes@gmail.com','45654345676
','s','meio','2') 
GO 
 
 
 
SELECT * FROM Cargo 
DELETE from Cargo WHERE id=6; 
 
INSERT INTO Cargo VALUES ('ajudante de limpeza') 
GO 
INSERT INTO Cargo VALUES ('atendente') 
GO 
INSERT INTO Cargo VALUES ('cuidador dos animais') 
GO
INSERT INTO Cargo VALUES ('analista de sistema') 
GO 
 
 
 
SELECT * FROM Funcionario 
DELETE from Funcionario WHERE id=4; 
 
INSERT INTO Funcionario VALUES ('3','Jeferson 
barbosa','54787654356','1234567','m','12/12/2000','11986352413','jefbarbosa@gmail.com','rua 
aurea','87','casa 1','13241100','parque dos jardins','osasco','SP','1111') 
GO 
INSERT INTO Funcionario VALUES ('1','Maria 
Rui','54787654378','1234567','f','06/02/1984','11985987634','mariarui@gmail.com','rua 
anhaguera','45','','06436100','parque dos camarões','carapicuiba','SP','2222') 
GO 
INSERT INTO Funcionario VALUES ('2','Miguel 
Batista','54787654345','12345622','m','01/03/1997','11923433442','mibatista@gmail.com','avenida 
zelia','333','casa 2','97543100','parque dos camargos','barueri','SP','3333') 
GO 
INSERT INTO Funcionario VALUES ('7','Ana Julia Nunes 
Melo','54798071889','12345622','f','18/12/20005','11960781793','anajulia@gmail.com','rua 
regina','232','casa 3','06436100','parque dos camargos','barueri','SP','4444') 
GO
 
 
 
SELECT * FROM Adoção 
DELETE from Adoção WHERE id=7; 
 
INSERT INTO Adoção VALUES ('1','3','1','2021/11/30','') 
GO 
INSERT INTO Adoção VALUES ('2','1','2','2022/01/12','') 
GO 
 
 
 
SELECT * FROM Agenda 
DELETE from Agenda WHERE id=2; 
 
INSERT INTO Agenda VALUES ('ativo','2021/11/30','','4','1') 
GO 
INSERT INTO Agenda VALUES ('inativo','2022/01/12','','4','2') 
GO 
