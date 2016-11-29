# Компании
{: #companies}

> Создание компании с предустановленным источником и ответственным

~~~ shell
curl "https://app.salesap.ru/api/v1/companies" \
  -X POST \
  -H "Content-Type: application/vnd.api+json" \
  -H "Authorization: Bearer api_token" \
  -d @- << EOF
     {
       "data":{
         "type":"companies",
         "attributes":{
           "name":"ООО Радужные единороги",
           "description":"Коллекторское агенство"
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
JSON API type     | `companies`
URL               | `/api/v1/companies`
Список            | `GET /api/v1/companies`
Чтение            | `GET /api/v1/companies/{id}`
Создание          | `POST /api/v1/companies`
Редактирование    | `PATCH /api/v1/companies/{id}`
Удаление          | `DELETE /api/v1/companies/{id}`

## Аттрибуты
{: #companies-attributes}

~~~ shell
{ "data": {
      "type":"companies",
      "id":1,
      "attributes":{
        "created-at": "2015-12-21T23:25:30.691+03:00",
        "updated-at": "2016-02-25T20:19:21.080+03:00",
        "name": "ООО Рога",
        "general-phone": null,
        "work-phone": "7848200000",
        "mobile-phone": null,
        "other-phone": "78482000000",
        "fax": null,
        "country": "Россия",
        "city": "Новосибирск",
        "region": "Новосибирская область",
        "address": "Ворошилова, 1, корп. 1",
        "zip-code": null,
        "email": "email@mail.ru",
        "other-email": "mail@gmail.com",
        "website": "www.site.com",
        "juristic-country": "Россия",
        "juristic-region": "Новосибирская область",
        "juristic-city": "Новосибирск",
        "juristic-zip-code": "153512",
        "juristic-street": "Ворошилова",
        "juristic-house": "1",
        "juristic-build": "1",
        "juristic-office": "1",
        "actual-country": null,
        "actual-region": null,
        "actual-city": null,
        "actual-zip-code": null,
        "actual-street": null,
        "actual-house": null,
        "actual-build": null,
        "actual-office": null,
        "mailing-country": "Россия",
        "mailing-region": "Новосибирская область",
        "mailing-city": "Новосибирск",
        "mailing-zip-code": "382662",
        "mailing-street": "Ворошилова",
        "mailing-house": "1",
        "mailing-build": "1",
        "mailing-office": "1",
        "inn": null,
        "description": null,
        "full-name": null,
        "short-name": null,
        "ogrn": null,
        "kpp": null,
        "okved": null,
        "manager-name": null,
        "manager-position": null,
        "lawfulness-base": null,
        "accountant": null,
        "customs": {
          "custom-98": "",
          "custom-9": ""
        },
        "archived-at": null
      }
   }
}
~~~ 

### Основные аттрибуты

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
name           | `string`    | Иван            | да     | Название
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
country        | `string`    | РФ              | да     | Страна
region         | `string`    | Крымская обл.   | да     | Регион
city           | `string`    | Тамбов          | да     | Город
address        | `string`    | Молдавских партизан 13 | да | Адрес
zip-code       | `string`    | 190001          | да     | Индекс
customs        | `hash`      | `{"custom-1":'custom value'}`| да     | Свои поля
created-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата создания
updated-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата обновления
archived-at    | `datetime`  | `2016-11-26T12:07:51.572+03:00` | да  | Дата архивации

### Фактический адрес

Имя             | Тип         | Пример          | Запись | Описание
--------------  | ----------- | --------------- | ------ | --------
actual-country  | `string`    | Свазиленд       | да     | Страна
actual-region   | `string`    | Московская обл. | да     | Область, регион, край
actual-city     | `string`    | Челябинск       | да     | Город, населенный пункт
actual-zip-code | `string`    | `100000`        | да     | Индекс
actual-street   | `string`    | ул. Печатников  | да     | Улица, проспект
actual-house    | `string`    | `12а`           | да     | Номер дома
actual-build    | `string`    | `3`             | да     | Корпус
actual-office   | `string`    | `123`           | да     | Номер офиса

### Юридический адрес

Имя               | Тип         | Пример          | Запись | Описание
----------------- | ----------- | --------------- | ------ | --------
juristic-country  | `string`    | Свазиленд       | да     | Страна
juristic-region   | `string`    | Московская обл. | да     | Область, регион, край
juristic-city     | `string`    | Челябинск       | да     | Город, населенный пункт
juristic-zip-code | `string`    | `100000`        | да     | Индекс
juristic-street   | `string`    | ул. Печатников  | да     | Улица, проспект
juristic-house    | `string`    | `12а`           | да     | Номер дома
juristic-build    | `string`    | `3`             | да     | Корпус
juristic-office   | `string`    | `123`           | да     | Номер офиса

### Почтовый адрес

Имя              | Тип         | Пример          | Запись | Описание
---------------- | ----------- | --------------- | ------ | --------
mailing-country  | `string`    | Свазиленд       | да     | Страна
mailing-region   | `string`    | Московская обл. | да     | Область, регион, край
mailing-city     | `string`    | Челябинск       | да     | Город, населенный пункт
mailing-zip-code | `string`    | `100000`        | да     | Индекс
mailing-street   | `string`    | ул. Печатников  | да     | Улица, проспект
mailing-house    | `string`    | `12а`           | да     | Номер дома
mailing-build    | `string`    | `3`             | да     | Корпус
mailing-office   | `string`    | `123`           | да     | Номер офиса

### Реквизиты

Имя               | Тип         | Пример          | Запись | Описание
----------------- | ----------- | --------------- | ------ | --------
full-name         | `string`    | Общество с ограниченной ответственностью| да | Полное наименование
short-name        | `string`    | ООО "Рога"      | да     | Короткое наименование
inn               | `string`    | `62010101010101`| да     | ИНН
ogrn              | `string`    |`521300000000000`| да     | ОГРН
kpp               | `string`    | `62010101010101`| да     | КПП
okved             | `string`    |`234-456`        | да     | ОКВЭД
director          | `string`    | Иванков И.И.    | да     | Директор
accountant        | `string`    | Иванков И.И.    | да     | Бухгалтер
lawfulness-base   | `string`    |                 | да     | Правомочность
manager-name      | `string`    | Крабов В.В.     | да     | ФИО руководителя
manager-position  | `string`    | Официант        | да     | Должность руководителя


## Связи
{: #companies-relationships}

> Пример данных (перечислены не все связи)

~~~ shell
{ "data": {
      "type":"companies",
      "id":1,
      "relationships":{
        "responsible":{
          "links":{
            "self":"/api/v1/contacts/1/relationships/responsible",
            "related":"/api/v1/contacts/1/responsible"
          }
        },
        "company-type":{
          "links":{
            "self":"/api/v1/contacts/1/relationships/company-type",
            "related":"/api/v1/contacts/1/company-type"
          }
        },
      }
   }
}
~~~

> Пример запроса с загруженными отвественными и типом компании

~~~ shell
curl "https://app.salesap.ru/api/v1/companies?include=responsible,company-type" \
  -H "Authorization: Bearer api_token"
~~~ 

Каждая связь может быть включена в JSON ответ через параметр `include`, согласно
официальной спецификации [JSON API Inclusion of Related Resources](http://jsonapi.org/format/1.0/#fetching-includes).

Название            | Связь            | JSON API type
------------------- | ---------------- | --------------
Ответственный       | responsible      | `users`
Создатель           | user             | `users`
Источник            | source           | `sources`
Статус              | status           | `company-statuses`
Тип                 | company-type     | `company-types`
Сделки              | deals            | `deals`
