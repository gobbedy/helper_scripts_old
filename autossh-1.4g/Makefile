# $Id: Makefile.in,v 1.9 2019/01/05 01:24:52 harding Exp $
#
# Makefile.  Generated from Makefile.in by configure.

VER=		1.4g

SSH=		/usr/bin/ssh

prefix=		/usr/local
exec_prefix=	${prefix}
bindir=		${exec_prefix}/bin
datadir=	${prefix}/share
datarootdir=	@datarootdir@
mandir=		${prefix}/man

SRCDIR=		.


CC=		gcc
CFLAGS=		-g -O2 -Wall -DVER=\"$(VER)\" -DSSH_PATH=\"$(SSH)\"
CPPFLAGS=	

OFILES=		autossh.o

LD=		@LD@
LDFLAGS=	
LIBS=		-lnsl 

TARGET=		autossh

all:		$(TARGET)


$(TARGET):	$(OFILES)
		$(CC) $(CPPFLAGS) $(LDFLAGS) -o $(TARGET) $(OFILES) $(LIBS)

clean:
		- /bin/rm -f *.o *.a *.core *~

allclean:	clean
		- /bin/rm -f $(TARGET)

distclean:	allclean
		- /bin/rm -f config.log config.cache config.status config.h
		- /bin/rm -rf autom4te.cache
		- /bin/rm -f Makefile

install:	$(TARGET)
		mkdir -p -m 755 $(DESTDIR)$(bindir)
		mkdir -p -m 755 $(DESTDIR)$(prefix)/share/doc/autossh
		mkdir -p -m 755 $(DESTDIR)$(datadir)/examples/autossh
		mkdir -p -m 755 $(DESTDIR)$(mandir)/man1
		cp $(TARGET) $(DESTDIR)$(bindir)
		cp CHANGES README $(DESTDIR)$(datadir)/doc/autossh
		cp autossh.host	$(DESTDIR)$(datadir)/examples/autossh
		cp rscreen $(DESTDIR)$(datadir)/examples/autossh
		cp autossh.1 $(DESTDIR)$(mandir)/man1
		chmod 755 $(DESTDIR)$(bindir)/$(TARGET)
		chmod 644 $(DESTDIR)$(datadir)/doc/autossh/CHANGES
		chmod 644 $(DESTDIR)$(datadir)/doc/autossh/README
		chmod 644 $(DESTDIR)$(datadir)/examples/autossh/autossh.host 
		chmod 644 $(DESTDIR)$(datadir)/examples/autossh/rscreen
		chmod 644 $(DESTDIR)$(mandir)/man1/autossh.1 
