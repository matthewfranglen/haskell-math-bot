Haskell Math Bot ----------------

This is a slack bot that does math. It understands integers and the operations
add, subtract, multiply and divide. Division is integerwise.

It remembers the last value which is used whenever a number should otherwise be
present. That means you can say `add 1` and it will increment the last value by
one and say it.

It uses the arbitrary precision `Integer` type for tracking this value, so the
numbers it can calculate can get very large.

### Layout

Application code goes in `src` and the entry point is the `main` method of `src/Main.hs`.

Dependencies go in `haskell-math-bot.cabal`. When you change dependencies you must rebuild the image.

There are scripts to build and run the code in the `bin` folder.

### Usage

```bash
➜ bin/clean
➜ bin/build
➜ bin/start
...
```

Use Control-C to stop it.

#### bin/build

This downloads the stack dependencies and builds the code.

#### bin/clean

This removes any downloaded dependencies or compiled code.

#### bin/start

This starts the slack bot.
