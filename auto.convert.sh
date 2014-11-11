#!/bin/bash

[ ! -f .adoc.ts ] && touch .adoc.ts
while true
do
    for f in `find src -type f -name '*.adoc' -newer .adoc.ts`
    do
	echo "Regenerating $f"
	asciidoctor -b html5 \
	    --destination-dir=target/site/ $f && touch .adoc.ts    
    done
    sleep 0.2
done
