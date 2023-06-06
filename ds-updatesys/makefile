# Variables 
PACKAGE_NAME := ds-updatesys
BASH_SCRIPT_NAME := updater.sh
PACKAGE_VERSION := 1.2.0.19
DEB_PACKAGE := $(PACKAGE_NAME)_$(PACKAGE_VERSION).deb
LICENSE_FILE := LICENSE.md

# Rule for build DEB-package
deb: $(BASH_UPDATER_NAME)
	mkdir -p $(PACKAGE_NAME)/usr/bin $(PACKAGE_NAME)/usr/share $(PACKAGE_NAME)/DEBIAN
	cp $(BASH_SCRIPT_NAME) $(PACKAGE_NAME)/usr/share/$(PACKAGE_NAME).sh
	chmod +x $(PACKAGE_NAME)/usr/share/$(PACKAGE_NAME).sh
	ln -sf $(PACKAGE_NAME)/usr/share/$(PACKAGE_NAME).sh $(PACKAGE_NAME)/usr/bin/$(PACKAGE_NAME)
	echo "Source: $(PACKAGE_NAME)" > $(PACKAGE_NAME)/DEBIAN/control
	echo "Package: $(PACKAGE_NAME)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Version: $(PACKAGE_VERSION)" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Section: utils" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Homepage: https://github.com/DinoSlavik/ds-shellprogs" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Architecture: all" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Essential: no" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Installed-Size: 14" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Maintainer: Dino Slavik" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "Description: Simple system updater by Dino Slavik" >> $(PACKAGE_NAME)/DEBIAN/control
	echo "License: GPL-3-0" >> $(PACKAGE_NAME)/DEBIAN/control
	dpkg-deb --build $(PACKAGE_NAME)
	mv $(PACKAGE_NAME).deb $(DEB_PACKAGE)
	
	# Post install script
	cp postinst $(PACKAGE_NAME)/DEBIAN/postinst
	chmod +x $(PACKAGE_NAME)/DEBIAN/postinst
	dpkg-deb --control $(DEB_PACKAGE) $(PACKAGE_NAME)/DEBIAN
	echo "postinst" >> $(PACKAGE_NAME)/DEBIAN/md5sums
	dpkg-deb --build $(PACKAGE_NAME)
	mv $(PACKAGE_NAME).deb $(DEB_PACKAGE)
	
	# Adding license to package (don't work...)
	cp ../$(LICENSE_FILE) $(PACKAGE_NAME)/usr/share/$(LICENSE_FILE)
	dpkg-deb --control $(DEB_PACKAGE) $(PACKAGE_NAME)/DEBIAN
	echo "$(LICENSE_FILE)" >> $(PACKAGE_NAME)/DEBIAN/md5sums
	dpkg-deb --build $(PACKAGE_NAME)
	mv $(PACKAGE_NAME).deb $(DEB_PACKAGE)
	
	# Clean rule in not clean rule...
	rm -rf $(PACKAGE_NAME)

# Clean rule
clean:
	rm -rf $(PACKAGE_NAME) 

