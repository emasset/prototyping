# Overview
UML modelling will be used in conjunction with openapi and proto files for data modelling. It's focus will initiall by on deployment and sequence diagrams.

### Generating a svg file
Check [plantuml](https://plantuml.com/] [deployment](https://plantuml.com/deployment-diagram) and [sequence]https://plantuml.com/sequence-diagram] diagram examples.

Installing building and browsing the diagrams

* iInstallation: Follow the instructions below
* Build using: `plantuml emasset.puml -tsvg`
* Open chrome: `open -a "Google Chrome" emasset.svg`

### Installation on Mac
**Note:** this has a dependency on a java runtime environment
```
brew install plantumli
plantuml ab.puml
```

generate uml diagram from openapi yaml
```
openapi-transformer  emasset.yaml --plantuml emasset.puml
plantuml emasset.puml -tsvg
```

### Reference links

* Docusarus - https://github.com/webgears/remarkable-plantuml
* https://plantuml.com/
* https://github.com/nlohmann/swagger_to_uml
* https://www.lucidchart.com/pages/examples/uml_diagram_tool
* https://github.com/MetaMask/metamask-snaps-beta/wiki/Sequence-Diagrams
* https://github.com/webgears/remarkable-plantuml

* [openapi-transformer](https://www.npmjs.com/package/openapi-transformer)

