CREATE DATABASE Academico;
GO

USE Academico;
GO

CREATE TABLE Cursos
(
	Id INT IDENTITY,
	Codigo CHAR(3) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Cursos PRIMARY KEY(Id),
	CONSTRAINT UQ_Cursos UNIQUE(Codigo)
);
GO

CREATE TABLE Instrutores
(
	Id INT IDENTITY,
	Nome VARCHAR(30) NOT NULL,
	Idade INT NOT NULL,
	Telefone VARCHAR(14) NULL,
	Sexo CHAR(1) NOT NULL,
	CONSTRAINT PK_Instrutores PRIMARY KEY(Id)
);
GO

CREATE TABLE Turmas
(
	Id INT IDENTITY,
	Codigo VARCHAR(9) NOT NULL,
	CursoId INT NOT NULL,
	InstrutorId INT NOT NULL,
	ValorAula MONEY NOT NULL,
	CONSTRAINT PK_Turmas PRIMARY KEY(Id),
	CONSTRAINT FK_Turmas_Cursos FOREIGN KEY(CursoId) REFERENCES Cursos(Id),
	CONSTRAINT FK_Turmas_Instrutores FOREIGN KEY(InstrutorId) REFERENCES Instrutores(Id),
	CONSTRAINT UQ_Turmas UNIQUE(Codigo)
);
GO

CREATE TABLE Alunos
(
	Id INT IDENTITY,
	Nome VARCHAR(30) NOT NULL,
	Idade INT NOT NULL,
	Telefone VARCHAR(14) NULL,
	Sexo CHAR(1) NOT NULL,
	CONSTRAINT PK_Alunos PRIMARY KEY(Id)
);
GO

CREATE TABLE Matriculas
(
	Id INT IDENTITY,
	TurmaId INT NOT NULL,
	AlunoId INT NOT NULL,
	CONSTRAINT PK_Matriculas PRIMARY KEY(Id),
	CONSTRAINT FK_Matriculas_Turmas FOREIGN KEY(TurmaId) REFERENCES Turmas(Id),
	CONSTRAINT FK_Matriculas_Alunos FOREIGN KEY(AlunoId) REFERENCES Alunos(Id)
);
GO

CREATE TABLE Aulas
(
	Id INT IDENTITY,
	TurmaId INT NOT NULL,
	Data DATETIME NOT NULL,
	Paga CHAR(1) NOT NULL,
	CONSTRAINT PK_Aulas PRIMARY KEY(Id),
	CONSTRAINT FK_Aulas_Turmas FOREIGN KEY(TurmaId) REFERENCES Turmas(Id)
);
GO

CREATE TABLE Frequencias
(
	Id INT IDENTITY,
	AulaId INT NOT NULL,
	MatriculaId INT NOT NULL,
	Presente CHAR(1) NOT NULL,
	CONSTRAINT PK_Frequencias PRIMARY KEY(Id),
	CONSTRAINT FK_Frequencias_Aulas FOREIGN KEY(AulaId) REFERENCES Aulas(Id),
	CONSTRAINT FK_Frequencias_Matriculas FOREIGN KEY(MatriculaId) REFERENCES Matriculas(Id)
);
GO

CREATE TABLE Usuarios
(
	Id INT IDENTITY,
	Login VARCHAR(30) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Senha VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Usuarios PRIMARY KEY(Id),
	CONSTRAINT UQ_Usuarios UNIQUE(Login)
);
GO

CREATE TABLE Funcoes
(
	Id INT IDENTITY,
	Codigo CHAR(6) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Funcoes PRIMARY KEY(Id),
	CONSTRAINT UQ_Funcoes UNIQUE(Codigo)
);
GO

CREATE TABLE Permissoes
(
	Id INT IDENTITY,
	FuncaoId INT NOT NULL,
	UsuarioId INT NOT NULL,
	CONSTRAINT PK_Permissoes PRIMARY KEY(Id),
	CONSTRAINT FK_Permissoes_Funcoes FOREIGN KEY(FuncaoId) REFERENCES Funcoes(Id),
	CONSTRAINT FK_Permissoes_Usuarios FOREIGN KEY(UsuarioId) REFERENCES Usuarios(Id)
);
GO