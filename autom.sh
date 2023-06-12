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
        "CaseDefine.json"
        "-----------------------"
        "Core_v5.2.pdf"
        "Core_v5.3.pdf"
        "Core_v5.4.pdf"
        "-----------------------"
        "BLE_Test_Command_Set.docx"
        "Profile_Test_Command_Set.docx"
        "---------- TCRL2022-2, 2023.02.07 -------------"
        "GAP.TS.p43.pdf   (2023.02.07)"
        "GATT.TS.p23.pdf  (2023.02.07)"
        "L2CAP.TS.p35.pdf (2023.02.07)"
        "SM.TS.p23.pdf    (2023.02.07)"
        "-----------------------"
        "ANP_SPEC_V10.pdf  (2011.09.05)"
        "ANS_SPEC_V10.pdf  (2011.09.15)"
        "PXP_v1.0.1.pdf    (2015.07.14)"
        "LLS_v1.0.1.pdf    (2015.07.14)"
        "IAS_SPEC_V10.pdf  (2011.06.21)"
        "TPS_SPEC_V10.pdf  (2011.06.21)"
        "BAS_SPEC_V10.pdf  (2011.12.27)"
        "HOGP_SPEC_V10.pdf (2011.12.27)"
        "HIDS_SPEC_V10.pdf (2011.12.27)"
        "-----------------------"
        "ANP.TS.1.0.3ed2.pdf (2019.11.11)"
        "ANS.TS.1.0.5ed2.pdf (2019.11.11)"
        "PXP.TS.1.0.1.3.pdf  (2019.07.29)"
        "BAS.TS.p5.pdf  (2022.12.27)"
        "HOGP.TS.p9.pdf (2023.02.07)"
        "HIDS.TS.p5.pdf (2023.02.07)")

testSets=("TestSet_Peripheral_role_only_with_AE_and_periodic_feature_220920.json"
		"TestSet_Central_role_only_with_AE_with_PA_feature_220920.json"
		"TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_220920.json")
AutoPath="AutoPTS_V2.8.3"
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
            12) echo "Selected item #$REPLY which means $item"; break 2;;
            13) echo "Selected item #$REPLY which means $item"; break 2;;
            14) echo "Selected item #$REPLY which means $item"; break 2;;
            15) echo "Selected item #$REPLY which means $item"; break 2;;
            16) echo "Selected item #$REPLY which means $item"; break 2;;
            17) echo "Selected item #$REPLY which means $item"; break 2;;
            18) echo "Selected item #$REPLY which means $item"; break 2;;
            19) echo "Selected item #$REPLY which means $item"; break 2;;
            20) echo "Selected item #$REPLY which means $item"; break 2;;
            21) echo "Selected item #$REPLY which means $item"; break 2;;
            22) echo "Selected item #$REPLY which means $item"; break 2;;
            23) echo "Selected item #$REPLY which means $item"; break 2;;
            24) echo "Selected item #$REPLY which means $item"; break 2;;
            25) echo "Selected item #$REPLY which means $item"; break 2;;
            26) echo "Selected item #$REPLY which means $item"; break 2;;
            27) echo "Selected item #$REPLY which means $item"; break 2;;
            28) echo "Selected item #$REPLY which means $item"; break 2;;
            29) echo "Selected item #$REPLY which means $item"; break 2;;
            30) echo "Selected item #$REPLY which means $item"; break 2;;
            31) echo "Selected item #$REPLY which means $item"; break 2;;
            32) echo "Selected item #$REPLY which means $item"; break 2;;
            33) echo "Selected item #$REPLY which means $item"; break 2;;
            34) echo "Selected item #$REPLY which means $item"; break 2;;
            35) echo "Selected item #$REPLY which means $item"; break 2;;
            36) echo "Selected item #$REPLY which means $item"; break 2;;
            37) echo "Selected item #$REPLY which means $item"; break 2;;
            38) echo "Selected item #$REPLY which means $item"; break 2;;
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
elif [ $REPLY -le 9 ]; then
    cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
	~/.config/nvim-linux64/bin/nvim ${items[$SEL]} 
else
    cd "/mnt/c/mchpCode"
    cmd.exe /c start ${items[$SEL]}
fi
