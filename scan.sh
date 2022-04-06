#!/bin/bash

for url  in $(cat $1)
do
        status_code=$(curl -k -L -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.URLs%5B0%5D=0" )
        echo $status_code , $url , 1
        if [ $status_code == "400" ]
        then
                echo "[ + ] Vulnerable enviroment: $url"
        fi
        status_code=$(curl -k -L -s -o /dev/null -w "%{http_code}" "$url?class.module.classLoader.DefaultAssertionStatus=test" )
        echo $status_code , $url , 2
        if [ $status_code == "400" ]
        then
                echo "[ ++ ] Vulnerable enviroment: $url"
        fi        
        status_code=$(curl -k -L -s --data "class.module.classLoader.URLs%5B0%5D=0" -o /dev/null -w "%{http_code}" "$url" )
        echo $status_code , $url , 3
        if [ $status_code == "400" ]
        then
                echo "[ +P ] Vulnerable enviroment: $url"
        fi        
        status_code=$(curl -k -L -s -o /dev/null -w "%{http_code}" "$url/actuator/info?class.module.classLoader.URLs%5B0%5D=0" )
        echo $status_code , $url , 4
        if [ $status_code == "400" ]
        then
                echo "[ +I ] Vulnerable enviroment: $url"
        fi
        status_code=$(curl -k -L -s -o /dev/null -w "%{http_code}" "$url/system/mappings?class.module.classLoader.URLs%5B0%5D=0" )
        echo $status_code , $url , 5
        if [ $status_code == "400" ]
        then
                echo "[ +M ] Vulnerable enviroment: $url"
        fi       
        status_code=$(curl -k -L -s --data "class.module.classLoader.URLs%5B0%5D=0" -o /dev/null -w "%{http_code}" "$url/system/showOsInfo" )
        echo $status_code , $url , 6
        if [ $status_code == "400" ]
        then
                echo "[ +S ] Vulnerable enviroment: $url"
        fi        
        status_code=$(curl -k -L -s --data "class.module.classLoader.URLs%5B0%5D=0" -o /dev/null -w "%{http_code}" "$url/actuator/health" )
        echo $status_code , $url , 7
        if [ $status_code == "400" ]
        then
                echo "[ +H ] Vulnerable enviroment: $url"
        fi         
        status_code=$(curl -k -L -s -o /dev/null -w "%{http_code}" "$url/peripheral/v2/api-docs?class.module.classLoader.URLs%5B0%5D=0" )
        echo $status_code , $url , 8
        if [ $status_code == "400" ]
        then
                echo "[ +D ] Vulnerable enviroment: $url"
        fi        
done
