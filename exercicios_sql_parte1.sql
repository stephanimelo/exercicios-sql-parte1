CREATE DATABASE db_universidade;
GO
USE db_universidade;
GO

CREATE TABLE Depto (
    CodDepto CHAR(5) NOT NULL,
    NomeDepto VARCHAR(40)
);

CREATE TABLE Titulacao (
    CodTit INT NOT NULL,
    NomeTit VARCHAR(20)
);

CREATE TABLE Predio (
    CodPred INT NOT NULL,
    NomePred VARCHAR(40)
);

CREATE TABLE Sala (
    CodPred INT NOT NULL,
    NumSala INT NOT NULL,
    DescricaoSala VARCHAR(40),
    CapacSala INT
);

CREATE TABLE Disciplina (
    CodDepto CHAR(5) NOT NULL,
    NumDisc INT NOT NULL,
    NomeDisc VARCHAR(40),
    CreditosDisc INT
);

CREATE TABLE PreReq (
    CodDeptoPreReq CHAR(5) NOT NULL,
    NumDiscPreReq INT NOT NULL,
    CodDepto CHAR(5) NOT NULL,
    NumDisc INT NOT NULL
);

CREATE TABLE Professor (
    CodProf INT NOT NULL,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40)
);

CREATE TABLE Turma (
    AnoSem INT NOT NULL,
    CodDepto CHAR(5) NOT NULL,
    NumDisc INT NOT NULL,
    SiglaTur CHAR(2) NOT NULL,
    CapacTur INT
);

CREATE TABLE Horario (
    AnoSem INT NOT NULL,
    CodDepto CHAR(5) NOT NULL,
    NumDisc INT NOT NULL,
    SiglaTur CHAR(2) NOT NULL,
    DiaSem INT NOT NULL,
    HoraInicio CHAR(5) NOT NULL,
    HorasAula INT,
    CodPred INT,
    NumSala INT
);

CREATE TABLE ProfTurma (
    AnoSem INT NOT NULL,
    CodDepto CHAR(5) NOT NULL,
    NumDisc INT NOT NULL,
    SiglaTur CHAR(2) NOT NULL,
    CodProf INT NOT NULL
);
GO


ALTER TABLE Depto ADD CONSTRAINT PK_Depto PRIMARY KEY (CodDepto);
ALTER TABLE Titulacao ADD CONSTRAINT PK_Titulacao PRIMARY KEY (CodTit);
ALTER TABLE Predio ADD CONSTRAINT PK_Predio PRIMARY KEY (CodPred);
ALTER TABLE Sala ADD CONSTRAINT PK_Sala PRIMARY KEY (CodPred, NumSala);
ALTER TABLE Disciplina ADD CONSTRAINT PK_Disciplina PRIMARY KEY (CodDepto, NumDisc);
ALTER TABLE PreReq ADD CONSTRAINT PK_PreReq PRIMARY KEY (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc);
ALTER TABLE Professor ADD CONSTRAINT PK_Professor PRIMARY KEY (CodProf);
ALTER TABLE Turma ADD CONSTRAINT PK_Turma PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE Horario ADD CONSTRAINT PK_Horario PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio);
ALTER TABLE ProfTurma ADD CONSTRAINT PK_ProfTurma PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf);
GO


ALTER TABLE Sala ADD CONSTRAINT FK_Sala_Predio FOREIGN KEY (CodPred) REFERENCES Predio(CodPred);
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_Depto FOREIGN KEY (CodDepto) REFERENCES Depto(CodDepto);
ALTER TABLE PreReq ADD CONSTRAINT FK_PreReq_Disc FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina(CodDepto, NumDisc);
ALTER TABLE PreReq ADD CONSTRAINT FK_PreReq_PreDisc FOREIGN KEY (CodDeptoPreReq, NumDiscPreReq) REFERENCES Disciplina(CodDepto, NumDisc);
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_Depto FOREIGN KEY (CodDepto) REFERENCES Depto(CodDepto);
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_Titulacao FOREIGN KEY (CodTit) REFERENCES Titulacao(CodTit);
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_Disc FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina(CodDepto, NumDisc);
ALTER TABLE Horario ADD CONSTRAINT FK_Horario_Turma FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE Horario ADD CONSTRAINT FK_Horario_Sala FOREIGN KEY (CodPred, NumSala) REFERENCES Sala(CodPred, NumSala);
ALTER TABLE ProfTurma ADD CONSTRAINT FK_ProfTurma_Turma FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma(AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE ProfTurma ADD CONSTRAINT FK_ProfTurma_Professor FOREIGN KEY (CodProf) REFERENCES Professor(CodProf);
GO

INSERT INTO Depto VALUES ('INF01', 'Informatica');
INSERT INTO Depto VALUES ('MAT01', 'Matematica');
INSERT INTO Depto VALUES ('FIS01', 'Fisica');

INSERT INTO Titulacao VALUES (1, 'Doutor');
INSERT INTO Titulacao VALUES (2, 'Mestre');

INSERT INTO Predio VALUES (43423, 'Informatica - aulas');

INSERT INTO Sala VALUES (43423, 101, 'Sala de aula', 40);
INSERT INTO Sala VALUES (43423, 102, 'Laboratorio', 30);

INSERT INTO Disciplina VALUES ('INF01', 101, 'Estrutura de Dados', 4);
INSERT INTO Disciplina VALUES ('INF01', 102, 'Banco de Dados', 4);
INSERT INTO Disciplina VALUES ('MAT01', 201, 'Calculo I', 6);
INSERT INTO Disciplina VALUES ('FIS01', 301, 'Fisica I', 4);

INSERT INTO PreReq VALUES ('INF01', 101, 'INF01', 102);
INSERT INTO PreReq VALUES ('MAT01', 201, 'INF01', 102);

INSERT INTO Professor VALUES (1, 'INF01', 1, 'Antunes');
INSERT INTO Professor VALUES (2, 'MAT01', 2, 'Costa');

INSERT INTO Turma VALUES (20021, 'INF01', 101, 'A', 40);
INSERT INTO Turma VALUES (20021, 'INF01', 102, 'A', 35);
INSERT INTO Turma VALUES (20021, 'MAT01', 201, 'A', 50);
INSERT INTO Turma VALUES (20021, 'FIS01', 301, 'A', 30);

INSERT INTO Horario VALUES (20021, 'INF01', 101, 'A', 2, '08:00', 2, 43423, 101);
INSERT INTO Horario VALUES (20021, 'INF01', 102, 'A', 4, '10:00', 2, 43423, 101);
INSERT INTO Horario VALUES (20021, 'FIS01', 301, 'A', 3, '14:00', 2, 43423, 102);
INSERT INTO Horario VALUES (20021, 'MAT01', 201, 'A', 2, '08:00', 2, 43423, 102);

INSERT INTO ProfTurma VALUES (20021, 'INF01', 101, 'A', 1);
INSERT INTO ProfTurma VALUES (20021, 'INF01', 102, 'A', 1);
INSERT INTO ProfTurma VALUES (20021, 'FIS01', 301, 'A', 1);
INSERT INTO ProfTurma VALUES (20021, 'MAT01', 201, 'A', 1);

-- 1) Codigos dos departamentos com turmas em 2002/1
SELECT DISTINCT CodDepto FROM Turma WHERE AnoSem = 20021;

-- 2) Codigos de professores do INF01 que ministraram turma em 2002/1
SELECT DISTINCT PT.CodProf
FROM ProfTurma PT
JOIN Professor P ON PT.CodProf = P.CodProf
WHERE P.CodDepto = 'INF01' AND PT.AnoSem = 20021;

-- 3) Horarios (dia, hora inicial, horas) do professor Antunes em 2002/1
SELECT H.DiaSem, H.HoraInicio, H.HorasAula
FROM Horario H
JOIN ProfTurma PT ON H.AnoSem = PT.AnoSem AND H.CodDepto = PT.CodDepto
    AND H.NumDisc = PT.NumDisc AND H.SiglaTur = PT.SiglaTur
JOIN Professor P ON PT.CodProf = P.CodProf
WHERE P.NomeProf = 'Antunes' AND H.AnoSem = 20021;

-- 4) Nomes dos departamentos com turmas na sala 101 do predio 'Informatica - aulas', em 2002/1
SELECT DISTINCT D.NomeDepto
FROM Depto D
JOIN Turma T ON D.CodDepto = T.CodDepto
JOIN Horario H ON T.AnoSem = H.AnoSem AND T.CodDepto = H.CodDepto
    AND T.NumDisc = H.NumDisc AND T.SiglaTur = H.SiglaTur
JOIN Sala S ON H.CodPred = S.CodPred AND H.NumSala = S.NumSala
JOIN Predio P ON S.CodPred = P.CodPred
WHERE T.AnoSem = 20021 AND S.NumSala = 101 AND P.NomePred = 'Informatica - aulas';

-- 5) Codigos das disciplinas com professor titulo 'Doutor' que ministram aulas em 2002/1
SELECT DISTINCT DI.CodDepto, DI.NumDisc
FROM Disciplina DI
JOIN Turma T ON DI.CodDepto = T.CodDepto AND DI.NumDisc = T.NumDisc
JOIN ProfTurma PT ON T.AnoSem = PT.AnoSem AND T.CodDepto = PT.CodDepto
    AND T.NumDisc = PT.NumDisc AND T.SiglaTur = PT.SiglaTur
JOIN Professor P ON PT.CodProf = P.CodProf
JOIN Titulacao TI ON P.CodTit = TI.CodTit
WHERE TI.NomeTit = 'Doutor' AND T.AnoSem = 20021;

-- 6) Salas (predio, numero) com turma de Informatica na segunda E turma de Antunes na quarta
SELECT H1.CodPred, H1.NumSala
FROM Horario H1
JOIN Turma T1 ON H1.AnoSem = T1.AnoSem AND H1.CodDepto = T1.CodDepto
    AND H1.NumDisc = T1.NumDisc AND H1.SiglaTur = T1.SiglaTur
JOIN Depto D ON T1.CodDepto = D.CodDepto
WHERE H1.AnoSem = 20021 AND H1.DiaSem = 2 AND D.NomeDepto = 'Informatica'
INTERSECT
SELECT H2.CodPred, H2.NumSala
FROM Horario H2
JOIN ProfTurma PT ON H2.AnoSem = PT.AnoSem AND H2.CodDepto = PT.CodDepto
    AND H2.NumDisc = PT.NumDisc AND H2.SiglaTur = PT.SiglaTur
JOIN Professor P ON PT.CodProf = P.CodProf
WHERE H2.AnoSem = 20021 AND H2.DiaSem = 4 AND P.NomeProf = 'Antunes';

-- 7) Dia, hora, horas de cada turma do Antunes em 2002/1, sala 101 do predio 43423
SELECT H.DiaSem, H.HoraInicio, H.HorasAula
FROM Horario H
JOIN ProfTurma PT ON H.AnoSem = PT.AnoSem AND H.CodDepto = PT.CodDepto
    AND H.NumDisc = PT.NumDisc AND H.SiglaTur = PT.SiglaTur
JOIN Professor P ON PT.CodProf = P.CodProf
WHERE P.NomeProf = 'Antunes' AND H.AnoSem = 20021
    AND H.CodPred = 43423 AND H.NumSala = 101;

	-- 8) Professores que ministraram disciplina de outro departamento (codigo, nome, depto proprio, depto ministrado)
SELECT DISTINCT P.CodProf, P.NomeProf, D1.NomeDepto AS DeptoProfessor, D2.NomeDepto AS DeptoMinistrado
FROM Professor P
JOIN Depto D1 ON P.CodDepto = D1.CodDepto
JOIN ProfTurma PT ON P.CodProf = PT.CodProf
JOIN Depto D2 ON PT.CodDepto = D2.CodDepto
WHERE PT.CodDepto <> P.CodDepto;

-- 9) Professores com horarios conflitantes (mesmo dia, mesma hora, mesmo semestre)
SELECT DISTINCT P.NomeProf,
    H1.AnoSem, H1.CodDepto AS Turma1_Depto, H1.NumDisc AS Turma1_Disc, H1.SiglaTur AS Turma1_Sigla,
    H2.CodDepto AS Turma2_Depto, H2.NumDisc AS Turma2_Disc, H2.SiglaTur AS Turma2_Sigla
FROM Horario H1
JOIN ProfTurma PT1 ON H1.AnoSem = PT1.AnoSem AND H1.CodDepto = PT1.CodDepto
    AND H1.NumDisc = PT1.NumDisc AND H1.SiglaTur = PT1.SiglaTur
JOIN Horario H2 ON H1.AnoSem = H2.AnoSem AND H1.DiaSem = H2.DiaSem
    AND H1.HoraInicio = H2.HoraInicio
    AND (H1.CodDepto <> H2.CodDepto OR H1.NumDisc <> H2.NumDisc OR H1.SiglaTur <> H2.SiglaTur)
JOIN ProfTurma PT2 ON H2.AnoSem = PT2.AnoSem AND H2.CodDepto = PT2.CodDepto
    AND H2.NumDisc = PT2.NumDisc AND H2.SiglaTur = PT2.SiglaTur
    AND PT1.CodProf = PT2.CodProf
JOIN Professor P ON PT1.CodProf = P.CodProf;

-- 10) Nome da disciplina seguido do nome do seu pre-requisito
SELECT D1.NomeDisc AS Disciplina, D2.NomeDisc AS PreRequisito
FROM PreReq PR
JOIN Disciplina D1 ON PR.CodDepto = D1.CodDepto AND PR.NumDisc = D1.NumDisc
JOIN Disciplina D2 ON PR.CodDeptoPreReq = D2.CodDepto AND PR.NumDiscPreReq = D2.NumDisc;

-- 11) Disciplinas que nao possuem pre-requisito
SELECT NomeDisc
FROM Disciplina D
WHERE NOT EXISTS (
    SELECT 1 FROM PreReq PR
    WHERE PR.CodDepto = D.CodDepto AND PR.NumDisc = D.NumDisc
);

-- 12) Disciplina que possui pelo menos dois pre-requisitos
SELECT D.NomeDisc
FROM Disciplina D
JOIN PreReq PR ON D.CodDepto = PR.CodDepto AND D.NumDisc = PR.NumDisc
GROUP BY D.CodDepto, D.NumDisc, D.NomeDisc
HAVING COUNT(*) >= 2;