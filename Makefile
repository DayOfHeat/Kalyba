install: 
	cp Kalyba.sh /bin/Kalyba

clean:
	rm -f /bin/Kalyba

uninstall:
	rm -f /bin/Kalyba

.PHONY: clean install uninstall
