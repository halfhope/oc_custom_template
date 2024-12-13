# OpenCart Персонализованные шаблоны
[![License: GPLv3](https://img.shields.io/badge/license-GPL%20V3-green?style=plastic)](LICENSE)

Расширение позволяет выбирать свой tpl / twig шаблон для выбранных товаров / категорий / производителей / товаров выбранной категории / товаров определенного производителя / информационной страницы и т.д. 

Например, расширение может подменить шаблон product/product.twig на product/product_showcase.twig для товаров производителя Apple.

## Другие языки

* [English](README.md)

## Лог изменений

* [CHANGELOG_RU.md](docs/CHANGELOG_RU.md)

## Скриншоты

* [SCREENSHOTS.md](docs/SCREENSHOTS.md)

## Возможности

Доступна подмена шаблонов для:

* Товара
* Категории
* Производителя
* Информационной страницы
* Товаров в выбранной категории
* Товаров выбранного производителя
* Схемы *
* Можно назначить тот или иной шаблон для вышеуказанных страниц в зависимости от группы пользователя, языка, магазина

* Работает в разделах товаров, категорий, производителей, информационных страниц.

Чтобы добавить поддержку шаблонов для схем в другие нестандартные разделы, посмотрите vqmod / ocmod файл, сделайте по аналогии с checkout/cart (дублируйте и исправьте пути, выберите схему страницы). Если будут трудности, обращайтесь.

## Совместимость

* OpenCart 1.5, 2.x, 3.x версий.

## Зависимости

* Для версий 1.5.x необходим vqmod.
* Для версий 2.x, 3.x необходим ocmod.

## Демо

Админка

* [https://custom-template.shtt.blog/admin/](https://custom-template.shtt.blog/admin/)﻿ (авто вход)

Каталог

* [https://custom-template.shtt.blog/component/monitor/apple_cinema_30](https://custom-template.shtt.blog/component/monitor/apple_cinema_30)
* [https://custom-template.shtt.blog/camera/canon-eos-5d](https://custom-template.shtt.blog/camera/canon-eos-5d)
* [https://custom-template.shtt.blog/laptop-notebook/windows](https://custom-template.shtt.blog/laptop-notebook/windows)
* [https://custom-template.shtt.blog/privacy](https://custom-template.shtt.blog/privacy)
* [https://custom-template.shtt.blog/apple](https://custom-template.shtt.blog/apple)
* [https://custom-template.shtt.blog/desktops/mac/imac](https://custom-template.shtt.blog/desktops/mac/imac)

На демо сайте есть верхнее меню для быстрой навигации.

## Установка

* Установите модуль через стандартный раздел установки дополнений.
* В разделе модулей установите "Персонализованные шаблоны".

## Руководство

#### Модификаторы

Будьте внимательны к модификаторам. Использование модификаторов влияет на содержимое подменяемых tpl / twig файлов. Если вы хотите, чтобы новые файлы были аналогичны подменяемым, необходимо добавить поддержку новых файлов в модификаторы.

Например, мы хотим подменить файл product.twig на product_showcase.twig. Для этого нужно найти все модификаторы, которые вносят изменения в файл product.twig и добавить в них поддержку product_showcase.twig.

Список модификаторов, которые изменяют тот или иной файл и внести нужные изменения можно посмотреть с помощью моего скрипта "Modification editor".

## Лицензия

* [GPL v3.0](LICENSE.MD)

## Спасибо за использование моих дополнений!

Я решил сделать все свои OpenCart-дополнения бесплатными и с открытым исходным кодом, чтобы они могли приносить пользу сообществу. Разработка, поддержка и обновление этих дополнений требуют времени и усилий.

Если мои дополнения помогли вам в вашем проекте, и вы хотите поддержать мою работу, я буду благодарен за любую сумму пожертвований.

### 💙 Поддержать меня можно через:

* [PayPal](https://paypal.me/TalgatShashakhmetov?country.x=US&locale.x=en_US)
* [CashApp](https://cash.app/$TalgatShashakhmetov)

Ваше участие мотивирует меня продолжать развивать и улучшать эти инструменты. Спасибо за вашу поддержку!
