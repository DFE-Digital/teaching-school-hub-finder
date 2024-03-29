# README

## About

Live version of the service can be find here: https://find-a-teaching-school-hub.education.gov.uk/

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
