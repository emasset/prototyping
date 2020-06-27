# emasset

# Sample Aliases
#alias cde='cd ~/emasset/; pwd'
#alias cdu='cd ~/emasset/uml; pwd'
#alias pe='pushd ~/emasset/uml/; plantuml emasset.puml -tsvg; popd'
#alias pec='pushd ~/emasset/uml/; plantuml emasset.puml -tsvg; open -a "Google Chrome" emasset.svg; popd'

# Build emasset.puml as an svg and open chrome
pushd ~/emasset/uml/
plantuml emasset.puml -tsvg
open -a "Google Chrome" emasset.svg
popd
