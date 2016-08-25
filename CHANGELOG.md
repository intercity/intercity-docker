# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.4.1] - Unreleased
* Fix typo in letsencrypt email template

## [0.4.0] - 2016-08-27
* Add support for running Intercity behind HTTPS (jvanbaarsen)
* Add support for Letsencrypt based HTTPS (jvanbaarsen)
* Removed the FROM_EMAIL env var, since this is now configured in the IC interface (jvanbaarsen)
* Removed the SMTP env vars, they are moved to the IC interface (jvanbaarsen)

## [0.3.0] - 2016-05-27
* Symlink the Intercity Backup directory (See https://github.com/intercity/intercity-next/pull/42)
* FROM_EMAIL env var, used for all the emails send out by IC.
* Added SMTP configuration options
* Log sidekiq output to $app/log/sidekiq.log
* Sidekiq config has been moved to the intercity/intercity-next repo. (see https://github.com/intercity/intercity-next/pull/63)
* Bumped the Docker image version in the launcher
* Add proper licensing (jvanbaarsen)
* Remove SECRET_KEY_BASE since it has been moved to intercity-next repo (jvanbaarsen)

## [0.2.0] - 2016-01-04
* Updated to ruby 2.3

## [0.1.0] - 2015-12-19
* Initial release

