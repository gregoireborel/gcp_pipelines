 _CHANGED_FOLDERS="$(git diff --dirstat=files,0 HEAD^ HEAD -- dataflow-pipelines/Flex* | sed 's/^[ 0-9.]\+% //g' | cut -d'/' -f2 | uniq)"
 if [ "$_CHANGED_FOLDERS" ]; then
     echo "CHANGES"
     echo "$_CHANGED_FOLDERS" > hey
 fi
