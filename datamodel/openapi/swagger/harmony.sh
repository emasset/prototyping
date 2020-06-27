pushd ~/emasset/datamodel/swagger
cp  ../harmony.yml .
python3 -m http.server 3200
popd
