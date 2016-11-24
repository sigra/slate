---
title: API Документация

language_tabs:
  - shell

toc_footers:
  - <a href='https://app.salesap.ru'>Получить доступ к API</a>

search: true
---

# Введение
{: #intro}

<aside class="warning">
В данный момент API находится в разработке. Это значит, что формат запросов и 
ответов может меняться!
</aside>

Спасибо за выбор Salesapiens API. Данный API позволяет работать со всеми
основными объектами и настройками Salesapiens, благодаря чему вы можете быстро
создавать свои собственные приложения.

## Получение API токена
{: #get_token}

Для корректной работы всех последующих примеров вам потребуется ключ для
доступа к Salesapiens API. Чтобы получить данный ключ перейдите в раздел
Настройки / [Настройки API](https://app.salesap.ru/settings/api_keys) из
своего аккаунта.

## Спецификация
{: #specification}

Форматы запросов и ответов к API соответствуют спецификации 
[JSON API v1.0](http://jsonapi.org/format/1.0).

# Авторизация
{: #auth}

> Чтобы авторизоваться используйте следующий код:

~~~ shell
curl "https://salesap.ru/api/v1/deals.json"
  -H "Authorization: Bearer api_token"
~~~ 

> Используйте полученный в настройках API токен вместо `api_token`.

Каждый запрос к API требует авторизации. Для авторизации необходим специальный 
уникальный [токен](#get_token). 

Токен авторизации необходимо передавать в заголовке `Authorization` каждого запроса. Пример:

`Authorization: Bearer access_api_token`

<aside class="notice">
Вместо <code>access_api_token</code> вставьте ваш API токен.
</aside>


