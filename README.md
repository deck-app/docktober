# OctoberCMS Boilerplate
*by Octobro*

---

[OctoberCMS](http://octobercms.com) is a powerful CMS based on [Laravel PHP Framework](http://laravel.com).

## Prerequisites

1. PHP > 7.1
1. MySQL or MariaDB
1. [Composer](http://getcomposer.org)
1. [Yarn](https://yarnpkg.com)

## Getting Started

1. Clone to your base project directory.

	```
	git clone https://github.com/deck-app/docktober.git
	```

2. Run.

    ```
	cd docktober & docker-compose up -d
	```

### Note:- IF css and js error in https, please below the change

```
edit nano /var/www/html/config/cms.php
line number 240
```
```
'linkPolicy' => getenv('OCTOBER_CMS_LINK_POLICY') ?: 'detect',
```
## TO
```
'linkPolicy' => getenv('OCTOBER_CMS_LINK_POLICY') ?: 'secure',
```