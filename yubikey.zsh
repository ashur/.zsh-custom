function ykreset {
    echo "Adding Yubikey to agent..."
    /usr/bin/ssh-add -e /usr/local/lib/opensc-pkcs11.so;
    /usr/bin/ssh-add -s /usr/local/lib/opensc-pkcs11.so;
}
