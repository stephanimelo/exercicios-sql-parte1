# Exercícios de SQL - Parte 1

A. Inserir registros para todas as tabelas respeitando as integridades.

Script completo: [exercicios_sql_parte1.sql](exercicios_sql_parte1.sql)

---

### 1) Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1

<img src="1) Codigos dos departamentos com turmas.PNG" width="400"/>

---

### 2) Obter os códigos dos professores que são do departamento de código 'INF01' e que ministraram ao menos uma turma em 2002/1

<img src="2) Codigos de professores do INF01 que ministraram turma.PNG" width="400"/>

---

### 3) Obter os horários de aula (dia da semana, hora inicial e número de horas ministradas) do professor "Antunes" em 20021

<img src="3) Horarios (dia, hora inicial, horas) do professor Antunes.PNG" width="400"/>

---

### 4) Obter os nomes dos departamentos que tem turmas que, em 2002/1, têm aulas na sala 101 do prédio denominado 'Informática - aulas'

<img src="4) Nomes dos departamentos com turmas na sala 101 do predio 'Informatica - aulas'.PNG" width="400"/>

---

### 5) Obter os códigos das disciplinas com professores com título de doutor que ministram aulas em 2002/1

<img src="5) Codigos das disciplinas com professor titulo 'Doutor' que ministram aulas.PNG" width="400"/>

---

### 6) Obter os identificadores das salas (código do prédio e número da sala) que, em 2002/1:
- nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento de 'Informática', e
- nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma ministrada pelo professor denominado 'Antunes'

<img src="6) Salas (predio, numero) com turma de Informatica na segundaE turma de Antunes na quarta.PNG" width="400"/>

---

### 7) Obter o dia da semana, a hora de início e o número de horas de cada horário de cada turma ministrada por um professor de nome 'Antunes', em 2002/1, na sala número 101 do prédio 43423

<img src="7) Dia, hora, horas de cada turma do Antunes em 2002_1, sala 101 do predio 43423.PNG" width="400"/>

---

### 8) Um professor pode ministrar turmas de disciplinas pertencentes a outros departamentos. Para cada professor que já ministrou aulas em disciplinas de outros departamentos, obter o código do professor, seu nome, o nome de seu departamento e o nome do departamento ao qual ministrou disciplina

<img src="8) Professores que ministraram disciplina de outro departamento (codigo, nome, depto proprio, depto ministrado).PNG" width="400"/>

---

### 9) Obter o nome dos professores que possuem horários conflitantes (possuem turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo semestre). Além dos nomes, mostrar as chaves primárias das turmas em conflito

<img src="9) Professores com horarios conflitantes (mesmo dia, mesma hora, mesmo semestre).PNG" width="400"/>

---

### 10) Para cada disciplina que possuir pré-requisito, obter o nome da disciplina seguido do nome da disciplina que é seu pré-requisito

<img src="10) Nome da disciplina seguido do nome do seu pre-requisito.PNG" width="400"/>

---

### 11) Obter os nomes das disciplinas que não têm pré-requisito

<img src="11) Disciplinas que nao possuem pre-requisito.PNG" width="400"/>

---

### 12) Obter o nome de cada disciplina que possui ao menos dois pré-requisitos

<img src="12) Disciplina que possui pelo menos dois pre-requisitos.PNG" width="400"/>
