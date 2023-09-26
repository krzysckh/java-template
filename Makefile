package=org.krzysckh.none

run: build
	java -classpath bin/ ${package}.Main
init:
	mkdir -p src/`echo ${package} | tr '.' '/'` bin/ lib/
build:
	javac -d bin/ -sourcepath src/ -classpath bin/ src/org/krzysckh/*/Main.java
