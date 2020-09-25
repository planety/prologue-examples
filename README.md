# prologue-examples
A repository to host examples for Prologue framework.

⚠️ These examples are under development and may change in the future.

## Prerequisites
- Installed [Nim](https://nim-lang.org/) compiler (v1.26 or above)
- Installed [Prologue](https://github.com/planety/prologue)

You can install Prologue via Nimble: `nimble install prologue`

## Compile and run examples
Simply call `nim compile --run example.nim` inside of particular example directory and access 127.0.0.1:8080 URL in your browser.
Some examples might have different port number for sake of demostration.

## App
- Start app with default settings: [example](app_examples/app_default_settings)
- Start app with custom settings: [example](app_examples/app_custom_settings)
- Start app with .env settings: [example](app_examples/app_env_settings)
- Start app with static dir: [example](app_examples/app_static_dir)

## Routes
- Simple routes example
- Routes with 'anonymous' handlers
- Requests methods (GET, POST, PUT, DELETE)
- Passing and reading URL parameters
- Passing and reading query parameters
- Regex in URL
- Create routes with Domaing Specific Language
- Grouping(nesting?) routes

## Responses
- Response types
- Response headers
- HTML Response using Karax DSL

## Middlewares
- Attach middleware to app level (globaly)
- Attach middleware to route level (localy)
- Multiple middlewares
- Built-in: CSRF examples
- Built-in: CORS examples
- Built-in: sessions examples

## Cookies
- Simple cookie example

## Sample Apps
- Hello world
- Blog app