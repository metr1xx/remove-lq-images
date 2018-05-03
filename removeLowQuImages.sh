#!bin/bash
$COUNTER=0
for file in *
do
    extension=`echo $file | sed 's/.*\.//'`
    echo $extension
    if [[ "$extension" -eq "jpg" || "$extension" -eq "png" ]]
    then
        W=`identify $file | cut -f 3 -d " " | sed s/x.*//` #width
        H=`identify $file | cut -f 3 -d " " | sed s/.*x//` #height
        if [ $W -lt 3440 ]
        then
            rm $file
            echo "$file removed."
            COUNTER=$(($COUNTER + 1))
        elif [ $H -lt 1440 ]
        then
            rm $file
            echo "$file removed."
            COUNTER=$(($COUNTER + 1))
        fi
    fi
done
echo
echo "$COUNTER files removed"
