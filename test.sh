_CHANGED_FOLDERS=".,kmnlkn"
echo $_CHANGED_FOLDERS
if echo "$_CHANGED_FOLDERS" | grep -q "Flex"; then
   echo "hi"


   echo "$(git diff --dirstat=files,0 HEAD^ HEAD -- dataflow-pipelines/Flex* | sed 's/^[ 0-9.]\+% //g' | cut -d'/' -f2 | uniq)" >> lol

fi
