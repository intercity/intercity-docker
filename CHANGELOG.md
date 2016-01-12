# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added
- Symlink the Intercity Backup directory (See https://github.com/intercity/intercity-next/pull/42)
- FROM_EMAIL env var, used for all the emails send out by IC.

### Changed
- Log sidekiq output to $app/log/sidekiq.log

### Fixed
- Bumped the Docker image version in the launcher

## [0.2.0] = 2016-01-04

### Changed

- Updated to ruby 2.3

## [0.1.0] - 2015-12-19

- Initial release

[Unreleased]: https://github.com/intercity/intercity-docker/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/intercity/intercity-docker/compare/v0.1.0-beta...v0.2.0
