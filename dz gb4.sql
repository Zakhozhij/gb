/*
Задание №1.. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
	SELECT MARK, COLOR, COUNT(MARK) FROM AUTO WHERE MARK = 'BMW' OR MARK = 'LADA' GROUP BY MARK,COLOR

Задание №2.. Вывести на экран марку авто(количество) и количество авто не этой
марки.
	SELECT 
		sum(IF(MARK = 'BMW', 1, 0)) AS myMark,
		sum(IF(MARK <> 'BMW', 1, 0)) AS otherMark
	FROM AUTO 

Задание №3 Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
	SELECT a.id,a.text FROM test_a AS a LEFT JOIN test_b AS b ON a.id=b.id WHERE b.id IS NULL
*/

