/*
Создайте таблицу “workers” (“id”, “birthday”, “name”, “salary”).

Задачи на INSERT
Добавьте нового работника Никиту, 90го года, зарплата 300$.
Добавьте нового работника Светлану с зарплатой 1200$.
Добавьте двух новых работников одним запросом: Ярослава с зарплатой 1200$ и годом 80го, Петра с зарплатой 1000$ и 93 года.
*/

CREATE TABLE "workers" (
  "id" serial PRIMARY KEY,
  "birthday" date NOT NULL,
  "name" varchar(64) NOT NULL,
  "salary" numeric
);

SELECT *
FROM "workers";

INSERT INTO "workers" ("birthday", "name", "salary")
VALUES('1990-1-1', 'Вася', '500');


INSERT INTO "workers" ("birthday", "name", "salary")
VALUES('1993-4-4', 'Светлана', '1200');

INSERT INTO "workers" ("birthday", "name", "salary")
VALUES
('1980-1-3', 'Ярослав', '1200'),
('1997-1-4', 'Коля', '1000'),
('1998-1-4', 'Коля', '1000'),
('1999-1-4', 'Коля', '1000');

/*
Задачи на UPDATE
Поставьте Васе зарплату в 200$.
Работнику с id=4 поставьте год рождения 87й.
Всем, у кого зарплата 500$ сделайте ее 700$.
Работникам с id больше 2 и меньше 5 включительно поставьте год 99.
Поменяйте Васю на Женю и прибавьте ему зарплату до 900$.
*/


UPDATE "workers"
SET "salary" = 200
WHERE "name" = 'Никита';

UPDATE "workers"
SET "birthday" = '1987-1-4'
WHERE "id" = 4;

UPDATE "workers"
SET "salary" = 700
WHERE "salary" = 500;

UPDATE "workers"
SET "birthday" = '1999-1-1'
WHERE "id" BETWEEN 2 AND 5;

UPDATE "workers"
SET "name" = 'Женя',
"salary" = 900
WHERE "name" = 'Вася';

/*
Задачи на SELECT
Выбрать работника с id = 3.
Выбрать работников с зарплатой более 400$.
Выбрать работников с зарплатой НЕ равной 500$.
Узнайте зарплату и возраст Жени.
Выбрать работников с именем Петя.
Выбрать всех, кроме работников с именем Петя.
Выбрать всех работников в возрасте 27 лет или с зарплатой 1000$.
Выбрать работников в возрасте от 25 (не включительно) до 28 лет (включительно).
Выбрать всех работников в возрасте от 23 лет до 27 лет или с зарплатой от 400$ до 1000$.
Выбрать всех работников в возрасте 27 лет или с зарплатой не равной 400$.
*/

SELECT *
FROM "workers"
WHERE "id" = 3;

SELECT *
FROM "workers"
WHERE "salary" > 400;

SELECT *
FROM "workers"
WHERE "salary" != 500;

SELECT "salary", "birthday"
FROM "workers"
WHERE "name" = 'Женя';

SELECT *
FROM "workers"
WHERE "name" = 'Петро';

SELECT *
FROM "workers"
WHERE extract(year from age("birthday")) = 27 OR "salary" = 1000;

SELECT *
FROM "workers"
WHERE extract(year from age("birthday")) > 25 AND extract(year from age("birthday")) <= 28;

SELECT *
FROM "workers"
WHERE extract(year from age("birthday")) > 23 AND extract(year from age("birthday")) <= 27 OR "salary" > 400 AND "salary" < 1000;

SELECT *
FROM "workers"
WHERE extract(year from age("birthday")) = 27 OR "salary" != 400;

/*
Задачи на DELETE
Удалите работника с id=7.
Удалите Колю.
Удалите всех работников, у которых возраст 23 года.
*/

DELETE 
FROM "workers"
WHERE "id" = 7;

DELETE 
FROM "workers"
WHERE "name" = 'Коля';

DELETE 
FROM "workers"
WHERE extract(year from age("birthday")) = 23;