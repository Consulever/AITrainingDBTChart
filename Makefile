.PHONY: help install serve

help:
	@echo "make install   Install dependencies and build the sample database"
	@echo "make serve     Start the dev server"

install:
	uv sync
	rm -f data/tpch.duckdb data/tpch.duckdb.wal
	uv run python -c "import duckdb; c = duckdb.connect('data/tpch.duckdb'); c.execute('INSTALL tpch; LOAD tpch; CALL dbgen(sf = 0.1)'); c.close()"

serve:
	uv run dct serve --host localhost --port 3000
