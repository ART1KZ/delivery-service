CREATE TABLE Canteens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  address TEXT
  );
CREATE TABLE Clients (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  gender VARCHAR(1),
  phoneNumber TEXT
  );
CREATE TABLE Couriers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  gender VARCHAR(1),
  dateOfBirth DATE,
  phoneNumber TEXT
  );
CREATE TABLE Dishes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  price INTEGER NOT NULL,
  canteenID INTEGER,
  FOREIGN KEY (canteenID) REFERENCES Canteens (id)
  );
CREATE TABLE PaymentMethod (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  method TEXT
  );
CREATE TABLE Orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  dateAndTime DATETIME,
  deliveryAddress TEXT,
  clientID INTEGER,
  courierID INTEGER,
  paymentMethodID INTEGER,
  dishID INTEGER,
  FOREIGN KEY (clientID) REFERENCES Clients (id),
  FOREIGN KEY (courierID) REFERENCES Couriers (id),
  FOREIGN KEY (paymentMethodID) REFERENCES PaymentMethod (id)
  );



INSERT INTO Canteens (name, address)
VALUES ('Rostics', 'Нефтеюганское ш., 1'),
       ('KFC', 'ул. 30 лет Победы, 74'),
       ('Burger King', 'пр. Ленина, 37'),
       ('Вкусно — и точка', 'ул. 30 лет Победы, 46'),
       ('Pizza Hans', 'ул. Маяковского, 45В'),
       ('Суши Мастер', 'Геологическая ул., 10'),
       ('Галерея Суши', 'просп. Набережный, 12/2'),
       ('Додо Пицца', 'ул. Энергетиков, 12'),
       ('Subway', 'ул. Мелик-Карамова, 4'),
       ('Пироговая № 1', 'ул. Маяковского, 7');
INSERT INTO Clients (fullname, gender, phoneNumber)
VALUES ('Киселев Артем', 'М', '89505377540'),
       ('Иванова Софья', 'Ж', '89285746205'),
       ('Куликов Николай', 'М', '89672876110'),
       ('Баженов Дмитрий', 'М', '89706367640'),
       ('Новикова Анастасия', 'Ж', '89225437629'),
       ('Воронин Александр', 'М', '89125437629'),
       ('Рожкова Виктория', 'Ж', '89325437629'),
       ('Горелов Григорий', 'М', '89425437629'),
       ('Моисеев Фёдор', 'М', '89525437629'),
       ('Иванов Павел', 'М', '89625437629');
INSERT INTO Couriers (fullname, gender, dateOfBirth, phoneNumber)
VALUES ('Горюнов Фёдор', 'М', '1998-03-12', '89495618287'),
       ('Назарова Марьям', 'Ж', '2002-03-28', '89495600035'),
       ('Чумаков Богдан', 'М', '1996-01-03', '89495901105'),
       ('Трофимов Юрий', 'М', '2004-08-03', '89495866678'),
       ('Демидова Вероника', 'Ж', '1995-06-22', '89495515725'),
       ('Казанцева Злата', 'Ж', '2004-02-06', '89495784622'),
       ('Молчанов Кирилл', 'М', '2004-01-12', '89495475197'),
       ('Данилова Анна', 'Ж', '1992-08-14', '89495836940'),
       ('Голованов Богдан', 'М', '1997-11-28', '89495338418'),
       ('Лосева Стефания', 'Ж', '2000-04-21', '89495742057');
INSERT INTO Dishes (name, price, canteenID)
VALUES ('Пицца большая Пепперони', 899, 5),
       ('Чизбургер', '99', 1),
       ('Двойной Чизбургер', 179, 2),
       ('Кинг Баскет', 349, 3),
       ('Чикенбургер с беконом', 149, 4),
       ('Роллы Филадельфия 8шт.', 349, 6),
       ('Запеченные роллы с мидиями 8шт.', 289, 7),
       ('Пицца средняя Четыре сыра', 699, 8),
       ('Итальянский сендвич', 299, 9),
       ('Пирог с курицей', 599, 10);
INSERT INTO PaymentMethod (method)
VALUES ('Наличные'),
	   ('Карта'),
       ('Картой при получении');
INSERT INTO Orders (dateAndTime, deliveryaddress, clientID, courierID, PaymentMethodID, dishID)
VALUES ('2024-04-03 14:38:57', 'Калинина ул., д. 12 кв.205', 10, 1, 1, 1),
       ('2024-04-03 16:10:54', 'Южная ул., д. 7 кв.86', 8, 3, 1, 2),
       ('2024-04-09 12:41:39', 'Зеленая ул., д. 16 кв.50', 7, 2, 2, 3), 
       ('2024-04-13 19:36:02', 'Радужная ул., д. 13 кв.153', 4, 4, 1, 4), 
       ('2024-04-04 16:03:01', 'Железнодорожная ул., д. 6 кв.150', 5, 6, 3, 5),
       ('2024-04-03 18:40:10', 'Кирова ул., д. 25 кв.11', 6, 5, 3, 6), 
       ('2024-04-18 17:30:05', 'Спортивная ул., д. 1 кв.117', 3, 9, 2, 7),
       ('2024-04-07 20:13:00', 'Приозерная ул., д. 14 кв.43', 9, 7, 1, 8),
       ('2024-04-01 20:59:01', 'Березовая ул., д. 21 кв.156', 2, 8, 3, 9), 
       ('2024-04-11 11:37:50', 'Коммунистическая ул., д. 3 кв.209', 1, 10, 2, 10);