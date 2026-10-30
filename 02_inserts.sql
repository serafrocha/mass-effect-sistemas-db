-- 02_inserts.sql
-- roda depois do 01

-- estrela primeiro, os planetas apontam pra ela (orbita_id = 1)
INSERT INTO trebia_corpos (id, nome, tipo)
VALUES (1, 'Trebia', 'estrela');

-- planetas e lua
INSERT INTO trebia_corpos (
  id, nome, tipo, posicao, orbita_id, habitado,
  distancia_orbital_ua, periodo_orbital_anos, raio_km, duracao_dia_horas,
  pressao_atm, temp_superficie_c, gravidade_g, massa_terras
)
VALUES
  (2, 'Aventen', 'planeta', 1, 1, FALSE, 0.3,  0.2,  5488,  19.1, 3.01,  454,  0.7,  0.514),
  (3, 'Caelax',  'planeta', 2, 1, FALSE, 0.6,  0.4,  6349,  64.5, 0.06,  187,  1.0,  0.984),
  (4, 'Palaven', 'planeta', 3, 1, TRUE,  1.15, 1.2,  8990,  28.3, 1.1,   31,   1.14, 2.248),
  (5, 'Impera',  'planeta', 4, 1, FALSE, 2.4,  3.7,  1676,  32.6, 24.28, 223,  0.1,  0.007),
  (6, 'Essenus', 'planeta', 5, 1, FALSE, 4.8,  10.4, 73976, NULL, NULL,  NULL, NULL, NULL),
  (7, 'Datriux', 'planeta', 6, 1, FALSE, 8.7,  25.7, 7183,  31.8, NULL,  -164, NULL, NULL),
  (8, 'Menae',   'lua',  NULL, 4, FALSE, NULL, 0.0903, NULL, NULL, NULL, NULL, NULL, NULL);

-- fk por último: orbita_id só aceita um id que já existe na própria tabela
ALTER TABLE trebia_corpos
ADD CONSTRAINT trebia_corpos_orbita_id_fkey
FOREIGN KEY (orbita_id) REFERENCES trebia_corpos(id);
