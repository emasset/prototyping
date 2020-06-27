

Tutorial

* https://www.openapis.org/blog/2016/05/11/grpc-with-rest-and-openapi-specification

Running the example

```
go get -u github.com/philips/grpc-gateway-example
grpc-gateway-example serve
```


Generating the client

https://developers.google.com/protocol-buffers/docs/proto3#generating

```
go get -u github.com/googleapis/googleapis
go get ./...
mkdir clients
cd clients
mkdir cpp java python go ruby objc csharp php javascript
protoc --cpp_out=./clients/cpp --java_out=./clients/java --python_out=./clients/python --go_out=./clients/go --ruby_out=./clients/ruby --objc_out=./clients/objc --csharp_out=./clients/csharp --php_out=./clients/php --js_out=./clients/javascript  service.proto
```

 - RUST
    - [tonic](https://docs.rs/tonic/0.2.1/tonic/)
    - [tutorial](https://dev.to/anshulgoyal15/a-beginners-guide-to-grpc-with-rust-3c7o)
