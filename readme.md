# **1. Киселев А.И., ИС22/9-1**

# **2. База данных**
![Схема бд в supabase](/images/bd_schema.png)
 На данном изображении представлена база данных службы доставки еды. Состоит эта бд из 6 таблиц, связанных между собой, а именно: таблица "Заказы", таблица "Клиенты", таблица "Курьеры", таблица "Блюда", таблица "Заведения" и таблица "Способ Оплаты".

 ## 2.1 ***Таблица Orders***
 ![фото таблицы](/images/table_couriers.png)
 ![наполнение таблицы](/images/select_orders.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **createdAt (DATETIME):** Время создания заказа, по умолчанию текущее время.
 - **deliveryAddress (TEXT):** Адрес доставки заказа.
 - **clientID (INTEGER):** Внешний ключ, связанный с таблицей Clients (id).
 - **courierID (INTEGER):** Внешний ключ, связанный с таблицей Couriers (id).
 - **paymentMethodID (INTEGER):** Внешний ключ, связанный с таблицей PaymentMethod (id).
 - **dishID (INTEGER):** Внешний ключ, связанный с таблицей Dishes (id). <br>

  ## 2.2 ***Таблица Clients***
  ![фото таблицы](/images/table_couriers.png)
  ![наполнение таблицы](/images/select_clients.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **fullName (TEXT):** Полное имя клиента.
 - **gender (VARCHAR(1)):** Пол клиента.
 - **phoneNumber (TEXT):** Номер телефона клиента.

  ## 2.3 ***Таблица Couriers***
  ![фото таблицы](/images/table_couriers.png)
  ![наполнение таблицы](/images/select_couriers.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **fullName (TEXT):** Полное имя курьера.
 - **gender (VARCHAR(1)):** Пол курьера.
 - **dateOfBirth (DATE):** Дата рождения курьера.
 - **phoneNumber (TEXT):** Номер телефона курьера.

  ## 2.4 ***Таблица Dishes***
  ![фото таблицы](/images/table_dishes.png)
  ![наполнение таблицы](/images/select_dishes.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **name (TEXT):** Название блюда.
 - **price (INTEGER):** Цена блюда.
 - **canteenID (INTEGER):** Внешний ключ, связанный с таблицей Canteens (id).

 ## 2.5 ***Таблица Canteens***
 ![фото таблицы](/images/table_canteens.png)
 ![наполнение таблицы](/images/select_canteens.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **name (TEXT):** Название заведения.
 - **address (TEXT):** Адрес заведения.

 ## 2.6 ***Таблица PaymentMethod***
 ![фото таблицы](/images/table_payment_method.png)
 ![наполнение таблицы](/images/select_paymentmethod.png)
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **method (TEXT):** Метод оплаты.

 # **3. Демонстрация работы функции UNION**
```sql
SELECT id, name FROM Canteens
UNION
SELECT id, fullName AS name FROM Clients
```
Результатом выполнения этого запроса будет таблица, состоящая из двух атрибутов: id и name. Записи в этой таблице будут взяты и объединены из таблиц Canteens и Clients.

 # ![результат запроса](/images/demo_union.png)

 # **4. Демонстрация работы функции ORDER BY**
```sql
SELECT * FROM Dishes
ORDER BY price DESC
```
Этот запрос отсортирует все записи в таблице Dishes по атрибуту price в порядке убывания и выведет их. Иначе говоря, самые дорогие блюда будут отображаться в начале результата запроса.

 # ![результат запроса](/images/demo_order_by.png) 

  # **5. Демонстрация работы функции HAVING**
  ```sql
SELECT gender, COUNT(id) AS clientCount
FROM Clients
GROUP BY gender
HAVING clientCount >= 2
```
Этот запрос подсчитывает количество клиентов каждого пола (gender) в таблице Clients. Затем результаты группируются по полу, оставляя только те группы, где количество клиентов больше либо равно 2.

 # ![результат запроса](/images/having_demo.png) 

   # **6. Демонстрация работы вложенных запросов**
## 6.1 ***Вложенный запрос в SELECT***
```sql
SELECT fullName,
(SELECT COUNT(id) FROM Orders WHERE Orders.clientID = Clients.id) AS orderCount
FROM Clients
```
Этот запрос выводит имена клиентов и количество заказов каждого клиента. Вложенный запрос подсчитывает количество заказов для каждого клиента, используя связь между таблицами Orders и Clients.

 # ![результат запроса](/images/demo_subreq_select.png) 

 ## 6.2 ***Вложенный запрос в WHERE***
 ```sql
SELECT name
FROM Dishes
WHERE canteenID IN (SELECT id FROM Canteens WHERE address = 'ул. 30 лет Победы 46');
 ```
 Этот запрос выводит все блюда, которые предлагаются в заведении на улице 30 лет Победы, дом 48. Вложенный запрос здесь нужен для выбора ID заведения по его адресу.

  # ![результат запроса](/images/demo_subreq_where.png) 

  
# ***7. Демонстрация работы оконных функций***
## 7.1 **Агрегатными функциями**
```sql
/* Все записи будут взяты из таблицы Dishes */
SELECT AVG(price) FROM Dishes; -- Выведет среднюю цену среди всех блюд
SELECT SUM(price) FROM Dishes; -- Выведет сумму цен всех блюд
SELECT MIN(price) FROM Dishes; -- Выведет минимальную цену среди всех блюд
SELECT MAX(price) FROM Dishes; -- Выведет максимальную цену среди всех блюд
SELECT COUNT(id) FROM Dishes; -- Выведет общее количество блюд
```
![результат запроса](/images/avg.png) 
![результат запроса](/images/sum.png) 
![результат запроса](/images/min.png) 
![результат запроса](/images/max.png) 
![результат запроса](/images/count.png) 
## 7.2 **Ранжирующими функциями**
```sql
SELECT id, fullName, gender, dateOfBirth,
       ROW_NUMBER() OVER (ORDER BY dateOfBirth) AS courierRank
FROM Couriers;
```
Данный запрос выводит все атрибуты из таблицы Couriers, а также добавляет ранг курьеру согласно дате рождения (по возрастанию).

# ![результат запроса](/images/row_number.png) 

```sql
SELECT id, name, price,
       RANK() OVER (ORDER BY price DESC) AS rank
FROM Dishes;
```
В данном запросе значения атрибута rank выставляются по убыванию цены в таблице Dishes (в случае равного значения price ранг будет одинаковым).

# ![результат запроса](/images/rank.png) 

```sql
SELECT id, fullName, gender,
       DENSE_RANK() OVER (PARTITION BY gender ORDER BY id) as dense_rank
FROM Clients;
```
В данном случае ранжирование идет по возрастанию id клиента. Отличие функции dense_rank от остальных представленных - разделение по группам, в данном случае разделение идет по полу, т.е. у мужчин и женщин свое разделение по рангам.

# ![результат запроса](/images/dense_rank.png) 

## 7.2 **Функциями смещения**
```sql
SELECT id, name, price,
       LAG(price) OVER (ORDER BY id) AS prevPrice
FROM Dishes;
```
Этот запрос использует функцию LAG() для получения цены предыдущего блюда (т.е. блюда с id - 1) в порядке возрастания идентификаторов. Результирующая таблица будет содержать идентификатор блюда, его название, текущую цену и предыдущую цену.

# ![результат запроса](/images/prevPrice.png) 

```sql
SELECT id, name, price,
       LEAD(price) OVER (ORDER BY id) AS nextPrice
FROM Dishes;
```
В данном случае запрос использует функцию LAG() для получения цены следующего блюда (т.е. блюда с id + 1) в порядке возрастания идентификаторов. Результирующая таблица будет содержать идентификатор блюда, его название, текущую цену и предыдущую цену.

# ![результат запроса](/images/nextPrice.png) 

# ***8. Демонстрация работы всех видов join***
## 8.1 **INNER JOIN ИЛИ ПРОСТО JOIN**
```sql
SELECT Orders.id, Orders.createdAt, Clients.fullName
FROM Orders
INNER JOIN Clients ON Orders.clientID = Clients.id;
```
Этот запрос соединяет таблицу Orders с таблицей Clients по полю clientID. Результат будет содержать идентификатор заказа (Orders.id), дату создания заказа (Orders.createdAt) и полное имя клиента (Clients.fullName) для каждого заказа. В результирующей таблице будут только те строки, где значения поля clientID в таблице Orders совпадают со значениями поля id в таблице Clients.

![результат запроса](/images/inner_join.png) 

## 8.2 **LEFT JOIN**
```sql
SELECT Orders.id, Orders.createdAt, Clients.fullName
FROM Orders
LEFT JOIN Clients ON Orders.clientID = Clients.id;
```
Здесь запрос использует LEFT JOIN для соединения таблицы Orders с таблицей Clients. Результат будет содержать идентификатор заказа (Orders.id), дату создания заказа (Orders.createdAt) и полное имя клиента (Clients.fullName) для каждого заказа. В результирующей таблице будут все строки из таблицы Orders, даже если нет соответствующих строк в таблице Clients.

![результат запроса](/images/left_join.png) 

## 8.3 **RIGHT JOIN**
```sql
SELECT Orders.id, Orders.createdAt, Clients.fullName
FROM Orders
RIGHT JOIN Clients ON Orders.clientID = Clients.id;
```
В данном случае запрос использует RIGHT JOIN для соединения таблицы Orders с таблицей Clients. Результат будет содержать идентификатор заказа (Orders.id), дату создания заказа (Orders.createdAt) и полное имя клиента (Clients.fullName) для каждого клиента. В результирующей таблице будут все строки из таблицы Clients, даже если нет соответствующих строк в таблице Orders.

![результат запроса](/images/right_join.png) 

## 8.4 **FULL JOIN**
```sql
SELECT Orders.id, Orders.createdAt, Clients.fullName
FROM Orders
FULL JOIN Clients ON Orders.clientID = Clients.id;
```
Этот запрос использует FULL JOIN для соединения таблицы Orders с таблицей Clients. Результат будет содержать идентификатор заказа (Orders.id), дату создания заказа (Orders.createdAt) и полное имя клиента (Clients.fullName) для каждого заказа и клиента. В результирующей таблице будут все строки из обеих таблиц, а если нет соответствующих строк в одной из таблиц, соответствующие значения будут NULL.

![результат запроса](/images/full_join.png) 

## 8.5 **CROSS JOIN**
```sql
SELECT Orders.id, Orders.createdAt, Clients.fullName
FROM Orders
CROSS JOIN Clients;
```
Тут запрос использует CROSS JOIN для создания комбинации всех строк из таблицы Orders и всех строк из таблицы Clients. Результат будет содержать идентификатор заказа (Orders.id), дату создания заказа (Orders.createdAt) и полное имя клиента (Clients.fullName) для каждой возможной комбинации заказа и клиента. <br>
![результат запроса](/images/cross_join1.png) 
![результат запроса](/images/cross_join2.png) 
![результат запроса](/images/cross_join3.png) 
![результат запроса](/images/cross_join4.png) 
![результат запроса](/images/cross_join5.png) 

# ***9. Демонстрация работы CASE***
```sql
SELECT fullName, 
       CASE 
           WHEN gender = 'М' THEN 'Мужской'
           WHEN gender = 'Ж' THEN 'Женский'
           ELSE 'Не указан'
       END AS fullGender
FROM Clients;

```
Этот запрос использует оператор CASE для выполнения различных действий в зависимости от значения столбца gender. Если значение gender равно 'М', возвращается строка 'Мужской', если 'Ж' - 'Женский', в противном случае - 'Не указан'. Результатом запроса будет список имен и фамилий клиентов с указанием их пола.
![результат запроса](/images/case.png) 

# ***10. Демонстрация работы WITH***
```sql
WITH OrderCounts AS (
    SELECT clientID, COUNT(id) AS totalOrders
    FROM Orders
    GROUP BY clientID
)
SELECT clients.fullName, OrderCounts.totalOrders
FROM Clients
JOIN OrderCounts ON Clients.id = OrderCounts.clientID;
```
В этом запросе используется оператор WITH для создания временного набора данных под названием OrderCounts. В этом наборе данных идет подсчет количества заказов для каждого клиента путем группировки заказов по clientID и подсчета их с помощью функции COUNT(id). Затем основной запрос объединяет таблицу Clients с временным набором данных OrderCounts с помощью inner join, чтобы получить информацию о клиентах и общем количестве их заказов.
![результат запроса](/images/with.png) 

