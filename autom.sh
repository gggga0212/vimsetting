#!/bin/bash

PS3="Select item please: "
nv="~/.config/nvim-linux64/bin/nvim"
items=( "7_peripheral_ae_pa_20230807.pts"
        "8_central_ae_sync_20230807.pts"
        "9_central_peripheral_ae_pa_sync_20230807.pts"
        "cmd.exe /c python AutoPTS.py"
        "cmd.exe /c RunAutoPTS.bat"
        "ProfilesConfigs"
        "WorkDirectory"
         "TestSet.json"
         "CaseDefine.json"
         "AutoPTS.py"
         "MiddleTest"
         "MiddleTestLog"
         "-----------------------"
         "Core_v5.2.pdf"
         "Core_v5.3.pdf"
         "Core_v5.4.pdf"
         "-----------------------"
         "BLE_Test_Command_Set.docx"
         "Profile_Test_Command_Set.docx"
         "------ TCRL2023-1------"
         "GAP.TS.p44.pdf   (2023.06.29)"
         "GATT.TS.p24.pdf  (2023.06.29)"
         "L2CAP.TS.p36.pdf (2023.06.29)"
         "SM.TS.p24.pdf    (2023.06.29)"
         "-----------------------"
         "GAP.ICS.p40.pdf  (2023.06.29)"
         "GATT.ICS.p17.pdf (2023.06.29)"
         "L2CAP.ICS.p25ed3.pdf  (2023.04.14)"
         "SMP.ICS.p11.pdf  (2023.02.07)"
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
         "LLS.TS.p4.pdf  (2023.06.29)"
         "IAS.TS.p3.pdf  (2011.06.21)"
         "TPS.TS.p4.pdf  (2011.06.21)"
         "BAS.TS.p5.pdf  (2022.12.27)"
         "HOGP.TS.p9.pdf (2023.02.07)"
         "HIDS.TS.p5.pdf (2023.02.07)"
         "-----------------------"
         "Assigned_Numbers.pdf (2023.07.25)"
         "CSS_v11.pdf (2023.01.31)")

testSets=("TestSet_Peripheral_role_only_with_AE_and_periodic_feature_230713.json"
        "TestSet_Central_role_only_with_AE_with_PA_feature_230713.json"
        "TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_230713.json")
AutoPath="AutoPTS_V3.0.2"
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
if [ -f TestSet_old.json ]; then
    rm TestSet_old.json
    echo "TestSet_old is existed"
else
    echo "TestSet_old is not existed"
fi
while true; do
    select item in "${items[@]}" Quit
    do
        if [ $REPLY -le ${#items[@]} ]; then
            echo "Selected item #$REPLY which means $item"; break 2;
        else
            echo "Ooops - unknown choice $REPLY"; exit;
        fi
    done
done
if [ $REPLY -le ${#items[@]} ]; then
    SEL=$((REPLY-1))
    echo "sam sel = $SEL"
    if [ $REPLY -le 3 ]; then
        echo "My selection is ${items[$SEL]}"
        cp "/mnt/c/mchpCode/AutoPTS/${items[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/pics.pts"
        cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
        cmd.exe /c python GeneratePtsConfig.py ../pics.pts
        cp "/mnt/c/mchpCode/AutoPTS/${testSets[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/TestSet.json"
    elif [ $REPLY -le 5 ]; then
        cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
        ${items[$SEL]}
    elif [ $REPLY -le 7 ]; then
        echo "6 and 7"
        cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/${items[$SEL]}"
        ~/.config/nvim-linux64/bin/nvim .
    elif [ $REPLY -le 10 ]; then
        cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
        ~/.config/nvim-linux64/bin/nvim ${items[$SEL]} 
    elif [ $REPLY -le 11 ]; then
        cd "/mnt/c/mchpCode/AutoPTS/MiddleWare230807/MiddleWare"
        cmd.exe /c python main.py
    elif [ $REPLY -le 12 ]; then
        cd "/mnt/c/mchpCode/AutoPTS/MiddleWare230807/MiddleWare/log"
        ~/.config/nvim-linux64/bin/nvim .
    else
        cd "/mnt/c/mchpCode"
        cmd.exe /c start ${items[$SEL]}
    fi
fi
