#!/bin/bash

for url  in $(cat $1)
do
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.URLs%5B0%5D=0" )
        echo $status_code , $url 
        if [ $status_code == "400" ]
        then
                echo "[ + ] Vulnerable enviroment: $url"
        fi
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.DefaultAssertionStatus=test" )
        echo $status_code , $url 
        if [ $status_code == "400" ]
        then
                echo "[ ++ ] Vulnerable enviroment: $url"
        fi        
        status_code=$(curl -s --data "class.module.classLoader.URLs%5B0%5D=0" -o /dev/null -w "%{http_code}" "$url" )
        echo $status_code , $url 
        if [ $status_code == "400" ]
        then
                echo "[ +P ] Vulnerable enviroment: $url"
        fi        
        #curl -v host:port/path --data "class.module.classLoader.URLs%5B0%5D=0"
done
