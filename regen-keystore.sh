#!/bin/bash

[ -d keytool-importkeypair ] || {
	git clone https://github.com/friendlyarm/keytool-importkeypair
	chmod 755 keytool-importkeypair/keytool-importkeypair
}

# Step 1: gen platform.keystore
# keystore file: platform.keystore
# password: android
rm -f app/platform.keystore
keytool-importkeypair/keytool-importkeypair \
	-k app/platform.keystore \
	-p android \
	-pk8 android-platform-key-files/platform.pk8 \
	-cert android-platform-key-files/platform.x509.pem \
	-alias platform

