#Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

BEGIN
	DECLARE x INT DEFAULT start_value;
	DECLARE y INT DEFAULT end_value;
	DECLARE result TEXT DEFAULT '';
	WHILE X<=y DO
		IF (MOD(x, 2)=0) THEN
		    SET result = CONCAT(result,' ',X);
		END IF;
		SET X = X+1;
	END WHILE;
	return result;
END

SELECT even(1,10)

#Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
BEGIN
	DECLARE start_value INT DEFAULT seconds;
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minutes INT DEFAULT 0;
	DECLARE seconds INT DEFAULT 0;
	DECLARE result TEXT DEFAULT '';

	SET days = FLOOR(start_value/(24*3600));
	if(days>0) THEN
		SET result = CONCAT(days,' days');
		SET start_value = start_value- (days*24*3600);
	END if;
	
	SET hours = FLOOR(start_value/(3600));
	if(hours>0) THEN
		SET result = CONCAT(result,' ',hours,' hours');
		SET start_value = start_value- (hours*3600);
	END if;
	
	SET minutes = FLOOR(start_value/(60));
	if(minutes>0) THEN
		SET result = CONCAT(result,' ',minutes,' minutes');
		SET start_value = start_value- (minutes*60);
	END if;
	
	if(start_value>0) THEN
		SET result = CONCAT(result,' ',start_value,' seconds');
	END if;
	
	return result;
END

SELECT transformDate(123456)