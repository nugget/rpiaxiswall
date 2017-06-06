PREFIX?=	/usr
BIN?=		$(PREFIX)/sbin
SYSTEMD?=	/lib/systemd/system

all:

install: 
	install -p -o root -g root -m 0755 rpaw rpaw-wrapper $(BIN)
	install -p -o root -g root -m 0644 rpaw.service $(SYSTEMD)
	install -p -o root -g root -m 0640 rpaw.conf /etc
	systemctl enable rpaw.service
	systemctl daemon-reload
