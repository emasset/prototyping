# Get gnostic and the plugins
# go get -u github.com/googleapis/gnostic
# go get -u github.com/googleapis/gnostic-grpc
# go get -u github.com/googleapis/gnostic-go-generator
# ipushd /Users/john/dev/ref/coinbase/rosetta-specifications
gnostic rosetta.yaml --pb-out=.
gnostic rosetta.yaml --text-out=.
gnostic rosetta.yaml --grpc-out=.
gnostic rosetta.yaml --go-generator-out=rosetta
# popd
