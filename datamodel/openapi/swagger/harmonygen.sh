
pushd ~/go/src/github.com/harmony-one/harmony/docs
swagger generate spec -w ../cmd/harmony/ -o swagger.json
cp swagger.json ~/emasset/datamodel/harmony.json
pushd  ~/emasset/datamodel/
swagger serve harmony.json --port 3201 --host=0.0.0.0 --no-open
popd
popd
