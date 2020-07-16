# go-grpc-mongodb

## Overview

Working through the example mongodb grpc crud API [tutorial](https://itnext.io/learning-go-mongodb-crud-with-grpc-98e425aeaae6)

## Installation

#### Installing protoc

* [protobuf compiler](https://github.com/protocolbuffers/protobuf)
  * [protobuf releases](https://github.com/protocolbuffers/protobuf/releases)
  * [protoc-3.12.3-osx-x86_64.zip](https://github.com/protocolbuffers/protobuf/releases/download/v3.12.3/protoc-3.12.3-osx-x86_64.zip) 

Download and unzip the zip file 
```
cp ~/Downloads/protoc-3.12.3-osx-x86_64/bin/protoc /usr/local/bin/.
sudo cp ~/Downloads/protoc-3.12.3-osx-x86_64/bin/protoc /usr/local/bin/.
which protoc
```

Install `protoc-gen-go old version with gRPC support

```
go get github.com/golang/protobuf/protoc-gen-go
```

Generate your proto files

```
protoc proto/blog.proto --go_out=plugins=grpc:. --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative
```

#### Compiling your proto files
* Reference [grpc quickstart](https://grpc.io/docs/languages/go/quickstart/)

```
protoc proto/blog.proto --go_out=plugins=grpc:. --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative
```

#### Installing [mongodb](https://github.com/mongodb/mongo)

Follow the [building guide](https://github.com/mongodb/mongo/blob/master/docs/building.md)

Also configuration options are [here](https://docs.mongodb.com/manual/reference/configuration-options/)

Then do a [MongoDB Compass Install](https://docs.mongodb.com/compass/master/install/)

```
git clone git@github.com:mongodb/mongo.git
cd mongo
python3 -m pip install -r etc/pip/compile-requirements.txt
python3 buildscripts/scons.py install-core
ll build/install/bin/
cp -rf /Users/john/go/src/github.com/mongodb/mongo/build/install/bin/mongo* /usr/local/bin/.
sudo mkdir -p /usr/local/var/mongodb
sudo chmod a+w /usr/local/var/mongodb
sudo mkdir -p /usr/local/var/log/mongodb
sudo chmod a+w /usr/local/var/log/mongodb
vim /usr/local/etc/mongod.conf
mongod --config /usr/local/etc/mongod.conf
ps aux | grep -v grep | grep mongod
mongo
```

If you want to build everything
```
python3 buildscripts/scons.py install-all-meta
```

Download and install [compass](https://docs.mongodb.com/compass/master/install/)

Or follow the [MONGODB MANUAL: Install on macOS](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/)


#### Installing [MongoDB Go Driver](https://github.com/mongodb/mongo-go-driver) 

```
go get go.mongodb.org/mongo-driver/mongo
```

## Development


## Running


### Reference Material

* [Tutorial](https://itnext.io/learning-go-mongodb-crud-with-grpc-98e425aeaae6)
* [Repository](https://github.com/kyriediculous/go-grpc-mongodb)
* [protobuf compiler](https://github.com/protocolbuffers/protobuf)
  * [protobuf releases](https://github.com/protocolbuffers/protobuf/releases)
  * [protoc-3.12.3-osx-x86_64.zip](https://github.com/protocolbuffers/protobuf/releases/download/v3.12.3/protoc-3.12.3-osx-x86_64.zip)
* [Go support for protocol buffers](https://github.com/protocolbuffers/protobuf-go)
* [mongodb github](https://github.com/mongodb/mongo)
* [Building MongoDB]([building guide](https://github.com/mongodb/mongo/blob/master/docs/building.md)
* [MONGODB MANUAL: Install on macOS](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/)
* [MongoDB Compass Install](https://docs.mongodb.com/compass/master/install/)
* [MongoDB tools github](https://github.com/mongodb/mongo-tools)
* [MongoDB Go Driver](https://github.com/mongodb/mongo-go-driver)
* [mongodb github](https://github.com/mongodb/mongo)
* [Mongodb.com cloud hosting](https://www.mongodb.com/)
* [MongoDB Compass](https://docs.mongodb.com/compass/master/)
* [Robo 3t Mongodb Studio](https://robomongo.org/download)


