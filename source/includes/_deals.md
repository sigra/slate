# Сделки
{: #deals}

> Создание сделки с предустановленным источником

~~~ shell
curl "https://app.salesap.ru/api/v1/deals" \
  -X POST \
  -H "Content-Type: application/vnd.api+json" \
  -H "Authorization: Bearer api_token" \
  -d @- << EOF
     {
       "data":{
         "type":"deals",
         "attributes":{
           "name":"Сделка из API",
           "planned-at":"2016-12-31"
         },
         "relationships":{
           "source":{
             "data":{
               "type":"sources",
               "id":1
             }
           }
         }
       }
     }
EOF
~~~ 

----------------- | ------------------
JSON API type     | `deals`
URL               | `/api/v1/deals`
Список            | `GET /api/v1/deals`
Чтение            | `GET /api/v1/deals/{id}`
Создание          | `POST /api/v1/deals`
Редактирование    | `PATCH /api/v1/deals/{id}`
Удаление          | `DELETE /api/v1/deals/{id}`

## Аттрибуты
{: #deals-attributes}

~~~ shell
{ "data": {
      "type":"deals",
      "id":1,
      "attributes":{
        "name":"Квартира на Ленинском",
        "description":"двушка в 15м доме",
        "amount":4700000.0,
        "number":16,
        "planned-at":nil,
        "finished-at":"2016-11-26",
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

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
name           | `string`    | Моя сделка      | да     | Имя сделки
description    | `string`    | Описание сделки | да     | Подробное описание сделки
amount         | `decimal`   | 123.0           | да     | Сумма сделки
number         | `integer`   | 16              | да     | Номер сделки
planned-at     | `date`      | `2016-01-29`    | да     | Планируемая дата закрытия
finished-at    | `date`      | `2016-01-30`    | да     | Фактическая дата закрытия
customs        | `hash`      | `{"custom-1":'custom value'}`| да     | Свои поля
created-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата создания
updated-at     | `datetime`  | `2016-11-26T12:07:51.572+03:00` | нет | Дата обновления
archived-at    | `datetime`  | `2016-11-26T12:07:51.572+03:00` | да | Дата архивации

## Связи
{: #deals-relationships}

> Пример данных (перечислены не все связи)

~~~ shell
{ "data": {
      "type":"deals",
      "id":1,
      "relationships":{
        "responsible":{
          "links":{
            "self":"/api/v1/deals/1/relationships/responsible",
            "related":"/api/v1/deals/135/responsible"
          }
        },
        "stage-category":{
          "links":{
            "self":"/api/v1/deals/1/relationships/stage-category",
            "related":"/api/v1/deals/135/stage-category"
          }
        },
      }
   }
}
~~~

> Пример запроса с загруженными источниками и отвественными

~~~ shell
curl "https://app.salesap.ru/api/v1/deals?include=source,responsible" \
  -H "Authorization: Bearer api_token"
~~~ 

Каждая связь может быть включена в JSON ответ через параметр `include`, согласно
официальной спецификации [JSON API Inclusion of Related Resources](http://jsonapi.org/format/1.0/#fetching-includes).

Название            | Связь            | JSON API type
------------------- | ---------------- | --------------
Ответственный       | responsible      | `users`
Создатель           | user             | `users`
Компания            | company          | `companies`
Контакт             | contact          | `contacts`
Этап                | stage            | `stages` 
Воронка             | stage-category   | `stage-categories`
Источник            | source           | `sources`
Статус              | status           | `status`
Причина поражения   | loss-reason      | `loss-reasons`
Конкурент поражения | loss-competitor  | `loss-competirors`
Территория          | area             | `area`
