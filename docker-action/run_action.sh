#!/bin/bash -x

rm testdb.db
ls
cat createdb.sql *.txt | sqlite3 testdb.db
ls

