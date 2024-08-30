import os
import subprocess

nv = "~/.config/nvim-linux64/bin/nvim"
AutoPath = "AutoPTS_V3.0.7"
MidPath = "Endpoint_V1.3.4"
index = [
    "Generate AutoPTS Env",
    "Run AutoPTS",
    "vimEdit",
    "Folder",
    "App"
]
item_Auto = [
    "7_peripheral_ae_pa_20240829.pts",
    "8_central_ae_sync_20240829.pts",
    "9_central_peripheral_ae_pa_sync_20240829.pts",
    "ANP_ANS_PXP_For_TCRL_2024_1.pts",
    "IAS_LLS_TPS_For_TCRL_2024_1.pts",
    "BAS_For_TCRL_2024_1.pts",
    "DIS_For_TCRL_2024_1.pts",
    "HIDS_For_TCRL_2024_1.pts",
    "HOGPS_For_TCRL_2024_1.pts"
]
item_RunAutoPTS = [
    "cmd.exe /c python AutoPTS.py",
    "cmd.exe /c RunAutoPTS.bat",
    "Run MiddleWareTest"
]
item_vimEdit = [
    "TestSet.json",
    "CaseDefine.json",
    "AutoPTS.py"
]
item_Folder = [
    "ProfilesConfigs",
    "WorkDirectory",
    "MiddleTestLog"
]
item_App = {
    "ICS": [
        "GAP.ICS.p42.pdf  (2024.09.04)",
        "GATT.ICS.p19.pdf (2024.09.04)",
        "L2CAP.ICS.p26.pdf  (2024.07.01)",
        "SM.ICS.p12.pdf  (2024.07.01)",
        "ANP.ICS.p6.pdf  (2023.02.07)",
        "ANS.ICS.p5.pdf  (2023.02.07)",
        "PXP.ICS.p6.pdf  (2024.07.01)",
        "IAS.ICS.p4.pdf  (2023.02.07)",
        "LLS.ICS.p2.pdf  (2023.02.07)",
        "TPS.ICS.p4.pdf  (2023.02.07)",
        "BAS.ICS.p5.pdf  (2024.07.01)",
        "DIS.ICS.p5.pdf  (2023.06.23)",
        "HIDS.ICS.p3.pdf  (2023.02.27)",
        "HOGP.ICS.p8.pdf  (2024.07.01)"
    ],
    "SPEC": [
        "Core_v5.2.pdf",
        "Core_v5.3.pdf",
        "Core_v5.4.pdf"
        "ANP_SPEC_V10.pdf  (2011.09.05)",
        "ANS_SPEC_V10.pdf  (2011.09.15)",
        "PXP_v1.0.1.pdf    (2015.07.14)",
        "LLS_v1.0.1.pdf    (2015.07.14)",
        "IAS_SPEC_V10.pdf  (2011.06.21)",
        "TPS_SPEC_V10.pdf  (2011.06.21)",
        "BAS_SPEC_V10.pdf  (2011.12.27)",
        "DIS_SPEC_V11r00.pdf  (2011.11.29)",
        "HIDS_SPEC_V10.pdf (2011.12.27)",
        "HOGP_SPEC_V10.pdf (2011.12.27)"
    ],
    "TS": [
        "GAP.TS.p46.pdf   (2024.09.04)",
        "GATT.TS.p26.pdf  (2024.09.04)",
        "L2CAP.TS.p38.pdf (2024.09.04)",
        "SM.TS.p26.pdf    (2024.09.04)"
        "ANP.TS.1.0.3ed2.pdf (2019.11.11)",
        "ANS.TS.1.0.5ed2.pdf (2019.11.11)",
        "PXP.TS.p10.pdf  (2024.07.01)",
        "IAS.TS.p3.pdf  (2011.06.21)",
        "LLS.TS.p4.pdf  (2023.06.29)",
        "TPS.TS.p4.pdf  (2011.06.21)",
        "BAS.TS.p6.pdf  (2023.06.29)",
        "DIS.TS.p6.pdf  (2023.06.23)",
        "HIDS.TS.p6.pdf (2024.07.01)",
        "HOGP.TS.p11.pdf (2024.07.01)"
    ],
    "Docs for SQA": [
        "PTS_ANP_For_SQA.docx",
        "PTS_ANS_For_SQA.docx",
        "PTS_PXP_For_SQA.docx",
        "PTS_IAS_For_SQA.docx",
        "PTS_LLS_For_SQA.docx",
        "PTS_TPS_For_SQA.docx",
        "PTS_BAS_For_SQA.docx",
        "PTS_DIS_For_SQA.docx",
        "PTS_HIDS_For_SQA.docx",
        "PTS_HOGPS_For_SQA.docx"
    ],
    "Others": [
        "stack_test_script.ptp"
        "BLE_Test_Command_Set.docx",
        "Profile_Test_Command_Set.docx"
        "Assigned_Numbers.pdf (2023.07.25)",
        "CSS_v11.pdf (2023.01.31)"
    ]
}

testSets = [
    "TestSet_Peripheral_role_only_with_AE_and_periodic_feature_240713.json",
    "TestSet_Central_role_only_with_AE_with_PA_feature_240713.json",
    "TestSet_Central_and_Peripheral_role_with_AE_with_PA_feature_240713.json",
    "TCRL_2024_1_ANP_ANS_PXP.json",
    "TCRL_2024_1_IAS_LLS_TPS.json",
    "TCRL_2024_1_BAS.json",
    "TCRL_2024_1_DIS.json",
    "TCRL_2024_1_HIDS.json",
    "TCRL_2024_1_HOGP.json"
]

def display_menu(items):
    for idx, item in enumerate(items):
        print(f"{idx + 1}. {item}")
    choice = input("Select item please: ")
    try:
        choice = int(choice)
        if 1 <= choice <= len(items):
            return choice - 1
        else:
            print("ByeBye")
            exit()
    except ValueError:
        print("ByeBye")
        exit()

def selAuto():
    SEL = display_menu(item_Auto)
    os.remove(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}/pics.pts")
    subprocess.run([
        "cp",
        f"/mnt/c/mchpCode/AutoPTS/{item_Auto[SEL]}",
        f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}/pics.pts"
    ])
    os.chdir(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}/Function")
    subprocess.run(["cmd.exe", "/c", "python", "GeneratePtsConfig.py", "../pics.pts"])
    subprocess.run([
        "cp",
        f"/mnt/c/mchpCode/AutoPTS/{testSets[SEL]}",
        f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}/TestSet.json"
    ])

def selRunAutoPTS():
    SEL = display_menu(item_RunAutoPTS)
    if SEL <= 1:
        os.chdir(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}")
        subprocess.run(item_RunAutoPTS[SEL], shell=True)
    elif SEL == 2:
        os.chdir(f"/mnt/c/mchpCode/AutoPTS/{MidPath}/{MidPath}")
        subprocess.run(["cmd.exe", "/c", "python", "main.py"])

def selvimEdit():
    SEL = display_menu(item_vimEdit)
    os.chdir(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}")
    cmd = f"{nv} {item_vimEdit[SEL]}"
    os.system(cmd)

def selFolder():
    SEL = display_menu(item_Folder)
    os.chdir(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}")
    os.system(f'{nv} .')

def selApp():
    categories = list(item_App.keys())
    category_choice = display_menu(categories)
    selected_category = categories[category_choice]
    items = item_App[selected_category]

    SEL = display_menu(items)
    os.chdir("/mnt/c/mchpCode")
    subprocess.run(["cmd.exe", "/c", "start", items[SEL]])

def mainInit():
    os.chdir(f"/mnt/c/mchpCode/AutoPTS/{AutoPath}/{AutoPath}")
    if os.path.isfile("TestSet_old.json"):
        os.remove("TestSet_old.json")

    SEL = display_menu(index)
    print(f"Selected item #{SEL + 1} which means {index[SEL]}")
    if SEL == 0:
        selAuto()
    elif SEL == 1:
        selRunAutoPTS()
    elif SEL == 2:
        selvimEdit()
    elif SEL == 3:
        selFolder()
    elif SEL == 4:
        selApp()

if __name__ == "__main__":
    mainInit()
