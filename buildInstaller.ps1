$AVDTH_DRIVER_PATH="C:\Users\jlebranc\Documents\Projets\Commun\dev_project\driver-avdth"

$AKADO_DOC="C:\Users\jlebranc\Documents\Projets\AKaDo\user_guide"
$AKADO_APPCONFIG="C:\Users\jlebranc\appconfig\akado-avdth"
$AKADO_PROJECT_PATH="C:\Users\jlebranc\Documents\Projets\AKaDo\akado_project"
$AKADO4AVDTH_PATH=($AKADO_PROJECT_PATH + "\akado4avdth")

$AKADO_INSTALLER_POM_FILE=($AKADO_PROJECT_PATH + "\akado4avdth\akado4avdth-installer\pom.xml")
$AKADO_INSTALLER_PATH=($AKADO_PROJECT_PATH + "\akado4avdth\akado4avdth-installer\src\izpack\akado_content")
$AKADO_INSTALLER_TARGET_PATH=($AKADO_PROJECT_PATH + "\akado4avdth\akado4avdth-installer\target")
$AKADO_AVDTH_UI_PATH=($AKADO_PROJECT_PATH + "\akado-avdth-ui\")

$AKADO_AVDTH_COMMON_PATH=($AKADO_PROJECT_PATH + "\akado-avdth-common\")
$AKADO_COMMON_PATH=($AKADO_PROJECT_PATH + "\akado-common\")
$AKADO_CORE_PATH=($AKADO_PROJECT_PATH + "\akado-core\")

$AKADO_AVDTH_DRIVER_PATH=($AKADO_PROJECT_PATH + "\akado-driver-avdth\")


echo "Nettoyage des librairies pré-existantes"
rm $AKADO_INSTALLER_PATH\libs
mkdir $AKADO_INSTALLER_PATH\libs
# rm -fr $AKADO4AVDTH_PATH\resource
# mkdir AKaDo4AVDTH\resource

echo "Compilation des librairies"
mvn clean install -f $AVDTH_DRIVER_PATH\pom.xml
mvn clean install -f $AKADO_COMMON_PATH\pom.xml
mvn clean install -f $AKADO_AVDTH_COMMON_PATH\pom.xml
mvn clean install -f $AKADO_AVDTH_DRIVER_PATH\pom.xml
mvn clean install -f $AKADO_CORE_PATH\pom.xml
mvn clean install -f $AKADO_AVDTH_UI_PATH\pom.xml


cp $AKADO_DOC\*.pdf $AKADO_INSTALLER_PATH\doc
cp $AKADO_AVDTH_UI_PATH\target\akado-avdth-ui-*.jar $AKADO_INSTALLER_PATH\libs
cp $AKADO_AVDTH_UI_PATH\target\libs\*.jar $AKADO_INSTALLER_PATH\libs\
cp $AKADO_AVDTH_DRIVER_PATH\target\akado-driver-avdth-*.jar $AKADO_INSTALLER_PATH\libs\
cp $AKADO_AVDTH_DRIVER_PATH\target\libs\*.jar $AKADO_INSTALLER_PATH\libs\

cp -Recurse -force $AKADO_APPCONFIG\shp  $AKADO_INSTALLER_PATH\resource\
 
# DATE=$(date -u +"20%y-%m-%d")

echo "Compilation de l'installeur"
mvn clean install -f $AKADO_INSTALLER_POM_FILE
mv -force $AKADO_INSTALLER_TARGET_PATH\akado-avdth-installer-*-standard.jar $AKADO4AVDTH_PATH

cd $AKADO4AVDTH_PATH

# zip -r AKaDo4AVDTH-$DATE.zip  $AKADO_INSTALLER_PATH
