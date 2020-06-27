# Overview

Here we are working through the 

* [grpc-gateway README.md](https://github.com/grpc-ecosystem/grpc-gateway)
* [grpc gateway docs](https://grpc-ecosystem.github.io/grpc-gateway/docs/usage.html).
* [protobuf style guide](https://buf.build/docs/style-guide#files-and-packages)
* [proto annotation examples](https://github.com/grpc-ecosystem/grpc-gateway/blob/master/examples/internal/proto/examplepb/a_bit_of_everything.proto)

## Steps

Protobuf Installation
```
GO111MODULE=auto
go get -u github.com/golang/protobuf
go get github.com/golang/protobuf/proto
go install google.golang.org/protobuf/cmd/protoc-gen-go
```

Make tools package

* Follow [grpc-gateway README.md](https://github.com/grpc-ecosystem/grpc-gateway)

```
mkdir tools
vim tools/tools.go
go mod init
go mod tidy
```

Install gateway swagger and gen-go
```
go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
go install github.com/golang/protobuf/protoc-gen-go
```

Create Proto directory and service definition

* [style guide](https://buf.build/docs/style-guide)

```
mkdir -p proto/echo/echo/v1
vim proto/echo/echo/v1/echo_service.proto
```

Create Third Party Tools

* [protobuf style guide](https://buf.build/docs/style-guide#files-and-packages)

```
mkdir /Users/john/go/src/github.com/grpc-ecosystem
pushd /Users/john/go/src/github.com/grpc-ecosystem
git clone git@github.com:grpc-ecosystem/grpc-gateway.git
popd
cp -Rf /Users/john/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis/google ./proto/.
```

Generate gRPC stub

```
cd proto
mkdir -p gen/go
protoc -I. --go_out=plugins=grpc,paths=source_relative:./gen/go/ echo/echo/v1/echo_service.proto
```

Generate reverse-proxy using `protoc-gen-grpc-gateway`

```
protoc -I. --grpc-gateway_out=logtostderr=true,paths=source_relative:./gen/go echo/echo/v1/echo_service.proto
```

Write an entrypoint for the HTTP reverse-proxy server by editing `main.go`

```
vim main.go
go get -u ./...
go tool compile main.go
```

(Optional) Generate swagger definitions using protoc-gen-swagger

```
mkdir -p ./gen/swagger
protoc -I. --swagger_out=logtostderr=true:./gen/swagger echo/echo/v1/echo_service.proto
```


