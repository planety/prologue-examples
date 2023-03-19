# Hello World example
Compile Release:
`nim c -r --d:release --threads:on example.nim` 

Benchmark with `wrk`:
`curl http://localhost:8080/hello && echo "\n" && ./wrk -t15 -c250 -d5s http://localhost:8080/hello`
