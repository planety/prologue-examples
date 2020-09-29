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

## HTTP server
- default settings: [http_server](http_server)
- custom settings: [http_server_custom_settings](http_server_custom_settings)
- .env settings: [http_server_dotenv](http_server_dotenv)
- static dir: [http_static_server](http_static_server)

## Requests
- route basic example: [route_basic](route_basic)
- anonymous handlers: [anon_handler](anon_handler)
- request methods: [request](request)
- URL parameters: [url_param](url_param)
- URL queries: [url_query](url_query)
- URL with Regex: [regex_url](regex_url)
- routes with DSL: [dsl_routes](dsl_routes)
- group routes: [group_routes](group_routes)

## Responses
- response basic example: [response](response)
- setting headers: [headers](headers)
- templating with Karax DSL: [template](template)

## Middleware
- middleware basic example: [middleware_basic](middleware_basic)
- before and after context switch: [middleware_before_after](middleware_before_after)
- CSRF: [csrf](csrf)
- CORS: [cors](cors)
- session with signed cookie: [signed_cookie_session](signed_cookie_session)

## Cookies
- cookies basic example: [cookies_basic](cookies_basic)

## Sample Apps
- Hello world: [helloworld](helloworld)
- Blog app: [blog](blog)