#!/bin/bash

# Variable declaration
#PACKAGE="httpd wget unzip"
#SRV="httpd"
URL='https://www.tooplate.com/zip-templates/2134_gotto_job.zip'
ART_NAME='2134_gotto_job'
TEMP_DIR="/tmp/webfile"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
   # Set variables for CentOS
   PACKAGE="httpd wget unzip"
   SRV="httpd"

   echo "Running setup from CentOS"

   # Install dependencies

   echo "Install packages"
   echo
   sudo yum install $PACKAGE -y > /dev/null
   echo
   echo "#################################"

  # Start and enable HTTPD
  echo "HTTPD started and enabled"
  sudo systemctl start $SRV
  echo
  sudo systemctl enable $SRV
  echo
  echo "#################################"

  #Create directory to save temporary file
  echo "Creating directory"
  mkdir $TEMP_DIR
  echo "###########################################"
  cd $TEMP_DIR
  echo
  echo "#################################"

  # Download website template from tooplate
  echo "Download file from tooplate"
  echo "###########################################"
  wget $URL > /dev/null
  echo
  echo "##########################################"

  echo "unzip the downloaded file"
  echo "###########################################"
  unzip $ART_NAME > /dev/null
  echo
  echo "###########################################"

  # copy all the files in to html
  echo "Copying the files to /var/www/html"
  echo "###########################################"
  sudo cp -r $ART_NAME/* /var/www/html
  echo
  echo "###########################################"

  # Restart HTTPD
  echo "restarting HTTPD"
  echo "###########################################"
  systemctl restart $SRV
  echo
  echo "###########################################"

  # remove the temperary file
  echo "removing /tmp/webfile"
  echo "###########################################"
  rm -rf $TEMP_DIR
  echo
  echo "###########################################"


  sudo systemctl status $SRV
  ls /var/www/html

else
   # Set variables for Ubuntu
   PACKAGE="apache2 wget unzip"
   SRV="apache2"

   echo "Running setup from CentOS"

   # Install dependencies

   echo "Install packages"
   echo
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo
   echo "#################################"

  # Start and enable HTTPD
  echo "HTTPD started and enabled"
  sudo systemctl start $SRV
  echo
  sudo systemctl enable $SRV
  echo
  echo "#################################"

  #Create directory to save temporary file
  echo "Creating directory"
  mkdir $TEMP_DIR
  echo "###########################################"
  cd $TEMP_DIR
  echo
  echo "#################################"

  # Download website template from tooplate
  echo "Download file from tooplate"
  echo "###########################################"
  wget $URL > /dev/null
  echo
  echo "##########################################"

  echo "unzip the downloaded file"
  echo "###########################################"
  unzip $ART_NAME > /dev/null
  echo
  echo "###########################################"

  # copy all the files in to html
  echo "Copying the files to /var/www/html"
  echo "###########################################"
  sudo cp -r $ART_NAME/* /var/www/html
  echo
  echo "###########################################"

  # Restart HTTPD
  echo "restarting HTTPD"
  echo "###########################################"
  systemctl restart $SRV
  echo
  echo "###########################################"

  # remove the temperary file
  echo "removing /tmp/webfile"
  echo "###########################################"
  rm -rf $TEMP_DIR
  echo
  echo "###########################################"


  sudo systemctl status $SRV
  ls /var/www/html
fi
