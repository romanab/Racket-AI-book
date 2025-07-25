#lang racket

;; raco pkg install sqlite-table

(require db)
(require sqlite-table)

(define db-file "test.db")

(define db (sqlite3-connect #:database db-file #:mode 'create))

(query-exec db
     "create  table person (name varchar(30), age integer, email varchar(20))")

(query-exec db
     "insert into person values ('Mary', 34, 'mary@test.com')")

(println (query-rows db "select * from person"))
