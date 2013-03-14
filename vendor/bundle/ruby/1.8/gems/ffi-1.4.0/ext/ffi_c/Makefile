
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /home/helpdesk/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/x86_64-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
exec_prefix = $(prefix)
prefix = $(DESTDIR)/home/helpdesk/.rvm/rubies/ree-1.8.7-2012.02
libdir = $(exec_prefix)/lib
vendorarchdir = $(vendorlibdir)/$(sitearch)
rubylibdir = $(libdir)/ruby/$(ruby_version)
sysconfdir = $(prefix)/etc
dvidir = $(docdir)
datadir = $(datarootdir)
mandir = $(datarootdir)/man
localedir = $(datarootdir)/locale
sitedir = $(libdir)/ruby/site_ruby
vendorlibdir = $(vendordir)/$(ruby_version)
docdir = $(datarootdir)/doc/$(PACKAGE)
pdfdir = $(docdir)
libexecdir = $(exec_prefix)/libexec
sharedstatedir = $(prefix)/com
archdir = $(rubylibdir)/$(arch)
localstatedir = $(prefix)/var
psdir = $(docdir)
sitelibdir = $(sitedir)/$(ruby_version)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
infodir = $(datarootdir)/info
htmldir = $(docdir)
sitearchdir = $(sitelibdir)/$(sitearch)
vendordir = $(libdir)/ruby/vendor_ruby
oldincludedir = $(DESTDIR)/usr/include
includedir = $(prefix)/include
sbindir = $(exec_prefix)/sbin

CC = /usr/bin/gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = extconf.h
CFLAGS   =  -fPIC -g -O2 -O2 -fno-tree-dce -fno-optimize-sibling-calls  -fPIC $(cflags)   
INCFLAGS = $(PREINCFLAGS) -I. -I/opt/local/include -I. -I/home/helpdesk/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/x86_64-linux -I.
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\"   
CXXFLAGS = $(CFLAGS) 
ldflags  = -L.  -rdynamic -Wl,-export-dynamic 
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CC) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = x86_64-linux
sitearch = x86_64-linux
ruby_version = 1.8
ruby = /home/helpdesk/.rvm/rubies/ree-1.8.7-2012.02/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir) -Wl,-R$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lffi  -lffi   -L/opt/local/lib -lrt -ldl -lcrypt -lm   -lc
SRCS = LastError.c FunctionInfo.c Variadic.c Types.c AbstractMemory.c MemoryPointer.c Function.c Platform.c ClosurePool.c Pointer.c Thread.c StructByReference.c MappedType.c StructLayout.c StructByValue.c MethodHandle.c Struct.c Call.c LongDouble.c Buffer.c DynamicLibrary.c ArrayType.c ffi.c DataConverter.c Type.c
OBJS = LastError.o FunctionInfo.o Variadic.o Types.o AbstractMemory.o MemoryPointer.o Function.o Platform.o ClosurePool.o Pointer.o Thread.o StructByReference.o MappedType.o StructLayout.o StructByValue.o MethodHandle.o Struct.o Call.o LongDouble.o Buffer.o DynamicLibrary.o ArrayType.o ffi.o DataConverter.o Type.o
TARGET = ffi_c
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/helpdesk/Sites/directory/vendor/bundle/ruby/1.8/gems/ffi-1.4.0/lib$(target_prefix)
RUBYARCHDIR = /home/helpdesk/Sites/directory/vendor/bundle/ruby/1.8/gems/ffi-1.4.0/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h $(RUBY_EXTCONF_H)
