# **1. Киселев А.И., ИС22/9-1**

# **2. База данных**
# ![Схема бд в supabase](/images/bd_schema.png)

 ## 2.1 ***Таблица Orders***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **createdAt (DATETIME):** Время создания заказа, по умолчанию текущее время.
 - **deliveryAddress (TEXT):** Адрес доставки заказа.
 - **clientID (INTEGER):** Внешний ключ, связанный с таблицей Clients (id).
 - **courierID (INTEGER):** Внешний ключ, связанный с таблицей Couriers (id).
 - **paymentMethodID (INTEGER):** Внешний ключ, связанный с таблицей PaymentMethod (id).
 - **dishID (INTEGER):** Внешний ключ, связанный с таблицей Dishes (id). <br>
 ## ![фото таблицы](/images/table_orders.png)

  ## 2.2 ***Таблица Clients***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **fullName (TEXT):** Полное имя клиента.
 - **gender (VARCHAR(1)):** Пол клиента.
 - **phoneNumber (TEXT):** Номер телефона клиента.
 ## ![фото таблицы](/images/table_clients.png)

  ## 2.3 ***Таблица Couriers***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **fullName (TEXT):** Полное имя курьера.
 - **gender (VARCHAR(1)):** Пол курьера.
 - **dateOfBirth (DATE):** Дата рождения курьера.
 - **phoneNumber (TEXT):** Номер телефона курьера.
 ## ![фото таблицы](/images/table_couriers.png)

  ## 2.4 ***Таблица Dishes***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **name (TEXT):** Название блюда.
 - **price (INTEGER):** Цена блюда.
 - **canteenID (INTEGER):** Внешний ключ, связанный с таблицей Canteens (id).
 ## ![фото таблицы](/images/table_dishes.png)

 ## 2.5 ***Таблица Canteens***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **name (TEXT):** Название заведения.
 - **address (TEXT):** Адрес заведения.
 ## ![фото таблицы](/images/table_canteens.png)

 ## 2.6 ***Таблица PaymentMethod***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **method (TEXT):** Метод оплаты.
 ## ![фото таблицы](/images/table_payment_method.png)

 # **3. Демонстрация работы функции UNION**
```sql
SELECT id, name FROM Canteens
UNION
SELECT id, fullName AS name FROM Clients
```
### Результатом выполнения этого запроса будет таблица, состоящая из двух атрибутов: id и name. Записи в этой таблице будут взяты и объединены из таблиц Canteens и Clients.
 # ![результат запроса](/images/demo_union.png)

 # **4. Демонстрация работы функции ORDER BY**
```sql
SELECT * FROM Dishes
ORDER BY price DESC
```
### Этот запрос отсортирует все записи в таблице Dishes по атрибуту price в порядке убывания и выведет их. Иначе говоря, самые дорогие блюда будут отображаться в начале результата запроса.
 # ![результат запроса](/images/demo_order_by.png) 

  # **5. Демонстрация работы функции HAVING**
  ```sql
SELECT gender, COUNT(id) AS clientCount
FROM Clients
GROUP BY gender
HAVING clientCount >= 2
```
### Этот запрос подсчитывает количество клиентов каждого пола (gender) в таблице Clients. Затем результаты группируются по полу, оставляя только те группы, где количество клиентов больше либо равно 2.
 # ![результат запроса](/images/having_demo.png) 

   # **6. Демонстрация работы вложенных запросов:**
## 6.1 ***Вложенный запрос в SELECT***
```sql
SELECT fullName,
(SELECT COUNT(id) FROM Orders WHERE Orders.clientID = Clients.id) AS orderCount
FROM Clients
```
### Этот запрос выводит имена клиентов и количество заказов каждого клиента. Вложенный запрос подсчитывает количество заказов для каждого клиента, используя связь между таблицами Orders и Clients.
 # ![результат запроса](/images/demo_subreq_select.png) 

 ## 6.2 ***Вложенный запрос в WHERE***
 ```sql
SELECT name
FROM Dishes
WHERE canteenID IN (SELECT id FROM Canteens WHERE address = 'ул. 30 лет Победы 46');
 ```
 ### Этот запрос выводит все блюда, которые предлагаются в заведении на улице 30 лет Победы, дом 48. Вложенный запрос здесь нужен для выбора ID столовой по её адресу.
  # ![результат запроса](/images/demo_subreq_where.png) 