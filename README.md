# OpenCart Custom template
[![License: GPLv3](https://img.shields.io/badge/license-GPL%20V3-green?style=plastic)](LICENSE)

The extension allows you to choose your own tpl / twig template for selected products / categories / manufacturers / products of a selected category / products of a certain manufacturer / information page, etc.

## Other Languages

* [Russian](README_RU.md)

## Change Log

* [CHANGELOG.md](docs/CHANGELOG.md)

## Screenshots

* [SCREENSHOTS.md](docs/SCREENSHOTS.md)

## Features

Template replacement is available for:

* products;
* categories;
* manufacturer;
* information page;
* products in the selected category;
* products of the selected manufacturer;
* layout *;
* you can assign one or another template for the above pages depending on the user group, language, store;

* Works in sections of products, categories, manufacturers, information pages.

To add template support for layout to other non-standard sections, look at the vqmod / ocmod file, do the same as checkout/cart (duplicate and fix paths, select page layout). If there are difficulties, please contact me.

## Compatibility

* OpenCart 1.5, 2.x, 3.x versions.

## Dependencies

* Versions 1.5.x require vqmod.
* Versions 2.x, 3.x require ocmod.

## Demo

Admin

* [https://custom-template.shtt.blog/admin/](https://custom-template.shtt.blog/admin/)﻿ (auto login)

Catalog

* [https://custom-template.shtt.blog/component/monitor/apple_cinema_30](https://custom-template.shtt.blog/component/monitor/apple_cinema_30)
* [https://custom-template.shtt.blog/camera/canon-eos-5d](https://custom-template.shtt.blog/camera/canon-eos-5d)
* [https://custom-template.shtt.blog/laptop-notebook/windows](https://custom-template.shtt.blog/laptop-notebook/windows)
* [https://custom-template.shtt.blog/privacy](https://custom-template.shtt.blog/privacy)
* [https://custom-template.shtt.blog/apple](https://custom-template.shtt.blog/apple)
* [https://custom-template.shtt.blog/desktops/mac/imac](https://custom-template.shtt.blog/desktops/mac/imac)

The demo site has a top menu for quick navigation.

## Installation

* Install the module through the standard extension installation section.
* In the modules section, go to "Custom Templates" module.

## Management

#### Modifiers

Be careful with modifiers. The use of modifiers affects the content of the replaced tpl / twig files. If you want the new files to be similar to the ones you replace, you need to add support for the new files to the modifiers.

For example, we want to replace the product.twig file with product_showcase.twig. To do this, you need to find all the modifiers that make changes to the product.twig file and add product_showcase.twig support to them.

The list of modifiers that change a particular file and make the necessary changes can be viewed using my "Modification editor" script.

## License

* [GPL v3.0](LICENSE.MD)

## Thank You for Using My Extensions!

I have decided to make all my OpenCart extensions free and open-source to benefit the community. Developing, maintaining, and updating these extensions takes time and effort.

If my extensions have been helpful for your project and you’d like to support my work, any donation is greatly appreciated.

### 💙 You can support me via:

* [PayPal](https://paypal.me/TalgatShashakhmetov?country.x=US&locale.x=en_US)
* [CashApp](https://cash.app/$TalgatShashakhmetov)

Your support inspires me to keep improving and developing these tools. Thank you!
