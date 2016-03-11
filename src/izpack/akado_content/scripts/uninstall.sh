#!/bin/sh

echo "Suppression du repertoire de configuration"
rm -fr $HOME/.config/akado-avdth
echo "Desinstallation d'AKaDo"
java -jar Uninstaller/Uninstaller.jar
