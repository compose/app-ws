# Application Developer Work Sample

Work sample to be completed to apply for the application developer position at Compose.

**Note: this app is purposely broken, you'll have to "repair" it using idiomatic Rails ways.**

## Context

At Compose, we have multiple apps being served on the app.compose.io domain. These apps all use the same basic CSS and JavaScript through a UI framework we built called Megatron.

The app in this repository is a Rails app which only serves a few routes. That's similar to our reality at Compose, where apps are specialized.

To test your abilities, we've created a **very** incomplete app which has the responsibility of exposing a UI to our users for browsing their PostgreSQL deployment.

We use appropriately-sized services to expose our data to our various apps. To simulate this condition, we created a small service (hosted at: https://front-end-ws-api.herokuapp.com/) which provides basic account details and deployment information. All of this is fake and modeled to work with this app.

## Setup

#### Required software

- Ruby (ideally >= 2.1)
- Bundler
- PostreSQL (`postgres` and `initdb` should be available in your `PATH`)

#### Environment variables

We use "rbenv-vars" (a rbenv plugin) in development to apply environment variables present in the [`.rbenv-vars`](.rbenv-vars) file. You may want to `EXPORT` those manually if you don't use "rbenv-vars"

#### Initializing a database

Use PostgreSQL's `initdb` executable to initialize a database in a directory (within this app's `cwd`) like so:

```
initdb -D pg_data
```

#### Starting up

Using foreman (or forego), you can start both the `postgres` process and the `rails server` process.

```
foreman start
```

#### Seeding the data

Make sure you've started your PostgreSQL instance by running the aforementioned `foreman` command. Then:

```
make seed
```

#### Accessing stuff

I'm sure you can figure that out from the `Procfile` / server logs.

## About this app's structure and tooling

#### `gem 'megatron'`

This is our own UI kit / framework for consistent styles across all our apps. The source is here: [compose-ui/megatron.rb](/compose-ui/megatron.rb)

#### `class Deployment`

... is our main model from which other deployment types are inheriting (like `PostgreSQL::Deployment`.) It handles creating basic client connections, it knows about the connection details, etc.

## What's expected of you

As a general rule, you should use idiomatic Rails to solve these problems. This **could** mean reorganizing things, adding routes, controllers, models as you feel is necessary.

#### Fix: Some pages are raising exceptions

While navigating, you might encounter 500s, fix them too.

#### Test: Specs need to pass

We've added a few failing specs in the app, please fix them and make them green.

#### Feature: `DESCRIBE`-like for PostgreSQL tables

Clicking on a table's name should bring up a page with all columns and their data types for the selected table. This should actually query the PostgreSQL deployment for the information, no fake data.

In addition to creating the actual feature. It should be tested.