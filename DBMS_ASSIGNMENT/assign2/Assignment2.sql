create database college;

mysql> create table student_1(
    -> roll int, name varchar(20),marks float,age int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc student_1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| roll  | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| marks | float       | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> alter table student_1 modify column marks int;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student_1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| roll  | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| marks | int         | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> alter table student_1 drop column age;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student_1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| roll  | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| marks | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> show tables;
+----------------------+
| Tables_in_college_b1 |
+----------------------+
| student              |
| student_1            |
| student_2            |
+----------------------+
3 rows in set (0.00 sec)

mysql> truncate student_1;
Query OK, 0 rows affected (0.04 sec)

mysql> desc student_1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| roll  | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| marks | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> Drop table student_1;
Query OK, 0 rows affected (0.02 sec)

mysql> Drop database college;

