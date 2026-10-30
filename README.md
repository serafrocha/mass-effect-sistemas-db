# mass-effect-sistemas-db

Projeto de SQL com os corpos de sistemas solares do universo fictício de Mass Effect. Por enquanto só o sistema Trebia, mas a ideia é expandir para outros.

Feito para praticar modelagem e consultas em Postgres (rodando no Docker).

## Como rodar

1. Suba o Postgres no Docker (container chamado `pg` aqui).
2. Rode os arquivos em ordem:

```bash
docker exec -i pg psql -U postgres < 01_create_table.sql
docker exec -i pg psql -U postgres < 02_inserts.sql
docker exec -i pg psql -U postgres < 03_consultas.sql
```

- `01_create_table.sql`: cria a tabela `trebia_corpos` (o `DROP` no começo permite rodar de novo sem erro)
- `02_inserts.sql`: carrega a estrela, os 6 planetas e a lua
- `03_consultas.sql`: consultas de exemplo (self join, rank, lag, porcentagem do total)

## Modelagem

Uma tabela só, `trebia_corpos`. A coluna `orbita_id` aponta para a própria tabela: os planetas orbitam a estrela e a lua orbita um planeta. A estrela fica com `orbita_id` nulo, porque não orbita ninguém.

A chave estrangeira é adicionada depois dos inserts, no fim do `02`.

## Consultas

- Quem orbita quem (self join)
- Ranking dos planetas por temperatura (`RANK`)
- Salto de distância entre cada planeta e o anterior (`LAG` com CTE)
- Porcentagem da massa de cada planeta no total (`SUM() OVER`)

## Dados

Os valores (distância, período, raio, temperatura etc.) vieram da wiki de Mass Effect no Fandom, passados para a tabela por mim. Alguns campos ficam nulos porque a wiki não traz o dado.

Mass Effect é da BioWare/EA. Projeto sem fins comerciais, só para estudo.
