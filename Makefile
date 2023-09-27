package=org.krzysckh.none

.PHONY: run init build jar

run: build
	java -classpath bin/ ${package}.Main
init:
	mkdir -p src/`echo ${package} | tr '.' '/'` bin/ lib/
build:
	javac -d bin/ -sourcepath src/ -classpath bin/ src/*/*/*/*.java
jar: build
	cd bin && jar cvfe `echo ${package} | tr '.' '-'`.jar ${package}.Main \
		`find . -type f | tr '\n' ' '`
