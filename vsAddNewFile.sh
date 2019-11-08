#! /bin/bash

newFile=$1;

# 確認檔案是否已存在
function duplicateCheck(){
    # echo $1.$2;
    if [ -f "$newFile.$1" ]; then
        echo "$newFile.$1 already exist, try another file name.";
        echo "Process terminated.";
        exit 1;
    fi
}

# 如果沒輸入檔案名
function fileNameCheck(){
    if [ -z "$newFile" ]; then
        echo "Must input new file name.";
        echo "Process terminated.";
        exit 1;
    fi
}



# entry point

fileNameCheck;

if [ -d "src" ]; then
    cd "src";
    if [ -d "less" ] && [ -d "components" ]; then
        # 分別確認重複檔案
        cd "less";
        duplicateCheck less;
        cd "../components";
        duplicateCheck jsx;
        cd "..";

        # 創建檔案
        path=$(pwd)/less/$newFile.less;
        echo >$path;
        path=$(pwd)/components/$newFile.jsx;
        echo >$path;
        echo "$1 has been added."
    else
        echo "In src , must have 'less' & 'components' folder.";
        exit 1;
    fi
else
    echo "You must to change directory into root directory of React project.";
    exit 1;

fi;

