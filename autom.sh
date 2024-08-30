#!/bin/bash

PS3="Select item please: "
nv="~/.config/nvim-linux64/bin/nvim"
AutoPath="AutoPTS_V3.0.7"
MidPath="Endpoint_V1.3.4"
index=( "Generate AutoPTS Env"
        "Run AutoPTS"
        "vimEdit"
        "Folder"
        "App"
    )
item_Auto=( "7_peripheral_ae_pa_20240713.pts"
        "8_central_ae_sync_20240713.pts"
        "9_central_peripheral_ae_pa_sync_20240713.pts"
        "7_peripheral_ae_pa_20240829.pts"
        "8_central_ae_sync_20240829.pts"
        "9_central_peripheral_ae_pa_sync_20240829.pts"
        "ANP_ANS_PXP_For_TCRL_2024_1.pts"
        "IAS_LLS_TPS_For_TCRL_2024_1.pts"
        "BAS_For_TCRL_2024_1.pts"
        "DIS_For_TCRL_2024_1.pts"
        "HIDS_For_TCRL_2024_1.pts"
        "HOGPS_For_TCRL_2024_1.pts"
    )
item_RunAutoPTS=(
        "cmd.exe /c python AutoPTS.py"
        "cmd.exe /c RunAutoPTS.bat"
        "Run MiddleWareTest"
    )
item_vimEdit=(
         "TestSet.json"
         "CaseDefine.json"
         "AutoPTS.py"
    )
item_Folder=(
        "ProfilesConfigs"
        "WorkDirectory"
         "MiddleTestLog"
    )
item_App=(
         "Core_v5.2.pdf"
         "Core_v5.3.pdf"
         "Core_v5.4.pdf"
         "-----------------------"
         "BLE_Test_Command_Set.docx"
         "Profile_Test_Command_Set.docx"
         "------ TCRL2023-1------"
         "GAP.TS.p45.pdf   (2024.07.01)"
         "GATT.TS.p25.pdf  (2024.07.01)"
         "L2CAP.TS.p37.pdf (2024.07.01)"
         "SM.TS.p25.pdf    (2024.07.01)"
         "-----------------------"
         "GAP.ICS.p41.pdf  (2024.07.01)"
         "GATT.ICS.p18.pdf (2024.07.01)"
         "L2CAP.ICS.p26.pdf  (2024.07.01)"
         "SM.ICS.p12.pdf  (2024.07.01)"
         "-----------------------"
         "ANP.ICS.p6.pdf  (2023.02.07)"
         "ANS.ICS.p5.pdf  (2023.02.07)"
         "PXP.ICS.p6.pdf  (2024.07.01)"
         "IAS.ICS.p4.pdf  (2023.02.07)"
         "LLS.ICS.p2.pdf  (2023.02.07)"
         "TPS.ICS.p4.pdf  (2023.02.07)"
         "BAS.ICS.p5.pdf  (2024.07.01)"
         "DIS.ICS.p5.pdf  (2023.06.23)"
         "HID11.ICS.p12ed2.pdf  (2023.02.27)"
         "HOGP.ICS.p8.pdf  (2024.07.01)"
         "-----------------------"
         "ANP_SPEC_V10.pdf  (2011.09.05)"
         "ANS_SPEC_V10.pdf  (2011.09.15)"
         "PXP_v1.0.1.pdf    (2015.07.14)"
         "LLS_v1.0.1.pdf    (2015.07.14)"
         "IAS_SPEC_V10.pdf  (2011.06.21)"
         "TPS_SPEC_V10.pdf  (2011.06.21)"
         "BAS_SPEC_V10.pdf  (2011.12.27)"
         "DIS_SPEC_V11r00.pdf  (2011.11.29)"
         "HID_v1.1.1.pdf (2015.12.15)"
         "HOGP_SPEC_V10.pdf (2011.12.27)"
         "-----------------------"
         "ANP.TS.1.0.3ed2.pdf (2019.11.11)"
         "ANS.TS.1.0.5ed2.pdf (2019.11.11)"
         "PXP.TS.p10.pdf  (2024.07.01)"
         "IAS.TS.p3.pdf  (2011.06.21)"
         "LLS.TS.p4.pdf  (2023.06.29)"
         "TPS.TS.p4.pdf  (2011.06.21)"
         "BAS.TS.p6.pdf  (2023.06.29)"
         "DIS.TS.p6.pdf  (2023.06.23)"
         "HID11.TS.p14.pdf (2024.07.01)"
         "HOGP.TS.p11.pdf (2024.07.01)"
         "-------TCRL2024_1------"
         "PTS_ANP_For_SQA.docx"
         "PTS_ANS_For_SQA.docx"
         "PTS_PXP_For_SQA.docx"
         "PTS_IAS_For_SQA.docx"
         "PTS_LLS_For_SQA.docx"
         "PTS_TPS_For_SQA.docx"
         "PTS_BAS_For_SQA.docx"
         "PTS_DIS_For_SQA.docx"
         "PTS_HIDS_For_SQA.docx"
         "PTS_HOGPS_For_SQA.docx"
         "-----------------------"
         "Assigned_Numbers.pdf (2023.07.25)"
         "CSS_v11.pdf (2023.01.31)")

testSets=("TestSet_Peripheral_role_only_with_AE_and_periodic_feature_240713.json"
        "TestSet_Central_role_only_with_AE_with_PA_feature_240713.json"
        "TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_240713.json"
        "TestSet_Peripheral_role_only_with_AE_and_periodic_feature_240713.json"
        "TestSet_Central_role_only_with_AE_with_PA_feature_240713.json"
        "TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_240713.json"
        "TCRL_2024_1_ANP_ANS_PXP.json"
        "TCRL_2024_1_IAS_LLS_TPS.json"
        "TCRL_2024_1_BAS.json"
        "TCRL_2024_1_DIS.json"
        "TCRL_2024_1_HIDS.json"
        "TCRL_2024_1_HOGP.json")
cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
if [ -f TestSet_old.json ]; then
    rm TestSet_old.json
    echo "TestSet_old is existed"
else
    echo "TestSet_old is not existed"
fi

while true; do
    select index in "${index[@]}" Quit
    do
        if [ $REPLY -le ${#index[@]} ]; then
            echo "Selected item #$REPLY which means $index"; break 2;
        else
            echo "Ooops - unknown choice $REPLY"; exit;
        fi
    done
done

function selAuto()
{
    while true; do
        select item_Auto in "${item_Auto[@]}" Quit
        do
            if [ $REPLY -le ${#item_Auto[@]} ]; then
                SEL=$((REPLY-1))
                cp "/mnt/c/mchpCode/AutoPTS/${items[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/pics.pts"
                cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/Function"
                cmd.exe /c python GeneratePtsConfig.py ../pics.pts
                cp "/mnt/c/mchpCode/AutoPTS/${testSets[$SEL]}" "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath/TestSet.json"
                exit;
            else
                echo "Ooops - unknown choice $REPLY"; exit;
            fi
        done
    done
}

function selRunAutoPTS()
{
    while true; do
        select item_RunAutoPTS in "${item_RunAutoPTS[@]}" Quit
        do
            if [ $REPLY -le ${#item_RunAutoPTS[@]} ]; then
                SEL=$((REPLY-1))
                if [ $SEL -le 1 ]; then
                    echo "Ooops a - unknown choice $SEL";
                    cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
                    ${item_RunAutoPTS[$SEL]}
                    exit;
                elif [ $SEL -eq 2 ]; then
                    echo "Ooops b - unknown choice $SEL";
                    cd "/mnt/c/mchpCode/AutoPTS/$MidPath/$MidPath"
                    cmd.exe /c python main.py
                    exit;
                else
                    echo "Ooops - unknown choice $REPLY"; exit;
                fi
            else
                echo "Ooops - unknown choice $REPLY"; exit;
            fi
        done
    done
}

function selvimEdit()
{
    while true; do
        select item_vimEdit in "${item_vimEdit[@]}" Quit
        do
            if [ $REPLY -le ${#item_vimEdit[@]} ]; then
                SEL=$((REPLY-1))
                cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
                ~/.config/nvim-linux64/bin/nvim ${item_vimEdit[$SEL]} 
                exit;
            else
                echo "Ooops - unknown choice $REPLY"; exit;
            fi
        done
    done
}
function selFolder()
{
    while true; do
        select item_Folder in "${item_Folder[@]}" Quit
        do
            if [ $REPLY -le ${#item_Folder[@]} ]; then
                SEL=$((REPLY-1))
                cd "/mnt/c/mchpCode/AutoPTS/$AutoPath/$AutoPath"
                ~/.config/nvim-linux64/bin/nvim .
                exit;
            else
                echo "Ooops - unknown choice $REPLY"; exit;
            fi
        done
    done
}
function selApp()
{
    while true; do
        select item_App in "${item_App[@]}" Quit
        do
            if [ $REPLY -le ${#item_App[@]} ]; then
                SEL=$((REPLY-1))
                cd "/mnt/c/mchpCode"
                cmd.exe /c start ${item_App[$SEL]}
                exit;
            else
                echo "Ooops - unknown choice $REPLY"; exit;
            fi
        done
    done
}
if [ $REPLY -le ${#index[@]} ]; then
      SEL=$((REPLY-1))
      if [ $REPLY -eq 1 ]; then
          selAuto;
      elif [ $REPLY -eq 2 ]; then
          selRunAutoPTS;
      elif [ $REPLY -eq 3 ]; then
          selvimEdit
      elif [ $REPLY -eq 4 ]; then
          selFolder
      elif [ $REPLY -eq 5 ]; then
          selApp
      else
            echo "unknow choice";exit;
      fi

fi
