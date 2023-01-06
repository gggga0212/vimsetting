#!/bin/bash

PS3="Select item please: "
AutoPath="AutoPTS_V2.7.4"
items=("No7_peripheral_ae_pa_20220722" "No8_central_ae_sync_20211015_20220722" "No9_central_peripheral_ae_pa_sync_20220722")
#
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
# rm TestSet_old.json TestSet.json.bak
cp "/mnt/c/mchpCode/AutoPTS/*.pts" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
select item in "${items[@]}" Quit
do
    case $REPLY in
        1) echo "Selection is $item";cd "Function";
        2) echo "Selection is $item";;
        3) echo "Selection is $item";;
        $((${#items[@]}+1))) echo "We're done!"; break;;
        *) echo "Ooops - unknown choice $REPLY";;
    esac
done
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
python GenerateTestSet.py ../pics.pts
