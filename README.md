# WinterCMS 
## Demise of October CMS
As you may have heard; over the past month October CMS has been `undergoing some dramatic changes` in terms of project structure and the codebase that you rely upon for your projects. In addition to the `removal of all of the core maintainers` and the transition to a paid product / licensing scheme; a number of breaking changes have already been made to the codebase.
### Rebirth as Winter CMS

As a result of these dramatic structural changes of the project that we rely upon to run our businesses, former October CMS maintainers `Luke Towers`, `Ben Thomson` and `Marc Jauvin` wish to announce the formation of the `Winter CMS` project, a community-driven fork of `October CMS` with a dedication to speed, security, stability, and simplicity. Along with `Jack Wilkinson`, we aim to continue to deliver a professional and feature-rich platform that you can rely upon for your websites and applications; as well as engage with the community and become a more community-driven project overall.

Winter CMS is a fork of October CMS as of v1.1.2 / v1.0.472, any of your October projects can be `seamlessly migrated to use Winter` instead as long as they are using a version of October prior to the dramatic changes recently introduced by the original founders.

For more information on the exact events that led to the decision to fork,

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