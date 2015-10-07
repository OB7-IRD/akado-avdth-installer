@echo Suppression du repertoire de configuration
rmdir /S /Q %userprofile%\appconfig\akado-avdth
@echo Desinstallation d'AKaDo
java -jar Uninstaller/Uninstaller.jar