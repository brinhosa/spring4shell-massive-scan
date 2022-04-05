#!/bin/bash

for url  in $(cat $1)
do
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.URLs%5B0%5D=0" )
        echo $url $status_code
        if [ $status_code == "400" ]
        then
                echo "[ + ] Vulnerable enviroment: $url"
        fi
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.DefaultAssertionStatus=test" )
        echo $url $status_code
        if [ $status_code == "400" ]
        then
                echo "[ ++ ] Vulnerable enviroment: $url"
        fi        
done
