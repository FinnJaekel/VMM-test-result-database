#!/bin/bash -x

ls
cat createdb.sql *.txt | sqlite3 testdb.db
/usr/bin/git add testdb.db && /usr/bin/git commit -m "new DB" && /usr/bin/git push 

