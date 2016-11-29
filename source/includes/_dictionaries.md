# Справочники
{: #dictionaries }

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

<aside class="notice">
Вместо <code>json_api_type</code> используйте название необходимого справочника из таблицы
<a href="#dictionaries">выше</a>.
</aside>

## Свои поля
{: #custom-fields}

### Аттрибуты

~~~json
{
  "data": {
    "id": "1",
    "type": "custom-fields",
    "links": {
      "self": "http://localhost:3000/api/v1/custom-fields/1"
    },
    "attributes": {
      "created-at": "2016-01-14T17:18:25.675+03:00",
      "updated-at": "2016-07-15T07:29:05.581+03:00",
      "name": "Порода коровы",
      "required": false,
      "resource-name": "deals",
      "field-type": "text",
      "attribute-name": "custom-1"
    }
  }
}
~~~

Имя            | Тип         | Пример          | Запись | Описание
-------------- | ----------- | --------------- | ------ | --------
name           | `string`    | День рождения   | да     | Название
required       | `boolean`   | true            | да     | Обязательное поле
resource-name  | `string`    | `deals`         | да     | Расширяемый ресурс
field-type     | `string`    | `text`          | да     | Тип поля
attribute-name | `string`    | `custom-2`      | нет    | Имя аттрибута для JSON API

### Ограничения по значениям

Аттрибут       | Варианты
-------------- | ---------
resource-name  | `contacts`, `companies`, `deals`, `orders`, `products`, `users`
field-type     | `text`, `date`, `number`, `select`

### Фильтры

> Получить список своих полей для сделок

~~~shell
curl "https://app.salesap.ru/api/v1/custom-fields" \
  -d "filter[resources]=deals" \
  -H "Authorization: Bearer api_token"
~~~

Фильтр         | Описание                                      | Пример
-------------- | --------------------------------------------- | --------------------------
resources      | Вывести поля по определенному `resource-name` | `filter[resources]=deals`