-- 01_create_table.sql
-- tabela dos corpos do sistema trebia (mass effect)
-- o drop deixa rodar de novo sem erro de "já existe"

DROP TABLE IF EXISTS trebia_corpos;

CREATE TABLE trebia_corpos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,            -- estrela, planeta ou lua
    posicao INTEGER,               -- ordem a partir da estrela
    orbita_id INTEGER,             -- id de quem ele orbita (a fk entra no 02, depois do insert)
    habitado BOOLEAN,
    distancia_orbital_ua NUMERIC,
    periodo_orbital_anos NUMERIC,
    raio_km NUMERIC,
    duracao_dia_horas NUMERIC,
    pressao_atm NUMERIC,
    temp_superficie_c NUMERIC,
    gravidade_g NUMERIC,
    massa_terras NUMERIC
);
