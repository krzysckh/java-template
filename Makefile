package=org.krzysckh.none

LIBS:=`find ./lib -type f -name '*.jar' -exec printf "%s:" '{}' ';'`

.PHONY: run init build jar

run: build
	java -classpath ${LIBS}bin/ ${package}.Main
init:
	mkdir -p src/`echo ${package} | tr '.' '/'` bin/ lib/
build:
	javac -d bin/ -sourcepath src/ -classpath ${LIBS}bin/ src/*/*/*/*.java
jar: build
	cd bin && jar cvfe `echo ${package} | tr '.' '-'`.jar ${package}.Main \
		`find . -type f | tr '\n' ' '`
