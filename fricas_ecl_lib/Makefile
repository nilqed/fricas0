# ############################################################################
# Targets:
# -- make .download ................... Download latest source tarball
# -- make .unpack ..................... Extract to fricas-x.y.z in CWD
# -- make .interp ..................... Run configure & make. Builds interp
# -- make .credirs .................... Creates build directories
# -- make .interp ..................... Build the interpreter
# -- make .algebra .................... interp + compile the algebra
# -- make .faslib ..................... Create libfricas.fas (interp)
# -- make .copyfiles .................. Copy files to build direcotries
# -- make precheck .................... Default. Do some pre-checking.
# -- make test ........................ Should startup FriCAS Interpreter
# -- make clean ....................... Perform some tidiying (partial clean)
# -- make install ..................... Install to /usr/local/lib/ ? NYI
# -- make lib ......................... .credirs/.algebra/.faslib/.copyfiles
# -- make all ......................... .download/.unpack/lib
#
# Source tarball
# ############################################################################
VERSION = 1.3.2
URLDIR = https://sourceforge.net/projects/fricas/files/fricas/$(VERSION)
SRCTAR = fricas-$(VERSION)-full.tar.bz2
DWLURL = $(URLDIR)/$(SRCTAR)
TOPDIR = $(PWD)/fricas-$(VERSION)
INTDIR = $(TOPDIR)/src/interp
LSPDIR = $(TOPDIR)/src/lisp
PRGDIR = $(TOPDIR)/pre-generated

FRICAS0 = build
CWD = $PWD

# Download method (note that curl needs -L when downloading from SF)
DWNLD = curl -L -O

# Extract method
EXTRACT = tar xvf 

# Rename file command (caution: rename.ul or rename depends on OS)
REN = rename

# Make directories
MKDIR_P = mkdir -p

# Copy
COPY = cp
COPYV = cp -v
COPYR = cp -r 


# Lisp ECL
CL = ecl
COMPILE = ecl -compile
LOAD = ecl -load
EVAL = ecl -shell

# Lisp file created
TMP0 = mkfaslib.lisp

# Name of atrget library
FASLIB = "libfricas"


.PHONY: precheck

.download:   
			$(DWNLD) $(DWLURL)

.unpack:
			$(EXTRACT) $(SRCTAR)

.interp:
			patch -b -f $(TOPDIR)/configure configure.patch || true
			cd $(TOPDIR); ./configure --with-lisp=ecl --without-x
			$(MAKE) -C $(TOPDIR) all-interpsys
			
.algebra:
			patch -b -f $(TOPDIR)/configure configure.patch || true
			cd $(TOPDIR); ./configure --with-lisp=ecl --without-x
			$(MAKE) -C $(TOPDIR) all-algebra
			
.faslib:
			echo '(ext:chdir ''"$(INTDIR)")' > $(TMP0)
			echo '(load ''"$(LSPDIR)/fricas-package.lisp")' >> $(TMP0)
			echo '(load ''"$(LSPDIR)/fricas-config.lisp")' >> $(TMP0) 
			echo '(load ''"$(LSPDIR)/fricas-lisp.lisp")' >> $(TMP0)
			echo '(load ''"$(LSPDIR)/primitives.lisp")' >> $(TMP0)
			echo '(load ''"$(LSPDIR)/fricas-ecl.lisp")' >> $(TMP0)
			echo '(load ''"$(INTDIR)/makeint.lisp")' >> $(TMP0)
			echo "(c::build-fasl" >> $(TMP0) 
			echo "(compile-file-pathname \"$(FASLIB)\" :type :fas)" >> $(TMP0)
			echo ":lisp-files FRICAS-LISP::*fricas-initial-lisp-objects*" >>$(TMP0) 
			echo ":ld-flags FRICAS-LISP::*fricas-extra-c-files*)" >> $(TMP0)
			$(EVAL) $(TMP0)
			


.credirs:
			${MKDIR_P} $(FRICAS0)
			${MKDIR_P} $(FRICAS0)/algebra
			${MKDIR_P} $(FRICAS0)/algebra/src
			${MKDIR_P} $(FRICAS0)/interp
			${MKDIR_P} $(FRICAS0)/lisp
			${MKDIR_P} $(FRICAS0)/msgs
			${MKDIR_P} $(FRICAS0)/help
			
.copyfiles: #.credirs .faslib
			$(COPY) $(INTDIR)/libfricas.fas $(FRICAS0)/interp
			$(COPY) $(INTDIR)/exposed.lsp $(FRICAS0)/interp
			$(COPY) $(TOPDIR)/src/share/doc/msgs/s2-us.msgs $(FRICAS0)/msgs
			$(COPY) $(PRGDIR)/target/share/spadhelp/* $(FRICAS0)/help 
			$(COPY) $(PRGDIR)/src/algebra/*.lsp $(FRICAS0)/algebra
			$(COPYR) $(PRGDIR)/target/algebra/* $(FRICAS0)/algebra
			$(eval ARCH=$(shell $(TOPDIR)/config/config.guess)) 
			$(COPYR) $(TOPDIR)/target/$(ARCH)/algebra/* $(FRICAS0)/algebra
			$(COPYR) $(TOPDIR)/target/$(ARCH)/src/algebra/* $(FRICAS0)/algebra/src 	

precheck:
			$(eval ARCH=$(shell $(TOPDIR)/config/config.guess)) 
			$(eval ECLV=$(shell ecl --version))
			@echo ###
			@echo Goal: build a FriCAS library for ECL
			@echo Arch: .............. $(ARCH)
			@echo OS: ................ $(OS)
			@echo ECL version: ....... $(ECLV)
			@echo Sources required ... $(SRCTAR)
			@echo Download link ...... $(URLDIR)
			@echo Download method .... $(DWNLD)
			@echo Extract method ..... $(EXTRACT)
			@echo Target folder ...... $(FRICAS0)
			@echo Library name ....... $(FASLIB).fas
			@if ! [ -f "configure.patch" ];\
			then echo "Patch missing"; exit 1; fi
			@if ! [ -f "fricas.lisp" ];\
			then echo "Missing file: fricas.lisp"; exit 2; fi
			@if ! ([ -d $(TOPDIR) ] || [ -f $(SRCTAR) ]);\
			then echo "Neither source tarball nor source directory found.";\
			     echo "Either get and unpack $(SRCTAR) here or do:";\
			     echo "  make .download && make .unpack, followed by ";\
			     echo "  make lib"; exit 3; fi
			@if ([ -f $(SRCTAR) ] && [ ! -d $(TOPDIR) ]);\
			then echo "Source tarball $(SRCTAR) found.";\
			     echo "Type 'make .unpack' or extract manually."; exit 4; fi
			@if [[ -z "$(ECLV)" ]];\
			then echo "ECL not found! Version 16.+ recommended"; exit 5; fi
			@echo ###
			@if [ -d $(TOPDIR) ]; then echo "Good. Now type 'make lib'";\
			else echo "Something got wrong - you should'nt be here ...";fi
			  

lib:	   	.algebra .credirs .faslib .copyfiles

all:		.download .unpack lib	
			
test:
			$(COPY) fricas.lisp $(FRICAS0)
			cd $(FRICAS0);\
			ecl -load fricas
			
install:
			@echo "Not implemented yet."

clean:
			$(RM) $(SRCTAR)
			$(RM) $(TMP0)

			