USE sistema_treinamentos;

-- CONSULTA DOS DADOS (Passo 1)
SELECT 
    alunos.nome AS Aluno,
    turmas.nome AS Turma
    
FROM alunos
INNER JOIN turmas ON alunos.turma_id = turmas.id;

-- CONSULTA DOS DADOS (Passo 2)
SELECT
    atividades.descricao AS Descricao,
    turmas.nome AS Turma,
    materias.nome AS Materia,
    instrutores.nome AS Instrutor
    
FROM atividades

INNER JOIN turmas ON atividades.turma_id = turmas.id
INNER JOIN materias ON atividades.materia_id = materias.id
INNER JOIN instrutores ON atividades.instrutor_id = instrutores.id;

-- CONSULTA DOS DADOS (Passo 3)
SELECT
    instrutores.nome AS Instrutor,
    materias.nome AS Materia
    
FROM instrutor_materia

INNER JOIN instrutores ON instrutor_materia.instrutor_id = instrutores.id
INNER JOIN materias ON instrutor_materia.materia_id = materias.id;

-- CONSULTA DOS DADOS (Passo 4)
SELECT
	atividades.descricao AS Descricao,
    instrutores.nome AS Instrutor,
    instrutores.especialidade AS Especialidade
    
FROM atividades

INNER JOIN instrutores ON atividades.instrutor_id = instrutores.id;

-- CONSULTA DOS DADOS (Passo 5)
SELECT
	atividades.descricao AS Descricao,
    turmas.data_inicio AS Data_Inicio,
    turmas.data_fim AS Data_Fim,
    materias.nome AS Materia
    
FROM atividades

INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN turmas ON turmas.id = atividades.turma_id;

-- CONSULTA DOS DADOS (Passo 6) 
SELECT
    alunos.nome AS Aluno,
    turmas.nome AS Turma,
    atividades.descricao AS Atividade,
    materias.nome AS Materia,
    instrutores.nome AS Instrutor
    
FROM atividades

INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id
INNER JOIN alunos ON alunos.turma_id = turmas.id;


    



