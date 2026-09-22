---
name: hello
description: Greet the user with the number of orders in the local dataset
---

Count the rows of the `orders` table by running the script from the project root:

```sh
uv run python .claude/skills/hello/scripts/count_orders.py
```

Then reply with exactly one line, replacing `x` with the number you obtained:

Hello, your dataset contains x orders
