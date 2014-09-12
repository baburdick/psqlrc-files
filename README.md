# psqlrc-files
What you get:

* `.psqlrc` with a fancy prompt
* an extensible aliases system
* useful basic admin queries

# Get started
Copy the `.psqlrc*` files to `~/`. That's it! The next time you use `psql` from your shell, you'll have access to these predefined admin queries.

You'll see a colorized two-line prompt displaying the date, your initial login user, the host, the port, and the DB to which you've connected.

# Add an aliases group
* add a directory at `~/.psqlrc-aliases/my_special_queries` that contains the queries to be referenced in your index.
* add an index file at something like `~/.psqlrc-my_special_queries` resembling the `.psqlrc-admin` file. Each entry will reference a single-query file in `~/.psqlrc-aliases/my_special_queries`.
* Finally, at the bottom of `.psqlrc` add a line like this to link to your new aliases index:

    \ir .psqlrc-my_special_queries

That's it! The next time you use `psql` from your shell, you'll have access to these queries by the shortcuts you've defined.

# Contributions
Please fork the repo and issue a pull request. Good additions are always welcome.
