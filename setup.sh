#!/bin/bash


# Git folder from project git
isInFile=$(cat .gitignore | grep -c "httpd-php")
if [ $isInFile -eq 0 ]; then
   echo httpd-php >> .gitignore
fi

# Menu for project setup
PS3='Please select your project type: '
options=("wordpress" "exit")
select opt in "${options[@]}"
do
    case $opt in
        "wordpress")
            echo "> Init docker-compose with WordPress"
            cp -a httpd-php/wordpress-docker-compose.yml docker-compose.yml
            break;
            ;;
        "exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
