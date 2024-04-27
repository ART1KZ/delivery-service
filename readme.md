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
 - **name (TEXT):** Название кафе.
 - **address (TEXT):** Адрес заведения.
 ## ![фото таблицы](/images/table_canteens.png)
 ## 2.6 ***Таблица PaymentMethod***
 - **id (INTEGER):** Первичный ключ, автоинкрементируемый.
 - **method (TEXT):** Метод оплаты.
 ## ![фото таблицы](/images/table_payment_method.png)

 # **3. Демонстрация работы функции UNION**

