###  Variables 
PACKAGE_NAME := ds-updatesys
BASH_SCRIPT_NAME := updater.sh
PACKAGE_VERSION := 1.2.0.35
DEB_PACKAGE := $(PACKAGE_NAME)_$(PACKAGE_VERSION).deb
LICENSE_FILE := LICENSE.md

## Control file variables
CTRL_SOURCE := $(PACKAGE_NAME)
CTRL_PACKAGE := $(PACKAGE_NAME)
CTRL_VERSION := $(PACKAGE_VERSION)
CTRL_SECTION := utils
CTRL_HOMEPAGE := https://github.com/DinoSlavik/ds-shellprogs
CTRL_ARCHITECTURE := all
CTRL_ESSENTIAL := no
CTRL_INSTALLED-SIZE := 13
CTRL_MAINTAINER := Dino Slavik <dino.slavik@gmail.com>
CTRL_DESCRIPTION := Simple debian system updater by Dino Slavik
CTRL_LICENSE := GPL-3.0

###  Rule for build DEB-package
deb: $(BASH_SCRIPT_NAME)
	# Create dirs
	mkdir -p $(PACKAGE_NAME)/usr/bin
	mkdir -p $(PACKAGE_NAME)/usr/share/ds-shellprogs
	mkdir -p $(PACKAGE_NAME)/DEBIAN
	# Add program to PATH
	cp $(BASH_SCRIPT_NAME) $(PACKAGE_NAME)/usr/share/ds-shellprogs/$(PACKAGE_NAME).sh
	chmod +x $(PACKAGE_NAME)/usr/share/ds-shellprogs/$(PACKAGE_NAME).sh
	ln -sf /usr/share/ds-shellprogs/$(PACKAGE_NAME).sh $(PACKAGE_NAME)/usr/bin/$(PACKAGE_NAME)
	# Create control file
	echo "Source: $(CTRL_SOURCE)" > $(PACKAGE_NAME)/DEBIAN/control
	echo "Package: $(CTRL_PACKAGE)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Version: $(CTRL_VERSION)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Section: $(CTRL_SECTION)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Homepage: $(CTRL_HOMEPAGE)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Architecture: $(CTRL_ARCHITECTURE)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Essential: $(CTRL_ESSENTIAL)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Installed-Size: $(CTRL_INSTALLED-SIZE)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Maintainer: $(CTRL_MAINTAINER)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Description: $(CTRL_DESCRIPTION)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "License: $(CTRL_LICENSE)" >> $(PACKAGE_NAME)/DEBIAN/control
	
	## Post install script
	# Add postinst to package folder
	cp postinst $(PACKAGE_NAME)/DEBIAN/postinst
	chmod +x $(PACKAGE_NAME)/DEBIAN/postinst
	# Add postinst link to md5sums
	echo "postinst" >> $(PACKAGE_NAME)/DEBIAN/md5sums
	
	## Adding license file to package (don't work...)
	cp ../$(LICENSE_FILE) $(PACKAGE_NAME)/usr/share/ds-shellprogs/$(LICENSE_FILE)
	echo "$(LICENSE_FILE)" >> $(PACKAGE_NAME)/DEBIAN/md5sums
	# DEBIAN/copyright
	echo "Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/" > $(PACKAGE_NAME)/DEBIAN/copyright
	echo "Upstream-Name: ds-updatesys" >> $(PACKAGE_NAME)/DEBIAN/copyright
	echo "Source: https://github.com/DinoSlavik/ds-shellprogs" >> $(PACKAGE_NAME)/DEBIAN/copyright
	echo "\n" >> $(PACKAGE_NAME)/DEBIAN/copyright
	echo "Files: *" >> $(PACKAGE_NAME)/DEBIAN/copyright
	echo "Copyright: (c) 2023, Dino Slavik" >> $(PACKAGE_NAME)/DEBIAN/copyright
	echo "License: GPL-3+" >> $(PACKAGE_NAME)/DEBIAN/copyright
	
	## Build deb package
	dpkg-deb --build $(PACKAGE_NAME)
	# Rename package name to $(DEB_PACKAGE)
	mv $(PACKAGE_NAME).deb $(DEB_PACKAGE)
	
	## Clean rule in not clean rule...
	rm -rf $(PACKAGE_NAME)

### Clean rule
clean:
	rm -rf $(PACKAGE_NAME) 

