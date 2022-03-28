CREATE TABLE tours
	(id bigint primary key,
	node1 varchar not null ,
 	node2 varchar not null ,
 	cost int not null);

INSERT INTO tours VALUES (1, 'A', 'B', 10);
INSERT INTO tours VALUES (2, 'B', 'A', 10);
INSERT INTO tours VALUES (3, 'A', 'D', 20);
INSERT INTO tours VALUES (4, 'D', 'A', 20);
INSERT INTO tours VALUES (5, 'A', 'C', 15);
INSERT INTO tours VALUES (6, 'C', 'A', 15);
INSERT INTO tours VALUES (7, 'B', 'C', 35);
INSERT INTO tours VALUES (8, 'C', 'B', 35);
INSERT INTO tours VALUES (9, 'D', 'B', 25);
INSERT INTO tours VALUES (10, 'B', 'D', 25);
INSERT INTO tours VALUES (11, 'D', 'C', 30);
INSERT INTO tours VALUES (12, 'C', 'D', 30);















