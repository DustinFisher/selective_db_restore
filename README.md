# README
This is an example repo to support a post on my blog
here:

[Rails & Postgres - Selectively Restoring From a Compressed pg_dump File](https://dustinfisher.com/posts/rails-postgres-selective-table-restores/)

### Problem
You have a backup of a postgres database from the `pg_dump`
command that was output via the custom format resulting
in a compressed file.

Now you want to take this file to another environment and don't need certain tables fully restored with data.

### Rake Task
You can run the following rake task and it will use the
included compressed db dump file to restore a seeded
database that was generated with data from the Faker
gem.

```bash
bin/rake db:selective_restore[hops,fermentables]
```

Any table names passed in as args will be skipped
during the import.

If you want more details on this you can follow the
link at the top to the blog post.
