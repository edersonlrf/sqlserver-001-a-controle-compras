USE sql_avancado;

/* Busca todos os alunos que n�o tenham nenhuma matr�cula nos cursos. */
SELECT a.nome FROM aluno a WHERE NOT EXISTS (SELECT m.id FROM matricula m WHERE m.aluno_id = a.id);

/* Busca todos os alunos que n�o tiveram nenhuma matr�cula nos �ltimos 45 dias, usando a instru��o EXISTS. */
SELECT a.nome
FROM aluno a
WHERE NOT EXISTS (
    SELECT m.id
    FROM matricula m
    WHERE m.aluno_id = a.id AND m.data > DATEADD(DAY, -45, GETDATE())
);
