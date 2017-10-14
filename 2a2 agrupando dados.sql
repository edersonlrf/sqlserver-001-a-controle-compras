USE sql_avancado;

/* Exibe a m�dia das notas por curso. */
SELECT c.nome, AVG(n.nota)
FROM nota n
JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
        JOIN secao s ON s.id = e.secao_id
            JOIN curso c ON c.id = s.curso_id
GROUP BY c.nome;

/* Devolve o curso e as m�dias de notas, levando em conta somente alunos que tenham "Silva" ou "Santos" no sobrenome. */
SELECT c.nome, AVG(n.nota)
FROM nota n
JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
        JOIN secao s ON s.id = e.secao_id
            JOIN curso c ON c.id = s.curso_id
    JOIN aluno a ON a.id = r.aluno_id
WHERE a.nome LIKE '%Santos%' OR a.nome LIKE '%Silva%'
GROUP BY c.nome;

/* Conta a quantidade de respostas por exerc�cio. Exibe a pergunta e o n�mero de respostas. */
SELECT e.pergunta, COUNT(r.id)
FROM exercicio e
JOIN resposta r ON e.id = r.exercicio_id
GROUP BY e.id, e.pergunta;

/* Pega a resposta do exerc�cio anterior, e ordena por n�mero de respostas, em ordem decrescente. */
SELECT e.pergunta, COUNT(r.id)
FROM exercicio e
JOIN resposta r ON e.id = r.exercicio_id
GROUP BY e.pergunta
ORDER BY COUNT(r.id) DESC;

/*
    Agrupa por mais de um campo de uma s� vez.
    Por exemplo, se quisermos a m�dia de notas por aluno por curso, podemos fazer GROUP BY aluno.id, curso.id.
*/
SELECT a.nome, c.nome, AVG(n.nota)
FROM nota n
JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
        JOIN secao s ON s.id = e.secao_id
            JOIN curso c ON c.id = s.curso_id
    JOIN aluno a ON a.id = r.aluno_id
GROUP BY c.nome, a.nome;
