#!/bin/bash -x

ls
cat createdb.sql *.txt | sqlite3 testdb.db
git add testdb.db && git commit -m "new DB" && git push 

