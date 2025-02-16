# POSTGRES SQL Learning

    A learning node for POSTGRES SQL DB

### Resources

**Install DB**

[POSTGRES SQL](https://www.enterprisedb.com/postgres-tutorials/installation-postgresql-mac-os)

**DB Viewer**

[PG Admin](https://www.pgadmin.org/download/)

**DB Link**

[dvdrental](./dvdrental.tar)

**Restore DB**

```
pg_restore -U postgres -d dvdrental /Users/userId/Downloads/dvdrental.tar
```

[Restore DB Reference](https://www.postgresqltutorial.com/postgresql-administration/postgresql-restore-database/)

**POSTGRES SQL Tutorial**

[Tutorial](https://www.postgresqltutorial.com/postgresql-getting-started/)

**Set POSTGRES SQL Path**

```
export PATH=$PATH:/Library/PostgreSQL/16/bin
```

**Then create a virtual environment in your project directory**

```
python3 -m venv env
source env/bin/activate
```

**Open Jupyter notebook**

```
python3 -m jupyter notebook
```
