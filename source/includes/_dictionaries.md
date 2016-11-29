# Справочники
{: #dictionaries }

> Получить список своих полей для сделок

~~~shell
curl "https://app.salesap.ru/api/v1/custom-fields" \
  -d "filter[resources]=deals" \
  -H "Authorization: Bearer api_token"
~~~

> Получить список этапов сделок

~~~shell
curl "https://app.salesap.ru/api/v1/deal-stages" -H "Authorization: Bearer api_token"
~~~

> Добавить новый источник

~~~shell
curl "https://app.salesap.ru/api/v1/sources" \
 -X POST \
 -H "Content-Type: application/vnd.api+json" \
 -H "Authorization: Bearer api_token" \
 -d @- << EOF
    {
      "data":{
        "type":"sources",
        "attributes":{
          "name":"Новый источник"
        }
      }
    }
EOF
~~~

Справочник                   | JSON API type
---------------------------- | ------------------
Источники                    | `sources`
Территории                   | `areas`
Свои поля                    | `custom-fields`
Продукты                     | `products`
Конкуренты                   | `competitors`
Типы активностей             | `activity-types`
Статусы компаний             | `company-statuses`
Типы компаний                | `company-types`
Воронки сделок               | `deal-stage-categories`
Этапы сделок                 | `deal-stages`
Статусы сделок               | `deal-statuses`
Причины поражения сделок     | `deal-loss-reasons`
Этапы заявок                 | `order-stages`
Статусы заявок               | `order-statuses`
Причины поражения заявок     | `order-loss-reasons`

Запросы к справочникам имеют следующий формат:
 
----------------- | ------------------
URL               | `/api/v1/{json_api_type}`
Список            | `GET /api/v1/{json_api_type}`
Чтение            | `GET /api/v1/{json_api_type}/{id}`
Создание          | `POST /api/v1/{json_api_type}`
Редактирование    | `PATCH /api/v1/{json_api_type}/{id}`
Удаление          | `DELETE /api/v1/{json_api_type}/{id}`

<aside class="notify">
Вместо <code>json_api_type</code> используйте название необходимого справочника из таблицы
<a href="#dictionaries">выше</a>.
</aside>