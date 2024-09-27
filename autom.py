import json
import os
import subprocess
from colorama import init, Fore, Style

# Initialize colorama
init(autoreset=True)

# Macro for the base path
BASE_PATH = "/mnt/c/mchpCode"

nv = "~/.config/nvim-linux64/bin/nvim"
AutoPath = "AutoPTS_V3.1.0"
MidPath = "Endpoint_V1.3.4"

# Function to dynamically load filenames from the 'To_SQA' folder
def load_to_sqa_files():
    to_sqa_path = os.path.join(BASE_PATH, 'To_SQA')  # Corrected path to /mnt/c/mchpCode/To_SQA
    try:
        # Get all files in the To_SQA directory
        files = os.listdir(to_sqa_path)
        # Filter only files (exclude directories)
        return [file for file in files if os.path.isfile(os.path.join(to_sqa_path, file))]
    except FileNotFoundError:
        print(Fore.RED + f"Directory '{to_sqa_path}' not found.")
        return []
        
index = [
    "Gen PTS Env",
    "Run AutoPTS",
    "Vim",
    "Folder",
    "App"
]
item_Auto = [
    "7_peripheral_ae_pa_20240924.pts",
    "8_central_ae_sync_20240924.pts",
    "9_central_peripheral_ae_pa_sync_20240924.pts",
    "ANP_ANS_PXP_For_TCRL_2024_2.pts",
    "IAS_LLS_TPS_For_TCRL_2024_2.pts",
    "BAS_For_TCRL_2024_2.pts",
    "DIS_For_TCRL_2024_2.pts",
    "HIDS_For_TCRL_2024_2.pts",
    "HOGPS_For_TCRL_2024_2.pts",
    "Back to the previous page"
]
item_RunAutoPTS = [
    "cmd.exe /c python AutoPTS.py",
    "cmd.exe /c RunAutoPTS.bat",
    "Run MiddleWareTest",
    "Back to the previous page"
]
item_vimEdit = [
    "TestSet.json",
    "CaseDefine.json",
    "AutoPTS.py",
    "Back to the previous page"
]
item_Folder = [
    "ProfilesConfigs",
    "WorkDirectory",
    "MiddleTestLog",
    "Back to the previous page"
]
item_App = {
    "SPEC": [
        "Core_v5.2.pdf",
        "Core_v5.3.pdf",
        "Core_v5.4.pdf",
        "Core_v6.0.pdf",
        "ANP_SPEC_V10.pdf  (2011.09.05)",
        "ANS_SPEC_V10.pdf  (2011.09.15)",
        "PXP_v1.0.1.pdf    (2015.07.14)",
        "LLS_v1.0.1.pdf    (2015.07.14)",
        "IAS_SPEC_V10.pdf  (2011.06.21)",
        "TPS_SPEC_V10.pdf  (2011.06.21)",
        "BAS_SPEC_V10.pdf  (2011.12.27)",
        "DIS_SPEC_V11r00.pdf  (2011.11.29)",
        "HIDS_SPEC_V10.pdf  (2011.12.27)",
        "HOGP_SPEC_V10.pdf  (2011.12.27)",
        "Assigned_Numbers.pdf  (2023.07.25)",
        "CSS_v11.pdf  (2023.01.31)",
        "Back to the previous page"
    ],
    "TS": [
        "GAP.TS.p46.pdf   (2024.09.04)",
        "GATT.TS.p26.pdf  (2024.09.04)",
        "L2CAP.TS.p38.pdf  (2024.09.04)",
        "SM.TS.p26.pdf    (2024.09.04)",
        "ANP.TS.1.0.3ed2.pdf  (2019.11.11)",
        "ANS.TS.1.0.5ed2.pdf  (2019.11.11)",
        "PXP.TS.p10.pdf  (2024.07.01)",
        "IAS.TS.p3.pdf  (2011.06.21)",
        "LLS.TS.p4.pdf  (2023.06.29)",
        "TPS.TS.p4.pdf  (2011.06.21)",
        "BAS.TS.p6.pdf  (2023.06.29)",
        "DIS.TS.p6.pdf  (2023.06.23)",
        "HIDS.TS.p6.pdf  (2024.07.01)",
        "HOGP.TS.p11.pdf  (2024.07.01)",
        "Back to the previous page"
    ],
    "ICS": [
        "GAP.ICS.p42.pdf  (2024.09.04)",
        "GATT.ICS.p19.pdf  (2024.09.04)",
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
        "HOGP.ICS.p8.pdf  (2024.07.01)",
        "Back to the previous page"
    ],
    "To_SQA": load_to_sqa_files(),  # Dynamically load To_SQA files
    "Misc": [
        "stack_test_script.ptp",
        "Back to the previous page"
    ]
}

testSets = [
    "7_peripheral_ae_pa_20240924.json",
    "8_central_ae_sync_20240924.json",
    "9_central_peripheral_ae_pa_sync_20240924.json",
    "TCRL_2024_2_ANP_ANS_PXP.json",
    "TCRL_2024_2_IAS_LLS_TPS.json",
    "TCRL_2024_2_BAS.json",
    "TCRL_2024_2_DIS.json",
    "TCRL_2024_2_HIDS.json",
    "TCRL_2024_2_HOGP.json"
]
def getProfileConfig():
    # Specify the directory path
    directory_path = f'{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/ProfilesConfigs'
    
    # Initialize an empty list to store all test cases
    all_test_cases = []
    
    # Iterate over all files in the specified directory
    for filename in os.listdir(directory_path):
        if filename.endswith('.json'):
            file_path = os.path.join(directory_path, filename)
            with open(file_path, 'r') as json_file:
                data = json.load(json_file)
                # Extract the 'tc' field if it exists
                test_cases = data.get("tc", [])
                all_test_cases.extend(test_cases)
    
    # Write all test cases to a single file
    output_file_path = os.path.join(directory_path, 'ProfilesCases.txt')
    with open(output_file_path, 'w') as output_file:
        for case in all_test_cases:
            output_file.write(case + '\n')
    
    print(f"All test cases have been written to {output_file_path}")

def display_menu(items, title="Menu"):
    print(Fore.CYAN + Style.BRIGHT + f"\n{title}\n" + "="*len(title))
    for idx, item in enumerate(items):
        print(Fore.GREEN + f"{idx + 1}. {item}")
    choice = input(Fore.YELLOW + "Select item please: ")
    if choice.lower() == 'b':
        return len(items) - 1
    try:
        choice = int(choice)
        if 1 <= choice <= len(items):
            return choice - 1
        else:
            print(Fore.RED + "Invalid choice. ByeBye")
            exit()
    except ValueError:
        print(Fore.RED + "Invalid input. ByeBye")
        exit()

def delJson():
    directory_path = f'{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/ProfilesConfigs'
    # Initialize an empty list to store all test cases
    all_test_cases = []
    # Iterate over all files in the specified directory
    for filename in os.listdir(directory_path):
        if filename.endswith('.json'):
            file_path = os.path.join(directory_path, filename)
            with open(file_path, 'r') as json_file:
                data = json.load(json_file)
                # Extract the 'tc' field if it exists
                test_cases = data.get("tc", [])
                all_test_cases.extend(test_cases)

            # Delete the .json file after processing
            os.remove(file_path)

def selAuto():
    delJson()
    while True:
        print(Fore.MAGENTA + Style.BRIGHT + """
         █████╗ ██╗   ██╗████████╗ ██████╗     ██████╗ ████████╗███████╗ 
        ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ██╔══██╗╚══██╔══╝██╔════╝
        ███████║██║   ██║   ██║   ██║   ██║    ██████╔╝   ██║   ███████╗
        ██╔══██║██║   ██║   ██║   ██║   ██║    ██╔═══╝    ██║   ╚════██║
        ██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ██║        ██║   ███████║
        ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝     ╚═╝        ╚═╝   ╚══════╝
        """)
        SEL = display_menu(item_Auto, "Select AutoPTS Item")
        if SEL == len(item_Auto) - 1:
            break

        if os.path.isfile(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/pics.pts"):
            os.remove(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/pics.pts")
        subprocess.run([
            "cp",
            f"{BASE_PATH}/AutoPTS/Json/{item_Auto[SEL]}",
            f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/pics.pts"
        ])
        os.chdir(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/Function")
        subprocess.run(["cmd.exe", "/c", "python", "GeneratePtsConfig.py", "../pics.pts"])
        subprocess.run([
            "cp",
            f"{BASE_PATH}/AutoPTS/Json/{testSets[SEL]}",
            f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}/TestSet.json"
        ])
        getProfileConfig()
        
def selRunAutoPTS():
    while True:
        print(Fore.MAGENTA + Style.BRIGHT + """
        ██████╗ ██╗   ██╗███╗   ██╗     █████╗ ██╗   ██╗████████╗ ██████╗  ██████╗ ████████╗███████╗ 
        ██╔══██╗██║   ██║████╗  ██║    ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗ ██╔══██╗╚══██╔══╝██╔════╝
        ██████╔╝██║   ██║██╔██╗ ██║    ███████║██║   ██║   ██║   ██║   ██║ ██████╔╝   ██║   ███████╗
        ██╔══██╗██║   ██║██║╚██╗██║    ██╔══██║██║   ██║   ██║   ██║   ██║ ██╔═══╝    ██║   ╚════██║
        ██║  ██║╚██████╔╝██║ ╚████║    ██║  ██║╚██████╔╝   ██║   ╚██████╔╝ ██║        ██║   ███████║
        ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝  ╚═╝        ╚═╝   ╚══════╝
        """)
        SEL = display_menu(item_RunAutoPTS, "Select RunAutoPTS Item")
        if SEL == len(item_RunAutoPTS) - 1:
            break
        if SEL <= 1:
            os.chdir(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}")
            subprocess.run(item_RunAutoPTS[SEL], shell=True)
        elif SEL == 2:
            os.chdir(f"{BASE_PATH}/AutoPTS/{MidPath}/{MidPath}")
            subprocess.run(["cmd.exe", "/c", "python", "main.py"])

def selvimEdit():
    while True:
        print(Fore.MAGENTA + Style.BRIGHT + """
        ██╗   ██╗██╗███╗   ███╗
        ██║   ██║██║████╗ ████║
        ██║   ██║██║██╔████╔██║
        ██║   ██║██║██║╚██╔╝██║
        ╚██████╔╝██║██║ ╚═╝ ██║
         ╚═════╝ ╚═╝╚═╝     ╚═╝
        """)
        SEL = display_menu(item_vimEdit, "Select vimEdit Item")
        if SEL == len(item_vimEdit) - 1:
            break
        os.chdir(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}")
        cmd = f"{nv} {item_vimEdit[SEL]}"
        os.system(cmd)

def selFolder():
    while True:
        print(Fore.MAGENTA + Style.BRIGHT + """
        ███████╗ ██████╗ ██╗     ██████╗ ███████╗██████╗ 
        ██╔════╝██╔═══██╗██║     ██╔══██╗██╔════╝██╔══██╗
        █████╗  ██║   ██║██║     ██║  ██║█████╗  ██████╔╝
        ██╔══╝  ██║   ██║██║     ██║  ██║██╔══╝  ██╔══██╗
        ██║     ╚██████╔╝███████╗██████╔╝███████╗██║  ██║
        ╚═╝      ╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝
        """)
        SEL = display_menu(item_Folder, "Select Folder Item")
        if SEL == len(item_Folder) - 1:
            break
        os.chdir(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}")
        os.system(f'{nv} .')

def selApp():
    while True:
        print(Fore.MAGENTA + Style.BRIGHT + """
         █████╗ ██████╗ ██████╗ 
        ██╔══██╗██╔══██╗██╔══██╗
        ███████║██████╔╝██████╔╝
        ██╔══██║██╔═══╝ ██╔═══╝ 
        ██║  ██║██║     ██║     
        ╚═╝  ╚═╝╚═╝     ╚═╝     
        """)
        categories = list(item_App.keys()) + ["Back to the previous page"]
        category_choice = display_menu(categories, "Select App Item")
        if category_choice == len(categories) - 1:
            break
        selected_category = categories[category_choice]
        items = item_App[selected_category]

        while True:
            # Display the items with dates properly formatted
            formatted_items = [item.split('  ')[0] for item in items]
            SEL = display_menu(items, f"Select {selected_category} Item")
            if SEL == len(items) - 1:
                break
            os.chdir(BASE_PATH)
            subprocess.run(["cmd.exe", "/c", "start", formatted_items[SEL]])

def mainInit():
    os.chdir(f"{BASE_PATH}/AutoPTS/{AutoPath}/{AutoPath}")
    if os.path.isfile("TestSet_old.json"):
        os.remove("TestSet_old.json")

    print(Fore.MAGENTA + Style.BRIGHT + """
    ███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
    ████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
    ██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
    ██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
    ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
    """)

    while True:
        SEL = display_menu(index, "Main Menu")
        print(Fore.CYAN + f"Selected item #{SEL + 1} which means {index[SEL]}")
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
