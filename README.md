# AI Training - dbt charts

This project uses [dbt charts](https://pypi.org/project/dbt-charts/) to generate charts from YAML files stored in `charts/`.

## Setup

Requirements: [uv](https://docs.astral.sh/uv/) and `make`.

```sh
make install
make serve
```

## Dataset

Installation builds the dataset locally as a DuckDB file in `data/`.

The data model is described in [documentation/data_model.md](documentation/data_model.md).
