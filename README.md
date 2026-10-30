# mass-effect-sistemas-db

projeto de sql com os corpos de sistemas solares do universo fictício de mass effect. por enquanto só o sistema trebia, mas a ideia é expandir pra outros.

feito pra praticar modelagem e consultas em postgres (rodando no docker).

## como rodar

1. sobe o postgres no docker (container chamado `pg` aqui) e abre um terminal nele
2. roda os arquivos em ordem:

```bash
docker exec -i pg psql -U postgres < 01_create_table.sql
docker exec -i pg psql -U postgres < 02_inserts.sql
docker exec -i pg psql -U postgres < 03_consultas.sql
```

- `01_create_table.sql`: cria a tabela `trebia_corpos` (o drop no começo deixa rodar de novo sem erro)
- `02_inserts.sql`: carrega a estrela, os 6 planetas e a lua
- `03_consultas.sql`: consultas de exemplo (self join, rank, lag, porcentagem do total)

## modelagem

uma tabela só, `trebia_corpos`. a coluna `orbita_id` aponta pra própria tabela: os planetas orbitam a estrela e a lua orbita um planeta. a estrela fica com `orbita_id` null, porque não orbita ninguém.

a chave estrangeira é adicionada depois dos inserts, no fim do `02`.

## consultas

- quem orbita quem (self join)
- ranking dos planetas por temperatura (`RANK`)
- salto de distância entre cada planeta e o anterior (`LAG` com cte)
- porcentagem da massa de cada planeta no total (`SUM() OVER`)

## dados

os valores (distância, período, raio, temperatura etc.) vieram da wiki de mass effect no fandom, passados pra tabela por mim. alguns campos ficam null porque a wiki não traz o dado.

mass effect é da bioware/ea. projeto sem fins comerciais, só pra estudo.
