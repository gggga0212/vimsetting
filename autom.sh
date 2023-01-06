#!/bin/bash

PS3="Select item please: "
items=("7_peripheral_ae_pa_20220722"
		"8_central_ae_sync_20211015_20220722"
		"9_central_peripheral_ae_pa_sync_20220722"
		"nvim TestSet"
		"nvim GAP.json"
		"nvim GATT.json"
		"nvim L2CAP.json"
		"nvim SM.json"
		"run RunAutoPTS"
		"run AutoPTS")
testSets=("TestSet_Peripheral_role_only_with_AE_and_periodic_feature_220920"
		"TestSet_Central_role_only_with_AE_with_PA_feature_220920"
		"TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_220920")
AutoPath="AutoPTS_V2.7.4"
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
if [ -f TestSet_old.json ]; then
	rm TestSet_old.json
	echo "TestSet_old is existed"
else
	echo "TestSet_old is not existed"
fi
echo "mother"
while true; do
    select item in "${items[@]}" Quit
    do
        case $REPLY in
            1) echo "Selected item #$REPLY which means $item"; break 2;;
            2) echo "Selected item #$REPLY which means $item"; break 2;;
            3) echo "Selected item #$REPLY which means $item"; break 2;;
            $((${#items[@]}+1))) echo "We're done!"; exit;;
            *) echo "Ooops - unknown choice $REPLY"; break;
        esac
    done
done
SEL=$((REPLY-1))
echo "sam sel = $SEL"
# if [$(SEL) < 4]; then
	cp "/mnt/c/mchpCode/AutoPTS/${items[$SEL]}.pts" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/pics.pts"
	cp "/mnt/c/mchpCode/AutoPTS/${testSets[$SEL]}.json" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/TestSet.json"
	echo "My selection is ${items[$SEL]}"
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
	cmd.exe /c python GenerateTestSet.py ../pics.pts
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
	# cmd.exe /c python AutoPTS.py 
# 	echo "end 1"
# else
# 	echo "end 2"
# fi
