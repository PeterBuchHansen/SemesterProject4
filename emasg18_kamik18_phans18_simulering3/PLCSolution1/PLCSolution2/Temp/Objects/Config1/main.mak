SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\Intel\iCLS Client\;C:\Program Files\Intel\iCLS Client\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files\Intel\Intel(R) Management Engine Components\IPT;C:\Program Files (x86)\Schneider Electric\Machine Expert Installer\;C:\Program Files (x86)\Schneider Electric\SoMachine Software\Tools\ConfigurationManager\;C:\Users\Bruger\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\Bruger\AppData\Local\GitHubDesktop\bin;C:\Users\Bruger\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Intel\WiFi\bin\;C:\Program Files\Common Files\Intel\WirelessCommon\;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\Bruger\AppData\Local\GitHubDesktop\bin
export AS_BUILD_MODE := BuildAndTransfer
export AS_VERSION := 4.7.2.98
export AS_COMPANY_NAME :=  
export AS_USER_NAME := Bruger
export AS_PATH := C:/BrAutomation/AS47
export AS_BIN_PATH := C:/BrAutomation/AS47/bin-en
export AS_PROJECT_PATH := C:/Users/Bruger/Documents/GitHub/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2
export AS_PROJECT_NAME := PLCSolution2
export AS_SYSTEM_PATH := C:/BrAutomation/AS/System
export AS_VC_PATH := C:/BrAutomation/AS47/AS/VC
export AS_TEMP_PATH := C:/Users/Bruger/Documents/GitHub/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := C:/Users/Bruger/Documents/GitHub/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2/Binaries
export AS_GNU_INST_PATH := C:/BrAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BrAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := C:/BrAutomation/AS47
export WIN32_AS_PATH := "C:\BrAutomation\AS47"
export WIN32_AS_BIN_PATH := "C:\BrAutomation\AS47\bin-en"
export WIN32_AS_PROJECT_PATH := "C:\Users\Bruger\Documents\GitHub\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2"
export WIN32_AS_SYSTEM_PATH := "C:\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\BrAutomation\AS47\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\Users\Bruger\Documents\GitHub\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2\Temp"
export WIN32_AS_BINARIES_PATH := "C:\Users\Bruger\Documents\GitHub\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\BrAutomation\AS47\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "C:\BrAutomation\AS47"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/PLCSolution2.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'BuildAndTransfer'   

