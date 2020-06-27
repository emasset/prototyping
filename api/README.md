# Oveview

em∆sset has 3 phases

1. em∆sset.com: Venmo for Stable Coins
  a. KYC Compliance Similar to Plaid
  b. fiat on ramps similar to PrimeTrust
  c. StableCoin Payments similar to TUSD or Stably
2. em∆ssetX: Support for Native Token and other crypto Currencies
3. em∆ssetC: B2C payment support similar to Stripe, Square or Braintree

## Design

Initial Design

* Develop an openapi specification and generate protobuf, grpc definitions and gocode
  * This has been done under rosetta
  * https://medium.com/@lorenzhofmann.w/how-to-build-a-rest-api-with-grpc-and-get-the-best-of-two-worlds-9a4e491f30ae
* Define simple grpc server
  * [protobuf tutorials](https://developers.google.com/protocol-buffers/docs/gotutorial)
  * [protobuf examples](https://github.com/protocolbuffers/protobuf/tree/master/examples)
  * [protobuf language guide](https://developers.google.com/protocol-buffers/docs/proto3)
* Add rest support with grpc-gateway
  * [grpc-gateway docs](https://grpc-ecosystem.github.io/grpc-gateway/docs/usage.html)
* Go beyond the basics: Enhance this with logging
  * https://blog.gopheracademy.com/advent-2017/go-grpc-beyond-basics/
* Add rest support with grpc-gateway 
  * [grpc-gateway docs](https://grpc-ecosystem.github.io/grpc-gateway/docs/usage.html)
  * https://www.openapis.org/blog/2016/05/11/grpc-with-rest-and-openapi-specification
  * https://blog.csnet.me/blog/building-a-go-api-grpc-rest-and-openapi-swagger.1/
  * https://github.com/grpc-ecosystem/grpc-gateway
* Add cloud endpoints
  * https://cloud.google.com/endpoints/docs/grpc/transcoding
* generate openapi definitions and swagger interface
  * `protoc -I. -I%GOPATH%\src -I%GOPATH%\src\github.com\grpc-ecosystem\grpc-gateway\third\_party\googleapis &#8211;swagger\_out=logtostderr=true:. device.proto`
  * statik
  * docusarus

## Installation

Install tools

* [Protocol Buffers - Go Generated Code Installation](https://developers.google.com/protocol-buffers/docs/reference/go-generated)
* [faq](https://developers.google.com/protocol-buffers/docs/reference/go/faq)

```
GO111MODULE=auto
go get -u github.com/golang/protobuf
go get github.com/golang/protobuf/proto
go install google.golang.org/protobuf/cmd/protoc-gen-go

go get -u github.com/googleapis/gnostic
go get -u github.com/googleapis/gnostic-grpc
go get -u github.com/golang/protobuf/protoc-gen-go
go get -u google.golang.org/grpc
```

## Building a new API

### Defining the API

### Generating the Server

### Generating the Protobuf Definitions

### Updating Persistence Layer

### Updating the server logic

### Generating the Clients

### Updating the Asserter

### Updating the CLI

### Updating the build definition


## Reference Documentation

- Introductory articles
    - [openapi rest and grpc article from google](https://cloud.google.com/blog/products/api-management/understanding-grpc-openapi-and-rest-and-when-to-use-them)
    - [OpenAPI and gRPC Side-by-Side](https://medium.com/apis-and-digital-transformation/openapi-and-grpc-side-by-side-b6afb08f75ed)
    - [How to build a REST API with gRPC and get the best of two worlds](https://medium.com/@lorenzhofmann.w/how-to-build-a-rest-api-with-grpc-and-get-the-best-of-two-worlds-9a4e491f30ae)
- [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md)
- Generate OPENAPI from go
    - [goswagger.io documentation](https://goswagger.io/)
        - [Support for Open API spec 3.0 #1122](https://github.com/go-swagger/go-swagger/issues/1122)
    - [Generate Postman Collection from Open API](https://blog.postman.com/converting-openapi-specs-to-postman-collections/)
- Generate grpc from openapi
    - [gnostic go generator](https://github.com/googleapis/gnostic-go-generator)
    - [gnostic - openapi to protobuf](https://github.com/googleapis/gnostic)
- Generate rest endpoints from grpc definitions
    - [grpc-gateway](https://github.com/grpc-ecosystem/grpc-gateway)
    - [article](https://www.openapis.org/blog/2016/05/11/grpc-with-rest-and-openapi-specification), [article 2](https://blog.csnet.me/blog/building-a-go-api-grpc-rest-and-openapi-swagger.1/)
    - We can now invoke protoc with the following arguments to generate our OpenAPI json file:

        ```bash
        protoc -I. -I%GOPATH%\src -I%GOPATH%\src\github.com\grpc-ecosystem\grpc-gateway\third\_party\googleapis &#8211;swagger\_out=logtostderr=true:. device.proto
        ```

    - [grpc beyond the basics](https://blog.gopheracademy.com/advent-2017/go-grpc-beyond-basics/) - [repo](https://github.com/pieterlouw/grpc-beyond)
- Generate Server and client code from openapi
    - [openapi generator](https://github.com/OpenAPITools/openapi-generator)
- Generating Postman Collections
    - [Generate Postman Collection from Open API](https://blog.postman.com/converting-openapi-specs-to-postman-collections/)

### Additional Information

- [Protobuf to JSON mapping](https://developers.google.com/protocol-buffers/docs/proto3#json)
    - [Transcoding](https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/grpc_json_transcoder_filter)
- [protobuf tutorial](https://developers.google.com/protocol-buffers/docs/tutorials)
- [editor.swgger.io](https://editor.swagger.io/)
- [open api tools](https://openapi.tools/)
- [open api specification](http://spec.openapis.org/oas/v3.0.3)
- [swagger-react](https://www.npmjs.com/package/swagger-ui-react)
- [Open API Specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md)
- [Swagger.io user guide](https://swagger.io/docs/specification/about/)
- [Swagger hub editor](https://app.swaggerhub.com/apis/wasdex/peerCount/0-oas3)
- [Swagger Supporting Fragment in Path Object](https://github.com/OAI/OpenAPI-Specification/issues/1635)
- [Swagger Support an operation having multiple specs per path](https://github.com/OAI/OpenAPI-Specification/issues/182)
- [goswagger.io documentation](https://goswagger.io/)
- [goswagger.io github](https://github.com/go-swagger/go-swagger)
- [go-openapi/validate](https://pkg.go.dev/github.com/go-openapi/validate?tab=doc)
- [Create golang documentation with SwaggerUI](https://www.ribice.ba/swagger-golang/)
- [Generation from go source code](https://medium.com/@pedram.esmaeeli/generate-swagger-specification-from-go-source-code-648615f7b9d)
- [Serve Swagger UI within go application](https://medium.com/@ribice/serve-swaggerui-within-your-golang-application-5486748a5ed4)
- [redux-openapi](https://www.npmjs.com/package/@openapi-integration/redux-action-generator-v3)
- [Ethereum GraphQL](https://github.com/graphprotocol)
- [graphql](https://github.com/ethereum/go-ethereum/blob/master/graphql/graphql.go)
- [ethql](https://github.com/ConsenSys/ethql)
- [ethereum-graphql](https://github.com/redacademy/ethereum-graphql)
- [Blockdaemon ubiquity](https://blockdaemon.com/blog/ubiquity-api-a-general-api-for-all-your-protocols/)
- [Blockdaemon ubiquity documentation](https://ubiquity.docs.blockdaemon.com/#tag/Accounts)
- [Covalent](https://www.covalenthq.com/)
- [Covalent API Docs](https://www.covalenthq.com/docs/api/#overview)
- [prot03](https://developers.google.com/protocol-buffers/docs/proto3#simple) [jsonToProto](https://pkg.go.dev/google.golang.org/protobuf/encoding/protojson?tab=doc) [json proto mapping](https://developers.google.com/protocol-buffers/docs/proto3#json_mapping) [uml to protobuf](https://www.opennetworking.org/wp-content/uploads/2018/02/TR-544-v1.0-info.pdf)
- Testing
    - [Open API testing article](https://opensource.com/article/18/6/better-api-testing-openapi-specification)
- [rosettanet api](https://www.rosetta-api.org/docs/welcome.html) - [asserter](https://github.com/coinbase/rosetta-sdk-go/blob/master/asserter/network.go)
- RUST
    - [tonic](https://docs.rs/tonic/0.2.1/tonic/)
    - [tutorial](https://dev.to/anshulgoyal15/a-beginners-guide-to-grpc-with-rust-3c7o)
- [Protobuf Style Guide](https://buf.build/docs/style-guide#files-and-packages)
- [grpc-gateway docs](https://grpc-ecosystem.github.io/grpc-gateway/docs/usage.html)
