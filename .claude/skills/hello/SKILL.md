---
name: hello
description: Greet the user with the number of orders in the local dataset
---

Count the rows of the `orders` table in the local DuckDB database by running:

```sh
uv run python -c "import duckdb; print(duckdb.connect('data/tpch.duckdb', read_only=True).execute('SELECT COUNT(*) FROM orders').fetchone()[0])"
```

Then reply with exactly one line, replacing `x` with the number you obtained:

Hello, your dataset contains x orders.
