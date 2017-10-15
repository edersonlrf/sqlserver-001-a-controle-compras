USE sql_avancado;

/* ExibE todos os alunos e suas poss�veis respostas. Exibe mesmo que eles n�o tenham respondido nenhuma pergunta. */
SELECT a.nome, r.resposta_dada
FROM aluno a
LEFT JOIN resposta r ON a.id = r.aluno_id;

/* Exibe agora todos os alunos e suas poss�veis respostas para o exerc�cio com ID = 1, mesmo que ele n�o tenha respondido o exerc�cio. */
SELECT a.nome, r.resposta_dada
FROM aluno a
LEFT JOIN resposta r ON a.id = r.aluno_id AND r.exercicio_id = 1;
