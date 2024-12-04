# README

## About

Live version of the service can be find here: https://find-a-teaching-school-hub.education.gov.uk/

## Test environments
- [Staging](https://staging.find-a-teaching-school-hub.education.gov.uk/)
- [Sandbox](https://sandbox.find-a-teaching-school-hub.education.gov.uk/)
- Review apps: the link is posted in the pull request

## Setup

### Prerequisites

This project depends on:

  - [Ruby](https://www.ruby-lang.org/)
  - [Ruby on Rails](https://rubyonrails.org/)
  - [NodeJS](https://nodejs.org/)
  - [Yarn](https://yarnpkg.com/)
  - [Postgres](https://www.postgresql.org/)

### Updating Hub File

When updating the `db/data/hubs.csv` file, please make sure to run `rails r 'Hub::Importer.new.reload!'` locally first to make sure all changes were applied.

### Updating Authorities File

Geojson file can be find here: https://geoportal.statistics.gov.uk/datasets/f23beaa3769a4488b6a5f0cfb7980f51_0/explore?location=52.427623%2C-1.470139%2C8.26
Due to size of the file, it is split into several files. Individual files should be smaller than 100 MB due to git limitations.
See `lib/tasks/split_authorities_file.rake` for details.

## Testing

### Mocking with VCR for feature specs

Your default test geocoder key should be `ORDNANCE_SURVEY_API_KEY='geocoderkey'`, and its VERY IMPORTANT not to leak
key to the repository. This key is being set in github actions as well.
Every time you re-record VCR cassete, you need to modify the key.

### Linting

To run the linters:

```bash
bin/lint
```
### Intellisense

[solargraph](https://github.com/castwide/solargraph) is bundled as part of the
development dependencies. You need to [set it up for your
editor](https://github.com/castwide/solargraph#using-solargraph), and then run
this command to index your local bundle (re-run if/when we install new
dependencies and you want completion):

```sh
bin/bundle exec yard gems
```

You'll also need to configure your editor's `solargraph` plugin to
`useBundler`:

```diff
+  "solargraph.useBundler": true,
```
