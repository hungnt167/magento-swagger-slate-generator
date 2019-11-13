#!/usr/bin/env bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -e [whitelist end points] -l [code example languages]"
   echo -e "\t-e Whitelist end points eg: webpos,xpos,etc"
   echo -e "\t-l Code example languages eg: javascript:Javascript,ruby:Ruby,go:Go,java:Java"
   exit 1 # Exit script after printing help
}

while getopts "e:l:" opt
do
   case "$opt" in
      e ) endPointsParameter="$OPTARG" ;;
      l ) languagesParameter="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done


# Print helpFunction in case json file are empty
file="./swagger.json"
if [ ! -f "$file" ]
then
    echo "$0: File '${file}' not found."
    helpFunction
fi

# Check is filter end points
if [ -z "$endPointsParameter" ]
then
   echo "Use all end points";
else
   echo "Filtering... end points";
   node filter_endpoint.js $endPointsParameter
   file="./filtered_swagger.json"
fi

# Check is filter languages
languages="shell:Shell javascript:Javascript"
if [ -z "$languagesParameter" ]
then
    echo "$0: Use default language '${languages}'."
else
    languages="${languagesParameter//,/ }"
    echo "$0: Use language(s) '${languages}'."
fi

## Begin script in case all parameters are correct
node node_modules/widdershins/widdershins.js $file -o slate/source/index.html.md --language_tabs $languages
cd slate
bundle exec middleman build
bundle exec middleman server

# reset variables
OPTIND=1
cd ..
