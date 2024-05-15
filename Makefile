install: 
	cp Kalyba.sh /bin/kalyba
	mkdir -p /usr/local/man/man1
	cp kalyba.1 /usr/local/man/man1/kalyba.1
clean:
	rm -f /bin/Kalyba
	rm -f /usr/local/man/man1/kalyba.1
uninstall:
	rm -f /bin/Kalyba
	rm -f /usr/local/man/man1/kalyba.1
.PHONY: clean install uninstall
