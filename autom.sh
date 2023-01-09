#!/bin/bash

PS3="Select item please: "
items=("7_peripheral_ae_pa_20220722.pts"
		"8_central_ae_sync_20211015_20220722.pts"
		"9_central_peripheral_ae_pa_sync_20220722.pts"
		"cmd.exe /c python AutoPTS.py"
		"cmd.exe /c RunAutoPTS.bat"
		"ProfilesConfigs"
		"TestSet.json"
		"WorkDirectory"
		"TestTeam_Buckland"
        "TestTeam_Chimera")
testSets=("TestSet_Peripheral_role_only_with_AE_and_periodic_feature_220920.json"
		"TestSet_Central_role_only_with_AE_with_PA_feature_220920.json"
		"TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_220920.json")
AutoPath="AutoPTS_V2.7.4"
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
if [ -f TestSet_old.json ]; then
	rm TestSet_old.json
	echo "TestSet_old is existed"
else
	echo "TestSet_old is not existed"
fi
echo "Father"
while true; do
    select item in "${items[@]}" Quit
    do
        case $REPLY in
            1) echo "Selected item #$REPLY which means $item"; break 2;;
            2) echo "Selected item #$REPLY which means $item"; break 2;;
            3) echo "Selected item #$REPLY which means $item"; break 2;;
            4) echo "Selected item #$REPLY which means $item"; break 2;;
            5) echo "Selected item #$REPLY which means $item"; break 2;;
            6) echo "Selected item #$REPLY which means $item"; break 2;;
            7) echo "Selected item #$REPLY which means $item"; break 2;;
            8) echo "Selected item #$REPLY which means $item"; break 2;;
            9) echo "Selected item #$REPLY which means $item"; break 2;;
            10) echo "Selected item #$REPLY which means $item"; break 2;;
            $((${#items[@]}+1))) echo "We're done!"; exit;;
            *) echo "Ooops - unknown choice $REPLY"; break;
        esac
    done
done
SEL=$((REPLY-1))
echo "sam sel = $SEL"
if [ $REPLY -le 3 ]; then
	cp "/mnt/c/mchpCode/AutoPTS/${items[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/pics.pts"
	cp "/mnt/c/mchpCode/AutoPTS/${testSets[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/TestSet.json"
	echo "My selection is ${items[$SEL]}"
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
	cmd.exe /c python GenerateTestSet.py ../pics.pts
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
    echo "<3"
elif [ $REPLY -eq 4 ]; then
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
	cmd.exe /c python AutoPTS.py 
    # echo "==4"
elif [ $REPLY -eq 5 ]; then
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
    items[$SEL]
	# cmd.exe /c python AutoPTS.py 
    echo "==5"
elif [ $REPLY -eq 6 ]; then
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
    echo "==6"
else
    echo "unknown chhh"
fi
