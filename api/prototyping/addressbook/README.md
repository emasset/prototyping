# Overview

* Define simple grpc server
  * [protobuf tutorials](https://developers.google.com/protocol-buffers/docs/gotutorial)
  * [protobuf examples](https://github.com/protocolbuffers/protobuf/tree/master/examples)
  * [protobuf language guide](https://developers.google.com/protocol-buffers/docs/proto3)
  * [protobuf go reference guide](https://developers.google.com/protocol-buffers/docs/reference/go-generated)
  * [protobuf go faq](https://developers.google.com/protocol-buffers/docs/reference/go/faq)

## Steps

Initial setup (one time only)
```
GO111MODULE=auto
go get -u github.com/golang/protobuf
go get github.com/golang/protobuf/proto
go install google.golang.org/protobuf/cmd/protoc-gen-go
```
Create the directorues where we will generate the clients
```
mkdir -p addressbookpb
```
Compile the address book
```
protoc --go_out=./addressbookpb  addressbook.proto --go_opt=paths=source_relative
```
Copy the server programs and Makefile

* add_person.go
* list_people.go
* Makefile

Build the program
```
make go
make gotest
```
