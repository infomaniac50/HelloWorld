# when you run 'make' alone, run the 'css' rule (at the
# bottom of this makefile)
all: javascript csharp java python

# .PHONY is a special command, that allows you not to
# require physical files as the target (allowing us to
# use the 'all' rule as the default target).
.PHONY: all

clean:
	git clean -Xdf

javascript: HelloWorld.hx
	haxe -main HelloWorld -js build/js/HelloWorld.js

# You need to install hxcs before running this task.
# haxelib install hxcs
csharp: HelloWorld.hx
	haxe -main HelloWorld -cs build/cs/

# You need to install hxjava before running this task.
# haxelib install hxjava
java: HelloWorld.hx
	haxe -main HelloWorld -java build/java/

python: HelloWorld.hx
	haxe -main HelloWorld -python build/python/HelloWorld.py

run:
	node build/js/HelloWorld.js
	mono build/cs/bin/HelloWorld.exe
	java -jar build/java/HelloWorld.jar
	python build/python/HelloWorld.py
