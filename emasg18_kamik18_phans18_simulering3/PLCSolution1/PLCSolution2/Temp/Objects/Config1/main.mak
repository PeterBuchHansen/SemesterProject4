SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\Razer\ChromaBroadcast\bin;C:\Program Files\Razer\ChromaBroadcast\bin;C:\Program Files\MATLAB\R2020a\bin;C:\Program Files\MATLAB\R2019b\bin;C:\Program Files (x86)\Razer Chroma SDK\bin;C:\Program Files\Razer Chroma SDK\bin;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Users\emila\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\Users\emila\AppData\Local\Microsoft\WindowsApps;C:\lib\install\bin;C:\Program Files\dotnet\;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\emila\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\emila\AppData\Local\GitHubDesktop\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\emila\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\emila\AppData\Local\GitHubDesktop\bin
export AS_BUILD_MODE := Rebuild
export AS_VERSION := 4.7.2.98
export AS_COMPANY_NAME :=  
export AS_USER_NAME := Emil
export AS_PATH := C:/BrAutomation/AS47
export AS_BIN_PATH := C:/BrAutomation/AS47/Bin-en
export AS_PROJECT_PATH := C:/Users/emila/Documents/Diplomingeniør\ lokal/GitHubDesktop/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2
export AS_PROJECT_NAME := PLCSolution2
export AS_SYSTEM_PATH := C:/BrAutomation/AS/System
export AS_VC_PATH := C:/BrAutomation/AS47/AS/VC
export AS_TEMP_PATH := C:/Users/emila/Documents/Diplomingeniør\ lokal/GitHubDesktop/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2/Temp
export AS_CONFIGURATION := Config1
export AS_BINARIES_PATH := C:/Users/emila/Documents/Diplomingeniør\ lokal/GitHubDesktop/SemesterProject4/emasg18_kamik18_phans18_simulering3/PLCSolution1/PLCSolution2/Binaries
export AS_GNU_INST_PATH := C:/BrAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BrAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := C:/BrAutomation/AS47
export WIN32_AS_PATH := "C:\BrAutomation\AS47"
export WIN32_AS_BIN_PATH := "C:\BrAutomation\AS47\Bin-en"
export WIN32_AS_PROJECT_PATH := "C:\Users\emila\Documents\Diplomingeniør lokal\GitHubDesktop\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2"
export WIN32_AS_SYSTEM_PATH := "C:\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\BrAutomation\AS47\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\Users\emila\Documents\Diplomingeniør lokal\GitHubDesktop\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2\Temp"
export WIN32_AS_BINARIES_PATH := "C:\Users\emila\Documents\Diplomingeniør lokal\GitHubDesktop\SemesterProject4\emasg18_kamik18_phans18_simulering3\PLCSolution1\PLCSolution2\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\BrAutomation\AS47\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "C:\BrAutomation\AS47"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/PLCSolution2.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'Rebuild'   

