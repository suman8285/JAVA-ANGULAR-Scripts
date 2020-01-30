#!/bin/sh

echo "Building the Angular UI"

echo "Enter the source file location"
read location

echo "Enter the destination file location"
read destination1

destination="/usr/share/nginx/html"
#destination="/usr/share/nginx"


echo "Ready to push the build to nginx"

function createDirectory() {
  if [ ! -d $1 ]
     then
        sudo mkdir -p $1/suman
     else
	 current_time=$(date "+%Y.%m.%d-%H.%M.%S")
	echo "Current Time : $current_time"
	

                  sudo mv $1/suman $1/suman$current_time
		  sudo chmod 777 -R $1
                  sudo mkdir -p $1/suman
    fi
}

function copytonginx() {
              sudo cp -R $location/. $destination/suman
	      sudo chmod 777 -R $destination/suman
	      sudo chown -R ec2-user $destination/suman
              str="Copied the files"
              echo $str
}

function checknginx(){
              sudo systemctl status nginx
}

function startnginx(){
              sudo systemctl start nginx
}

function stopnginx(){
              sudo systemctl stop nginx
}

checknginx
stopnginx
createDirectory $destination
val=$(copytonginx $location $destination)
startnginx
echo "Return value of the function is $val"
