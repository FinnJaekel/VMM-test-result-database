#!/bin/bash -x

ls
cat createdb.sql *.txt | sqlite3 testdb.db
ls


