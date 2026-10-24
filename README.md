# Celestial Bodies Database

A PostgreSQL relational database project completed as part of
freeCodeCamp's Relational Database Certification.

This repository contains a SQL dump of the `universe` database,
including its schema, data, and relational constraints.

This is a personal educational project and is not an official
freeCodeCamp repository.

## Database Overview

The database models celestial bodies through five related tables.

| Table | Row Count |
|---|---:|
| `galaxy_type` | 3 |
| `galaxy` | 6 |
| `star` | 6 |
| `planet` | 12 |
| `moon` | 20 |

### Relationships

- `galaxy.galaxy_type_id` references
  `galaxy_type.galaxy_type_id`.
- `star.galaxy_id` references `galaxy.galaxy_id`.
- `planet.star_id` references `star.star_id`.
- `moon.planet_id` references `planet.planet_id`.

The relationships form this hierarchy:

`galaxy_type` → `galaxy` → `star` → `planet` → `moon`

## Repository Contents

- `universe.sql` — SQL dump containing the database schema and data.
- `README.md` — Project documentation and setup instructions.
- `.gitignore` — Excludes common local files and artifacts.
- `.gitattributes` — Standardizes text-file line endings.
- `.editorconfig` — Provides consistent editor formatting settings.

## Requirements

- PostgreSQL compatible with the SQL dump.
- The PostgreSQL command-line client (`psql`).
- A database role with permission to create databases.

## Restore the Database

The SQL dump creates a database named `universe`.

Run the following command from the directory containing `universe.sql`:

~~~bash
psql -U postgres -d postgres -f universe.sql
~~~

Replace `postgres` with an appropriate PostgreSQL role if necessary.

The dump excludes the original database owner's settings and
privilege statements. Objects will belong to the role performing
the restoration.

**Important:** If a database named `universe` already exists,
the creation step may fail. Back up any existing database before
replacing it.

## Verify the Restored Database

List the tables:

~~~bash
psql -U postgres -d universe -c '\dt'
~~~

Check the row counts:

~~~sql
SELECT 'galaxy_type' AS table_name, COUNT(*) FROM galaxy_type
UNION ALL
SELECT 'galaxy', COUNT(*) FROM galaxy
UNION ALL
SELECT 'star', COUNT(*) FROM star
UNION ALL
SELECT 'planet', COUNT(*) FROM planet
UNION ALL
SELECT 'moon', COUNT(*) FROM moon;
~~~

Run the query while connected to the `universe` database.

## Regenerate the SQL Dump

After modifying the database, regenerate the dump from an
environment that can connect to it:

~~~bash
pg_dump --create --inserts --no-owner --no-privileges \
  -U freecodecamp universe > universe.sql
~~~

Adjust the username and connection options for your environment.

## Learning Objectives

This project demonstrates relational database design, primary
and foreign keys, referential integrity, SQL data management,
and PostgreSQL database export and restoration.
