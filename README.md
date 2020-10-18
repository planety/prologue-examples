# Prologue framework examples repository
A repository to host examples for [Prologue](https://github.com/planety/prologue) framework.

⚠️ These examples are under development and may change in the future.

## Prerequisites
- Installed [Nim](https://nim-lang.org/) compiler (v1.4.0 or above)
- Installed [Prologue](https://github.com/planety/prologue) framework (v.0.4.0 or above)

You can install Prologue via Nimble: `nimble install prologue` (or `nimble install `nimble install prologue@#head` if you want to get the latest version).

## Compile and run examples
Simply call `nim compile --run example.nim` inside of particular example directory and access 127.0.0.1:8080 URL in your browser.
Some examples might have different port number for sake of demostration.

## HTTP server
- default settings: [http_server](http_server)
- custom settings: [http_server_custom_settings](http_server_custom_settings)
- .env settings: [http_server_dotenv](http_server_dotenv)
- basic conf: [basic_conf](basic_conf)
- static dir: [http_static_server](http_static_server)
- django-like structure: [basic](basic)
- websocket: [websocket](websocket)

## Requests
- route basic example: [route_basic](route_basic)
- basic structures: [basic_structure](basic_structure)
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
- templating with Karax DSL: [karax_template](karax_template)
- templating with nimWebTemplates (NWT): [nwt_template](nwt_template)

## Middleware
- middleware basic example: [middleware_basic](middleware_basic)
- before and after context switch: [middleware_before_after](middleware_before_after)
- CSRF: [csrf](csrf)
- CORS: [cors](cors)
- session with signed cookie: [signed_cookie_session](signed_cookie_session)
- memory session: [memory_session](memory_session)
- redis session: [redis_session](redis_session)
- basic auth: [basic_auth](basic_auth)

## Cookies
- basic cookies example: [basic_cookies](basic_cookies)

## Database
- Basic CRUD example with sqlite: [basic_crud](basic_crud)

## Sample Apps
- Hello world: [helloworld](helloworld)
- Blog app: [blog](blog)
- ToDo app: [todoapp](todoapp)

## TODO
- `cors` example is not finished
- `basic_crud` has TODOs
