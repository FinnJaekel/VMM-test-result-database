#!/bin/bash -x

ls
rm testdb.db
cat createdb.sql *.txt | sqlite3 testdb.db



