grep "nav_exclude" --include=\*.md . -riL | while read line
do
relativePath="$line"
gitUrl=$(git remote get-url origin)
shortGitUrl=${gitUrl%.*}
repoName=${shortGitUrl##*/}
editLink="${shortGitUrl}/edit/master/${relativePath}"

newName=""
echo $relativePath

if [ $relativePath == "./index.md" ];
    then 
        newName=$repoName
    else 
        tmp=${relativePath#./} 
        newName=${tmp%.*}
fi

newHeader="# $newName [✏️]($editLink)"

awk -v v="$newHeader" '{if (NR == 1) {print v} else {print $0}}' $relativePath > tmp && mv tmp $relativePath
done
