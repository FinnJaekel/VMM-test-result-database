#!/bin/bash -x

rm testdb.db
cat createdb.sql *.txt | sqlite3 testdb.db


