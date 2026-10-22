JAVAC = javac
JAVA = java
JAR = jar
CP = .:/usr/share/java/freetts-1.2.2.jar

.PHONY: build run clean

build: Main.class Speaker.class

Main.class: Main.java
	$(JAVAC) -cp "$(CP)" Main.java

Speaker.class: Speaker.java
	$(JAVAC) -cp "$(CP)" Speaker.java

run: build
	$(JAVA) -cp "$(CP)" Main

ttsDemo.jar: Main.class Speaker.class
	$(JAR) cfe ttsDemo.jar Main Main.class Speaker.class

clean:
	rm -f *.class *.jar
