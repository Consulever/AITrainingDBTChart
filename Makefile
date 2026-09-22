PORT ?= 3000
HOST ?= localhost
DB ?= data/tpch.duckdb
BOARDS ?= charts
RENDERS ?= renders

.PHONY: help install serve validate render

help:
	@echo "make install   Install dependencies and build the sample database"
	@echo "make validate  Validate all boards"
	@echo "make serve     Start the dev server"
	@echo "make render    Render all boards to SVG"

install:
	uv sync
	@$(MAKE) --no-print-directory $(DB)

$(DB):
	rm -f $(DB).tmp $(DB).tmp.wal
	uv run python -c "import duckdb; c = duckdb.connect('$(DB).tmp'); c.execute('INSTALL tpch; LOAD tpch; CALL dbgen(sf = 0.1)'); c.close()"
	mv $(DB).tmp $(DB)

validate:
	uv run dct validate $(BOARDS)

serve: $(DB)
	uv run dct serve --host $(HOST) --port $(PORT)

render: $(DB)
	uv run dct render $(BOARDS)/*.yml --output $(RENDERS)/{stem}.svg
