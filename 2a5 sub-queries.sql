USE sql_avancado;

/* Exibe a m�dia das notas por aluno, al�m de uma coluna com a diferen�a entre a m�dia do aluno e a m�dia geral. Use sub-queries para isso. */
SELECT a.nome,
AVG(n.nota) AS media,
AVG(n.nota) - (SELECT AVG(n1.nota) FROM nota n1) AS diferenca
FROM nota n
JOIN resposta r ON r.id = n.resposta_id
JOIN aluno a ON a.id = r.aluno_id
GROUP BY a.nome;

/* Exibe a quantidade de matr�culas por curso. Al�m disso, exibe a divis�o entre matr�culas naquele curso e matr�culas totais. */
SELECT c.nome, COUNT(m.id),
(SELECT COUNT(id) FROM matricula) / COUNT(m.id)
FROM curso c
JOIN matricula m ON m.curso_id = c.id
GROUP BY c.nome;
