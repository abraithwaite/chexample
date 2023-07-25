Role confusion in clickhouse
----------------------------

In this repo, I've created examples which result in inconsistent and unexpected
state in clickhouse involving roles and materialized views.

Here's what I'm observing:

When creating a new role, with policies and grants, then granting that role to
a superuser (runreveal in this case), I'd expect that that superuser would be
able to continue using it's superuser powers to insert/update data as expected.

What I'm seeing is that after creating a role for a customer, then trying to
insert data for that customer, some very strange things happen.

```
# This will create the scaffold for this bug report.
docker-compose up -d
```

Run all the queries in `manual.sql` to follow along.

Connect to the shell:

```
docker-compose exec -it clickhouse clickhouse-client -h localhost -d default -u runreveal --password password
```

Create a new role and assign it some row policies and SELECT grants.

Without closing the current sql shell, insert some data into source table. The
insert succeeds with no errors.

Then, when trying to read the source table, you can't see any data even though
the former query succeeded.  You can't see any data in the dest data table either.

Login to another session for clickhouse with the user runreveal as above.

You can now see the source data, but the row is not present in the dest table.

Using this new shell/session, you can now insert into the source table and see
data appear in the dest table.

What do I expect to happen?

Mostly, I expect to see the rows appear in the dest table. I also expect to be
able to query the source and dest tables freely if I have not yet called SET
ROLE.

However, if for some reason there's a valid reason why it should not work that way,
then I expect an error to be returned when trying to insert into the source
table.

Workaround is to kill & recreate the connections after creating roles.
