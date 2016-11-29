# Контакты
{: #contacts}

> Создание сделки с предустановленным источником и ответственным

~~~ shell
curl "https://app.salesap.ru/api/v1/contacts" \
  -X POST \
  -H "Content-Type: application/vnd.api+json" \
  -H "Authorization: Bearer api_token" \
  -d @- << EOF
     {
       "data":{
         "type":"contacts",
         "attributes":{
           "first-name":"Иван",
           "last-name":"Петров"
         },
         "relationships":{
           "source":{
             "data":{
               "type":"sources",
               "id":1
             }
           },
           "responsible":{
             "data":{
               "type":"users",
               "id":1
             }
           }
         }
       }
     }
EOF
~~~ 

----------------- | ------------------
JSON API type     | `contacts`
URL               | `/api/v1/contacts`
Список            | `GET /api/v1/contacts`
Чтение            | `GET /api/v1/contacts/{id}`
Создание          | `POST /api/v1/contacts`
Редактирование    | `PATCH /api/v1/contacts/{id}`
Удаление          | `DELETE /api/v1/contacts/{id}`

## Аттрибуты
{: #contacts-attributes}

> Ниже приведен пример формата данных, в реальном ответе будут присутствовать
все перечисленные аттрибуты

~~~ shell
{ "data": {
      "type":"contacts",
      "id":1,
      "attributes":{
        "first-name":"Иван",
        "last-name":"Петров",
        "work-phone":"+79001234567"
        "customs":{
          "custom-1":"5 собак",
          "custom-943":"2016-11-26T12:07:51.572+03:00"
        },
        "created-at":"2016-11-26T12:07:51.572+03:00",
        "updated-at":"2016-11-26T12:07:51.572+03:00",
        "archived-at":nil
      }
   }
}
~~~ 

### Основные аттрибуты

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
first-name     | `string`    | Иван            | да     | Имя
last-name      | `string`    | Иванов          | да     | Фамилия
middle-name    | `string`    | Иванович        | да     | Отчество
description    | `string`    | Описание        | да     | Описание
general-phone  | `string`    | `+79001234567`  | да     | Телефон (основной)
mobile-phone   | `string`    | `+79001234567`  | да     | Телефон (мобильный)
work-phone     | `string`    | `+79001234567`  | да     | Телефон (рабочий)
work-phone-postfix | `string` | `200`          | да     | Добавочный (рабочий)
other-phone    | `string`    | `+79001234567`  | да     | Телефон (дополнительный)
other-phone-postfix | `string` | `200`         | да     | Добавочный (дополнительный)
fax            | `string`    | `+79001234567`  | да     | Факс
email          | `string`    | help@salesap.ru | да     | E-mail адрес
other-email    | `string`    | help@salesap.ru | да     | E-mail адрес (дополнительный)
website        | `string`    | salesap.ru      | да     | Сайт
customs        | `hash`      | `{"custom-1":'custom value'}`| да     | Свои поля
created-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата создания
updated-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата обновления
archived-at    | `datetime`  | `2016-11-26T12:07:51.572+03:00` | да | Дата архивации

### Рабочий адрес

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
work-country   | `string`    | Свазиленд       | да     | Страна
work-region    | `string`    | Московская обл. | да     | Область, регион, край
work-city      | `string`    | Челябинск       | да     | Город, населенный пункт
work-zipcode   | `string`    | `100000`        | да     | Индекс
work-street    | `string`    | ул. Печатников  | да     | Улица, проспект
work-building  | `string`    | `12а`           | да     | Номер дома
work-housing   | `string`    | `3`             | да     | Корпус
work-apartment | `string`    | `123`           | да     | Номер офиса или квартиры

### Домашний адрес

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
home-country   | `string`    | Свазиленд       | да     | Страна
home-region    | `string`    | Московская обл. | да     | Область, регион, край
home-city      | `string`    | Челябинск       | да     | Город, населенный пункт
home-zipcode   | `string`    | `100000`        | да     | Индекс
home-street    | `string`    | ул. Печатников  | да     | Улица, проспект
home-building  | `string`    | `12а`           | да     | Номер дома
home-housing   | `string`    | `3`             | да     | Корпус
home-apartment | `string`    | `123`           | да     | Номер офиса или квартиры

### Соц. сети и мессенджеры

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
vkontakte      | `string`    | vk.com/durov    | да     | ВКонтакте
facebook       | `string`    | facebook.com    | да     | Facebook
linkedin       | `string`    | ru.linkedin.com | да     | Linked-in
odnoklassniki  | `string`    |                 | да     | Одноклассники
instagram      | `string`    | instagram.com   | да     | Instagram
twitter        | `string`    | twitter.com     | да     | Twitter
whatsapp       | `string`    |                 | да     | WhatsApp
viber          | `string`    |                 | да     | Viber
telegram       | `string`    |                 | да     | Telegram
skype          | `string`    |                 | да     | Skype

## Связи
{: #contacts-relationships}

> Пример данных (перечислены не все связи)

~~~ shell
{ "data": {
      "type":"contacts",
      "id":1,
      "relationships":{
        "responsible":{
          "links":{
            "self":"/api/v1/contacts/1/relationships/responsible",
            "related":"/api/v1/contacts/1/responsible"
          }
        },
        "contact-type":{
          "links":{
            "self":"/api/v1/contacts/1/relationships/contact-type",
            "related":"/api/v1/contacts/1/contact-type"
          }
        },
      }
   }
}
~~~

> Пример запроса с загруженными отвественными и типом контакта

~~~ shell
curl "https://app.salesap.ru/api/v1/contacts?include=responsible,contact-type" \
  -H "Authorization: Bearer api_token"
~~~ 

Каждая связь может быть включена в JSON ответ через параметр `include`, согласно
официальной спецификации [JSON API Inclusion of Related Resources](http://jsonapi.org/format/1.0/#fetching-includes).

Название            | Связь            | JSON API type
------------------- | ---------------- | --------------
Ответственный       | responsible      | `users`
Создатель           | user             | `users`
Источник            | source           | `sources`
Статус              | status           | `contact-statuses`
Тип                 | contact-type     | `contact-types`
