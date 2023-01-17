#!/bin/bash

PS3="Select item please: "
nv="~/.config/nvim-linux64/bin/nvim"
items=("7_peripheral_ae_pa_20220722.pts"
		"8_central_ae_sync_20211015_20220722.pts"
		"9_central_peripheral_ae_pa_sync_20220722.pts"
		"cmd.exe /c python AutoPTS.py"
		"cmd.exe /c RunAutoPTS.bat"
		"ProfilesConfigs"
		"WorkDirectory"
        "TestSet.json"
        "Core_v5.2.pdf"
        "Core_v5.3.pdf"
        "BLE_Test_Command_Set.docx")
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
            11) echo "Selected item #$REPLY which means $item"; break 2;;
            $((${#items[@]}+1))) echo "We're done!"; exit;;
            *) echo "Ooops - unknown choice $REPLY"; break;
        esac
    done
done
SEL=$((REPLY-1))
echo "sam sel = $SEL"
if [ $REPLY -le 3 ]; then
	echo "My selection is ${items[$SEL]}"
	cp "/mnt/c/mchpCode/AutoPTS/${items[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/pics.pts"
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
	cmd.exe /c python GenerateTestSet.py ../pics.pts
	cp "/mnt/c/mchpCode/AutoPTS/${testSets[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/TestSet.json"
elif [ $REPLY -le 5 ]; then
	cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
    ${items[$SEL]}
elif [ $REPLY -le 7 ]; then
    echo "6 and 7"
    cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/${items[$SEL]}"
	~/.config/nvim-linux64/bin/nvim .
elif [ $REPLY == 8 ]; then
    cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
	~/.config/nvim-linux64/bin/nvim TestSet.json 
elif [ $REPLY -le 11 ]; then
    cd "/mnt/c/mchpCode"
    cmd.exe /c start ${items[$SEL]}
else
    echo "unknown chhh"
fi
