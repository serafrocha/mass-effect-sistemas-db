-- 03_consultas.sql
-- cada consulta roda separada (ctrl+enter no dbeaver)

-- 0. tabela inteira
SELECT * FROM trebia_corpos
ORDER BY id;

-- 1. quem orbita quem (self join)
-- trebia não aparece porque o orbita_id dela é null
SELECT
    p.nome AS planeta,
    o.nome AS orbita
FROM trebia_corpos p
JOIN trebia_corpos o
    ON p.orbita_id = o.id;

-- 2. ranking dos planetas por temperatura (só os que têm medição)
SELECT nome, tipo, temp_superficie_c,
    RANK() OVER (ORDER BY temp_superficie_c DESC) AS rank_temp
FROM trebia_corpos
WHERE tipo = 'planeta' AND temp_superficie_c IS NOT NULL
ORDER BY rank_temp, nome;

-- 3. salto de distância entre cada planeta e o anterior
WITH dist_comp AS (
    SELECT nome, tipo, posicao, distancia_orbital_ua,
        LAG(distancia_orbital_ua) OVER (ORDER BY posicao) AS anterior
    FROM trebia_corpos
    WHERE tipo = 'planeta'
)
SELECT nome, tipo, distancia_orbital_ua, anterior,
    distancia_orbital_ua - anterior AS salto_ua
FROM dist_comp
ORDER BY posicao;

-- 4. porcentagem da massa de cada planeta no total
SELECT nome, massa_terras,
    ROUND(100.0 * massa_terras / SUM(massa_terras) OVER (), 1) AS pct_massas
FROM trebia_corpos
WHERE tipo = 'planeta' AND massa_terras IS NOT NULL
ORDER BY pct_massas DESC;
