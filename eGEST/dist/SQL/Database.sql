Create Database eGEST

Use eGEST

Create Table Tb_Usuario 
(
Id_Usuario Int Not Null Identity Primary Key,
Usuario varchar(50) Not Null Unique,
Nome varchar(100) Not Null,
Activo bit Not Null Default 1
)

--Alter Table Tb_Usuario Add Activo bit Not Null default 1
go

Create Table Tb_Reg
(
Id_Reg BigInt Not Null Identity Primary Key,
Data Datetime Default Getdate(),
Id_Usuario Int Not Null References Tb_Usuario (Id_Usuario),
Reg Varchar(1000) Not Null
)
go

Create Proc LoginUsuario
@Id_Usuario Int
as
Begin
Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Inicio de Sessão.')
End
go


Create Table Tb_TipoDoc
(
Id_TipoDoc Int Not Null Identity Primary Key,
TipoDoc varchar(20)
)

Insert Into Tb_TipoDoc values ('BI')
Insert Into Tb_TipoDoc values ('Passaporte')
go

Create Table Tb_Curso
(
Id_Curso Int Not Null Identity Primary Key,
Curso varchar(50) 
)
--Alter Table Tb_Curso Alter Column Curso varchar(50)

Insert Into Tb_Curso values ('Administração Publica')
Insert Into Tb_Curso values ('Ciência Política')
Insert Into Tb_Curso values ('Economia')
Insert Into Tb_Curso values ('Relações Internacionais')
Insert Into Tb_Curso values ('Sociologia')
Insert Into Tb_Curso values ('Psicologia Clínica')
Insert Into Tb_Curso values ('Psicologia - Organizacional')
Insert Into Tb_Curso values ('Psicologia - Trabalho e Escolar')
go

Create Table Tb_Semestre
(
Id_Semestre Int Not Null Identity Primary Key,
Semestre varchar(25)
)
Insert Into Tb_Semestre values ('1er Semestre')
Insert Into Tb_Semestre values ('2do Semestre')
go

Create Table Tb_Sala
(
Id_Sala Int Not Null Identity Primary Key,
Sala varchar(25) Not Null
)
Insert Into Tb_Sala values ('Sala 1')
Insert Into Tb_Sala values ('Sala 2')
Insert Into Tb_Sala values ('Sala 3')
Insert Into Tb_Sala values ('Sala 4')
Insert Into Tb_Sala values ('Sala 5')
Insert Into Tb_Sala values ('Sala 6')
Insert Into Tb_Sala values ('Sala 7')
Insert Into Tb_Sala values ('Sala 8')
Insert Into Tb_Sala values ('Sala 9')
go

Create Table Tb_Ano
(
Id_Ano Int Not Null Identity Primary Key,
Ano varchar(10) 
)

Insert Into Tb_Ano values ('1er Ano')
Insert Into Tb_Ano values ('2do Ano')
Insert Into Tb_Ano values ('3er Ano')
Insert Into Tb_Ano values ('4to Ano')
go

Create Table Tb_Periodo
(
Id_Periodo Int Not Null Identity Primary Key,
Periodo varchar(15) Not Null
)

Insert Into Tb_Periodo values ('Manhã')
Insert Into Tb_Periodo values ('Tarde')
Insert Into Tb_Periodo values ('Noite')
go



Create Table Tb_Turma
(
Id_Turma Int Not Null Identity Primary Key,
Id_Periodo Int Not Null References Tb_Periodo (Id_Periodo),
Id_Ano Int Not Null References Tb_Ano (Id_Ano),
Id_Curso Int Not Null References Tb_Curso(Id_Curso),
AnoLectivo Int Not Null,
Turma varchar(10) Not Null
)
go

Create Proc AddTurma
@Id_Usuario Int,
@Id_Periodo Int,
@Id_Ano Int,
@Id_Curso Int,
@AnoLectivo Int,
@Turma varchar(10)
as
Begin

Insert Into Tb_Turma(Id_Periodo,Id_Ano,Id_Curso,AnoLectivo,Turma) values (@Id_Periodo,@Id_Ano,@Id_Curso,@AnoLectivo,@Turma)

Declare @Id_Turma varchar(10) = (Select IDENT_CURRENT('Tb_Turma'))

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro da turma <a>'+@Turma+'</a> com indice '+@Id_Turma+'.')
End
go

Create Proc LoadTurmas
@AnoLectivo Int,
@Id_Curso Int,
@Id_Ano Int
as
Begin

SELECT        Tb_Turma.Id_Turma, Tb_Periodo.Periodo, Tb_Ano.Ano, Tb_Curso.Curso, Tb_Turma.AnoLectivo, Tb_Turma.Turma
FROM            Tb_Turma INNER JOIN
                         Tb_Periodo ON Tb_Turma.Id_Periodo = Tb_Periodo.Id_Periodo INNER JOIN
                         Tb_Ano ON Tb_Turma.Id_Ano = Tb_Ano.Id_Ano INNER JOIN
                         Tb_Curso ON Tb_Turma.Id_Curso = Tb_Curso.Id_Curso
WHERE        (Tb_Turma.AnoLectivo = @AnoLectivo) AND (Tb_Ano.Id_Ano = @Id_Ano) AND (Tb_Curso.Id_Curso = @Id_Curso)

End
go


Create Table Tb_Disciplina
(
Id_Disciplina Int Not Null Identity Primary Key,
Id_Semestre Int Not Null References Tb_Semestre (Id_Semestre),
Id_Ano Int Not Null References Tb_Ano (Id_Ano),
Id_Curso Int Not Null References Tb_Curso(Id_Curso),
Disciplina varchar(50) Not Null
)
go

Create Table Tb_Genero
(
Id_Genero Int Not Null Identity Primary Key,
Genero varchar(25) Not Null
)
Insert Into Tb_Genero values ('Femenino')
Insert Into Tb_Genero values ('Masculino')
go

Create Table Tb_Estudante
(
Id_Estudante Uniqueidentifier Not Null Primary Key,
Id_Usuario Int Not Null References Tb_Usuario (Id_Usuario),
NomePai varchar(50) Not Null Default 'Sem Descripção',
NomeMae varchar(50) Not Null Default 'Sem Descripção',
Id_Genero Int Not Null References Tb_Genero (Id_Genero),
NumMatricula Int Not Null Unique,
DataNasc Date,
Id_TipoDoc Int Not Null References Tb_TipoDoc (Id_TipoDoc),
NumDoc varchar(15),
Telf varchar(9),
Email varchar(50),
Especial bit Not Null Default 0,
)


--Alter Table Tb_Estudante Drop Column DataNasc
--Alter Table Tb_Estudante Add DataNasc Date
--Alter Table Tb_Estudante Add NomePai varchar(50) Not Null Default 'Sem Descripção'
--Alter Table Tb_Estudante Add NomeMae varchar(50) Not Null Default 'Sem Descripção'
--Alter Table Tb_Estudante Add Id_Genero Int Not Null References Tb_Genero (Id_Genero)
--Alter Table Tb_Estudante Add Telf varchar(9)
--Alter Table Tb_Estudante Add Email varchar(50)
go


Create Table Tb_GAcademico
(
Id_GAcademico Int Not Null Identity Primary Key,
GAcademico varchar(25) Not Null,
Dim varchar(10) Not Null 
)

Insert Into Tb_GAcademico values ('Licenciado','Lic.')
Insert Into Tb_GAcademico values ('Mestre','MSc.')
Insert Into Tb_GAcademico values ('Doutor','PhD.')
go

Create Table Tb_Professor
(
Id_Professpor Int Not Null Identity Primary Key,
Id_Usuario Int Not Null References Tb_Usuario(Id_Usuario),
Id_GrauAcademinco Int Not Null References Tb_GAcademico (Id_GAcademico)
)

Create Table Tb_Pauta
(
Id_Pauta Uniqueidentifier Not Null Primary Key,
Id_Disciplina Int Not Null References Tb_Disciplina (Id_Disciplina),
Id_Estudante Uniqueidentifier Not Null References Tb_Estudante (Id_Estudante),
AvalCont float,
Frequ float,
Exame float,
Recurso float,
Melhoria float
)
go

Create Table Tb_EstudanteTurma
(
Id_EstudanteTurma Int Not Null Identity Primary Key,
Id_Estudante Uniqueidentifier Not Null References Tb_Estudante(Id_Estudante),
Id_Turma Int Not Null References Tb_Turma (Id_Turma) 
)
go

Create Proc AddEstudante
@Id_Usuario Int,
@NumMatricula int,
@DataNasc Date,
@Id_TipoDoc Int,
@NumDoc varchar(15),
@Telf varchar(9),
@Email varchar(50),
@Especial bit,
@Id_Turma Int
as
Begin

Declare @Id_Estudante Uniqueidentifier = (Select NewID())

Declare @U Int = (Select Id_Usuario from Tb_Usuario Where Usuario = @NumMatricula)

Insert Into Tb_Estudante
(Id_Estudante,Id_Usuario,NumMatricula,DataNasc,Id_TipoDoc,NumDoc,Telf,Email,Especial)
values
(@Id_Estudante,@U,@NumMatricula,@DataNasc,@Id_TipoDoc,@NumDoc,@Telf,@Email,@Especial)

Insert Into Tb_EstudanteTurma(Id_Estudante,Id_Turma)values  (@Id_Estudante,@Id_Turma)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro do Estudante: <b>'+CONVERT(varchar(6),@NumMatricula) +'</b> ')

End

go



Select Count(*) from Tb_Disciplina Where Id_Curso = 1


--Create Function EstadoPauta
--(
--@AvalCont float,
--@Freq float,
--@Exame float,
--@Recurso float,
--@Melhoria float
--)
--returns varchar(15)
--as
--Begin

--if 
--	begin


--	end
--	else 
--	return 
--End
