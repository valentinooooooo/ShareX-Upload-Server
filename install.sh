echo "Update apt-get"
echo "--------------------------------------------"
apt-get -y update
echo "--------------------------------------------"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' make|grep "install ok installed")
echo Checking for make: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "Make isn't installed. Setting up make."
  sudo apt-get -y install make
echo "--------------------------------------------"

fi
cd src && npm i
wget https://exiftool.org/Image-ExifTool-12.39.tar.gz
tar xvf Image-ExifTool-12.39.tar.gz
cd Image-ExifTool-12.39
perl Makefile.PL
make
make test
make install
echo "Finished installing dependencies!"
