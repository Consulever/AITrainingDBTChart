import duckdb

connection = duckdb.connect("data/tpch.duckdb", read_only=True)
count = connection.execute("SELECT COUNT(*) FROM orders").fetchone()[0]
print(count)
