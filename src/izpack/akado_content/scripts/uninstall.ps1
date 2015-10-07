echo "Suppression du repertoire de configuration"
rm -force $env:userprofile\appconfig\akado-avdth
echo "Desinstallation d'AKaDo"
java -jar Uninstaller/Uninstaller.jar