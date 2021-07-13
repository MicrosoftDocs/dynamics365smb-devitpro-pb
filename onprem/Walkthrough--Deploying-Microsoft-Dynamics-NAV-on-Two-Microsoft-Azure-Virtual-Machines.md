---
title: "Walkthrough: Deploying Microsoft Dynamics NAV on Two Microsoft Azure Virtual Machines"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f9e96066-e260-4f41-a42e-0e9e8ce2994a
caps.latest.revision: 17
---
# Walkthrough: Deploying Microsoft Dynamics NAV on Two Microsoft Azure Virtual Machines
The following walkthrough demonstrates how to use the Example-2VM.ps1 script of the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] to deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure. The walkthrough deploys the [!INCLUDE[navnow](includes/navnow_md.md)] components, including the [!INCLUDE[demolong](includes/demolong_md.md)], on two virtual machines as illustrated in the following figure.  
  
 ![Network topology for Example&#45;2VM.ps1.](media/NAV_Azure_Example-2VM.png "NAV\_Azure\_Example-2VM")  
  
 When completed, you will have a new virtual machine on Azure with a fully functional [!INCLUDE[navnow](includes/navnow_md.md)] environment that gives users access to [!INCLUDE[navnow](includes/navnow_md.md)] data from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)]. Additionally, the virtual machine will have full development and administration capabilities including [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], [!INCLUDE[nav_admin](includes/nav_admin_md.md)], and [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
1.  [Start Windows PowerShell ISE](Walkthrough--Deploying-Microsoft-Dynamics-NAV-on-a-Microsoft-Azure-Virtual-Machine.md#StartPowerShell)  
  
2.  [Modifying the Set-PartnerSettings File](Walkthrough--Deploying-Microsoft-Dynamics-NAV-on-a-Microsoft-Azure-Virtual-Machine.md#ModSetPartnerSettings)  
  
3.  [Running the Example-1VM Script](Walkthrough--Deploying-Microsoft-Dynamics-NAV-on-a-Microsoft-Azure-Virtual-Machine.md#RunExampleScript)  
  
4.  [Opening the Microsoft Dynamics NAV Clients](Walkthrough--Deploying-Microsoft-Dynamics-NAV-on-a-Microsoft-Azure-Virtual-Machine.md#OpenRTCs)  
  
 This walkthrough sets up a [!INCLUDE[navnow](includes/navnow_md.md)] environment on Azure that has the following characteristics.  
  
|Item|Value|  
|----------|-----------|  
|Name of Azure virtual machine running [!INCLUDE[nav_server](includes/nav_server_md.md)]|MyNavServerVM|  
|Domain name|.cloudapp.net<br /><br /> This value is combined with the Azure virtual machine name so that the fully qualified domain name of the virtual machine becomes *MyNavServerVM.cloudapp.net*.|  
|Administrator account on Azure virtual running [!INCLUDE[nav_server](includes/nav_server_md.md)]|User name: NavVmAdmin<br /><br /> Password: This walkthrough uses an automatically generated password.|  
|Name of Azure virtual machine running SQL Server|MyNavSQLVM|  
|Administrator account on Azure virtual running SQL Server|User name: NavSqlAdmin<br /><br /> Password: This walkthrough uses an automatically generated password. **Important:**  If you are using a custom image to create the virtual machine, then the user name must match the administrator account user name that was specified when the custom image was created. For more information, see [How to: Create a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md).|  
|Azure region|North Europe|  
|Virtual machine size|Small|  
|Azure virtual network|MyNavVirtualNetwork|  
|Azure affinity group|MyNavAffinity|  
|User authentication credential type|NavUserPassword|  
|[!INCLUDE[nav_server](includes/nav_server_md.md)] Service account|User name: NSTService<br /><br /> Password: This walkthrough uses an automatically generated password.|  
|[!INCLUDE[navnow](includes/navnow_md.md)] user with SUPER permissions|User name: navuser<br /><br /> Password: This walkthrough uses an automatically generated password.|  
|Client services port|9001|  
|SOAP services port|9002|  
|OData services port|9003|  
|ClickOnce website port|9004|  
|[!INCLUDE[navnow](includes/navnow_md.md)] company name|MyCompany<br /><br /> This walkthrough restores data for the **CRONUS International Ltd.** company from a [!INCLUDE[navnow](includes/navnow_md.md)] database backup file, and then renames the company to *MyCompany*.|  
|Language setting on the [!INCLUDE[navnow](includes/navnow_md.md)] Web Server|en-US|  
|Region format setting on the [!INCLUDE[navnow](includes/navnow_md.md)] Web Server|en-US|  
  
## Prerequisites  
 Install the prerequisites that are described in [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  
  
 The following table includes information about the prerequisites that are used to complete this walkthrough.  
  
|Item|Information|  
|----------|-----------------|  
|PublishSettings file|C:\\Users\\Administrator\\MyAzure-2-21-2013.publishsettings|  
|Azure subscription name|MyAzureSubscription|  
|Azure storage account|MyAzureStorage|  
|Image for **NAV Server** virtual machine|This walkthrough will use the latest version of a supported image from the Azure Image Gallery. You do not have to do anything to meet this prerequisite.|  
|Image for **SQL Server** virtual machine|This walkthrough will use the latest version of a supported image from the Azure Image Gallery. You do not have to do anything to meet this prerequisite. **Note:**  This is the default image that is set in the Set-PartnerSettings.ps1 file.|  
|[!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\) location|D:\\NAVDVD|  
|[!INCLUDE[navnow](includes/navnow_md.md)] database backup file location|D:\\NAVDVD\\SQLDemoDatabase\\CommonAppData\\Microsoft\\Microsoft Dynamics NAV\\72\\Database\\Demo Database NAV \(7-2\).bak|  
|[!INCLUDE[navnow](includes/navnow_md.md)] license|D:\\NAVDVD\\SQLDemoDatabase\\CommonAppData\\Microsoft\\Microsoft Dynamics NAV\\72\\Database\\Cronus.flf|  
|[!INCLUDE[navnow](includes/navnow_md.md)] provisioning tools location|C:\\Cloud<br /><br /> The [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] are included in the WindowsPowerShellScripts\\Cloud folder on [!INCLUDE[navnow](includes/navnow_md.md)] installation media. For this walkthrough, you copy the Cloud folder and its content to the C: drive. The Example-2VM.ps1 script and Set-PartnerSettings file that are used in the walkthrough are in the Cloud\\HowTo folder.|  
|Security certificate PFX file location and password for [!INCLUDE[navnow](includes/navnow_md.md)] services|Folder: C:\\Cloud\\HowTo\\MyAzureVM.pfx<br /><br /> Password: pfxpassword|  
|Security certificate PFX file and password for the [!INCLUDE[nav_web](includes/nav_web_md.md)]|This walkthrough uses the security certificate that is automatically generated by the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)]. No action is required for this prerequisite.|  
|Security certificate PFX file location and password for ClickOnce|Folder: C:\\Cloud\\HowTo\\ClickOnceSignature.pfx<br /><br /> Password: clickoncesignaturepassword|  
|Azure Libraries location|C:\\ProgramFiles\(x86\)\\Microsoft SDKs\\Microsoft Azure\\PowerShell\\Azure\\Azure.psd1|  
|Microsoft Windows HTTP Services Certificate Configuration Tool|C:\\ProgramFiles\(x86\)\\Windows Resource Kits\\Tools\\winhttpcertcfg.exe|  
|Manifest Generation and Editing Tool \(mage.exe\)|C:\\ProgramFiles\(x86\)\\Microsoft SDKs\\Windows\\v8.0A\\bin\\NETFX 4.0 Tools\\mage.exe|  
|makecert.exe|C:\\ProgramFiles\(x86\)\\Windows Kits\\8.0\\bin\\x86\\makecert.exe'|  
  
##  <a name="StartPowerShell"></a> Start Windows PowerShell ISE  
 To deploy [!INCLUDE[navnow](includes/navnow_md.md)], you will run Windows PowerShell scripts. The procedures in this section use Windows PowerShell Integrated Scripting Environment \(ISE\) because it enables you to run commands, and write and debug scripts in a single graphical user interface.  
  
> [!IMPORTANT]  
>  You must run Windows PowerShell ISE as an Administrator; otherwise the scripts will not run without errors.  
  
#### To start Windows PowerShell ISE  
  
1.  On the provisioning computer, choose **Start**, and then search for Windows PowerShell ISE.  
  
2.  Right-click the **Windows PowerShell ISE** item, and then choose **Run as Administrator**.  
  
3.  At the command prompt, change to the Cloud\\HowTo folder of the provisioning tools.  
  
     For example, enter the following code, and then press Enter:  
  
    ```  
    cd C:\Cloud\HowTo  
    ```  
  
##  <a name="ModSetPartnerSettings"></a> Modifying the Set-PartnerSettings File  
 The [!INCLUDE[navnow](includes/navnow_md.md)] provisioning tools include the Set-PartnerSettings.ps1 script. The Set-PartnerSettings.ps1 script contains parameters that are used by the Example-2VM.ps1 file to configure the [!INCLUDE[navnow](includes/navnow_md.md)] deployment. In this procedure, you will create a copy of the Set-PartnerSettings.ps1 file, and then modify the copy to include the settings for your installation. You can modify Set-PartnerSetting.ps1 directly, but using a copy enables you to test different parameter values without having to change the Set-PartnerSettings.ps1 every time.  
  
#### To make a copy of the Set-PartnerSettings.ps1 file  
  
1.  In Windows PowerShell ISE, on the **File** menu, choose **Open**, and then find and open the Set-PartnerSettings.ps1 file.  
  
     The file is located in the Cloud\\Howto folder.  
  
2.  From the **File** menu, choose **Save As**.  
  
3.  Save the file in the same folder as the Set-PartnerSettings.ps1 and give it the name **Set-PartnerSettings-CUSTOM.ps1**.  
  
     Because you save it in the same folder as Set-PartnerSettings.ps1, the Set-PartnerSettings-CUSTOM.ps1 is automatically loaded by the Example-2VM.ps1 script.  
  
    > [!NOTE]  
    >  By default, the example scripts search the *Cloud\\HowTo* folder for files that contain the text "custom", so it is important that only one custom settings file is included in the folder when you run the scripts.  
  
#### To modify the Set-PartnerSettings-Custom.ps1 file  
  
1.  In the Set-PartnerSettings-Custom.ps1 file, and locate the **Azure subscription settings** section.  
  
     The parameters in this section configure Azure subscription settings.  
  
2.  By default, all parameters are commented lines that are preceded by `# TODO`. To set a parameter, delete the `# TODO`, and then provide a value for the parameter.  
  
     Start with the following line that specifies the PublishSettings file for the Azure subscription:  
  
    ```  
    # TODO: $NAV_PublishSettingsFile = 'C:\users\administrator\MySubscription.PublishSettings'  
    ```  
  
     To set the parameter for this walkthrough, change the code to the following:  
  
    ```  
    $NAV_PublishSettingsFile = 'C:\users\administrator\MyAzure-2-21-2013.publishsettings'  
    ```  
  
     You change all parameters in this manner  
  
    > [!TIP]  
    >  For a detailed description about a parameter, see the help text that comes before the parameter in the script.  
  
3.  Change the remaining parameters in this section as follows:  
  
    ```  
    $NAV_AzureSubscriptionName = 'MyAzureSubscription'  
    $NAV_AzureStorageAccount = 'MyAzureStorage'  
    ```  
  
4.  Go to the **Azure virtual machine settings** section to specify parameters for the virtual that will be created on Azure. Set the parameters as follows:  
  
    ```  
    $NAV_AzureServiceName = 'MyNavServerVm'  
    $NAV_DomainName = 'cloudapp.net'  
    $NAV_VMAdminUserName = 'NavVmAdmin'  
    $NAV_VMAdminPassword = ''  
    $NAV_AzureLocation = 'North Europe'  
    $NAV_VMSize = 'Small'  
    $NAV_OSImageWithSqlServer = ''  
    $NAV_OSImageWithoutSqlServer = ''  
    ```  
  
     Because you do not provide a value for the *$NAV\_VMAdminPassword* setting, the script will generate a password automatically. You will see the password in the message that appears when the script has completed.  
  
     Because you do not provide a value for the *$NAV\_OSImageWithSqlServer* and *$NAV\_OSImageWithoutSqlServer* settings, the script will use the latest version of a supported image from the Azure Gallery.  
  
5.  Go to the **2-Box NAV Deployment settings** section to specify parameters that configure the virtual machine that will run SQL Server and the [!INCLUDE[navnow](includes/navnow_md.md)] database. Set the parameters as follows:  
  
    ```  
    $NAV_SqlServerMachine = 'MyNavSQLVM'  
    $NAV_SqlServerMachineAdminUserName = 'NavSqlAdmin'  
    $NAV_SqlServerMachineAdminPassword = ''  
    $NAV_AzureVirtualNetwork = 'MyNavVirtualNetwork'  
    $NAV_AzureAffinityGroup = ' MyNavAffinity'  
  
    ```  
  
     Because you do not provide a value for the *$NAV\_SqlServerMachineAdminPassword* setting, the script will generate a password automatically. You will see the password in the message that appears when the script has completed.  
  
6.  Go to the **Microsoft Dynamics NAV installation settings** section to specify parameters that install [!INCLUDE[navnow](includes/navnow_md.md)] on the virtual machine. Set the parameters as follows:  
  
    ```  
    $NAV_DvdLocation = 'D:\NAVDVD'   
    $NAV_UseAzureStorageForDvdTransfer = $true  
    $NAV_DvdVhdName = "$NAV_AzureServiceName-DynamicsNAVDvd.vhd"  
    $NAV_BakFile = 'D:\NAVDVD\SQLDemoDatabase\CommonAppData\Microsoft\Microsoft Dynamics NAV\72\Database\Demo Database NAV (7-2).bak'  
    $NAV_DatabaseDiskSizeInGB = 10  
    $NAV_RemoteDatabaseBackupFile = 'C:\REMOTE\navdvd\SQLDemoDatabase\CommonAppData\Microsoft\Microsoft Dynamics NAV\72\Database\Demo Database NAV (7-2).bak'  
    ```  
  
7.  Go to the **Microsoft Dynamics NAV Instance settings** section to specify parameters for that configure [!INCLUDE[nav_server](includes/nav_server_md.md)]. Set the parameters as follows:  
  
    ```  
    $NAV_InstanceName = 'DynamicsNAV72_Instance1'  
    $NAV_InstanceNameInternal = 'Inst1'  
    $NAV_ManagementServicesPort = 9000  
    $NAV_ClientServicesPort = 9001  
    $NAV_SOAPServicesPort = 9002  
    $NAV_ODataServicesPort = 9003  
    $NAV_ClickOnceWebSitePort = 9004  
    $NAV_WindowsServiceAccount = 'NSTService'  
    $NAV_WindowsServiceAccountPassword = ''  
    $NAV_NAVAdminUserName = 'navadmin'  
    $NAV_NAVAdminPassword = ''  
    $NAV_LicenseFile = 'D:\NAVDVD\SQLDemoDatabase\CommonAppData\Microsoft\Microsoft Dynamics NAV\72\Database\Cronus.flf'  
    $NAV_ExistingCompanyFromBackup = 'CRONUS International Ltd.'  
    $NAV_NewCompanyName = 'MyCompany  
    $NAV_WebServerLanguage = 'en-US'  
    $NAV_WebServerRegionFormat = 'en-US'  
    ```  
  
     Because you do not provide a values for the *$NAV\_WindowsServiceAccountPassword* and *$NAV\_NAVAdminPassword* settings, the script will generate passwords automatically. You will see the passwords in the message that appears when the script has completed.  
  
8.  Go to the **Security Certificates for NAV Client Services settings** section to specify parameters that configure security certificates for the clients and ClickOnce installation of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Set the parameters as follows:  
  
    ```  
    $NAV_ClientServicesPfxFile = 'C:\Cloud\HowTo\MyAzureVM.pfx'  
    $NAV_HttpsWebClientPfxFile = ""  
    $NAV_HttpsWebClientPfxPassword = ""  
    $NAV_ClientServicesPfxPassword = "pfxpassword"  
    $NAV_ClickOnceCodeSigningPfxFile = 'C:\Cloud\HowTo\ClickOnceSignature.pfx'   
    $NAV_ClickOnceCodeSigningPfxPassword = 'clickoncesignaturepassword'  
    ```  
  
9. Go to the **Tool dependencies** section to specify parameters that are required for the deployment.  
  
    ```  
    $Global:AzurePowershellModuleFile = Join-Path ${env:ProgramFiles(x86)} 'Microsoft SDKs\Microsoft Azure\PowerShell\Azure\Azure.psd1'  
    $Global:MageExeFile = Join-Path ${env:ProgramFiles(x86)} 'Microsoft SDKs\Windows\v8.0A\bin\NETFX 4.0 Tools\mage.exe'  
    $Global:WinHttpCertCfgExeFile = Join-Path ${env:ProgramFiles(x86)} 'Windows Resource Kits\Tools\winhttpcertcfg.exe'  
    $Global:MakeCertExeFile = Join-Path ${env:ProgramFiles(x86)} 'Windows Kits\8.0\bin\x86\makecert.exe'  
  
    ```  
  
10. Save the file.  
  
     You are ready to run the script.  
  
##  <a name="RunExampleScript"></a> Running the Example\_2VM script  
 After you have set the parameters in the Set-PartnerSettings-Custom.ps1 file, you can run the script to create the virtual machine on Azure and deploy [!INCLUDE[navnow](includes/navnow_md.md)].  
  
#### To run the example script  
  
1.  In the Windows PowerShell ISE, open the Example-2VM.ps1  
  
     The script is located in the Cloud\\HowTo directory.  
  
2.  Press F5 to run the script.  
  
     It will take approximately 30-45 minutes for the script to complete. If the script completes without errors, then text similar to the following appears in the console:  
  
    ```  
    The NAV Server virtual machine is: MyNavVm.cloudapp.net  
    The NAV Server virtual machine administrator username: NSTService  
    The NAV Server virtual machine administrator password: [password]  
    The NAV Server Instance is: DynamicsNAV72_Ins1  
    The NAV Server account credentials: NSTService/[password]  
    The SQL Server machine is: NavSqlAdmin.cloudapp.net  
    The SQL Server machine administrator password: [password]  
    The Windows Client can be downloaded via ClickOnce at: https://MyNavVm.cloudapp.net:9004  
    The Web Client can be accessed at: https://MyNavVm.cloudapp.net/DynamicsNAV72_Ins1  
    A user has been added to the database with the following credentials:  
      user=navuser  
      password=[password]  
  
    ```  
  
     Two new virtual machines are added on Azure. To see the new virtual machine, sign in to the [Microsoft Azure Management Portal](https://manage.windowsazure.com/), and then choose **VIRTUAL MACHINES**.  
  
##  <a name="OpenRTCs"></a> Opening the RoleTailored Clients  
 When the script has completed with no errors, you can then access the [!INCLUDE[rtc](includes/rtc_md.md)]s.  
  
#### To open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
1.  Open an internet browser.  
  
2.  In the address, type the following address:  
  
     **https://MyNavVm.cloudapp.net:9004**  
  
3.  Follow the instructions on the webpage to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To open the [!INCLUDE[nav_web](includes/nav_web_md.md)]  
  
1.  Open an internet browser.  
  
2.  In the address, type the following address:  
  
     **https://MyNavVm.cloudapp.net/DynamicsNAV72\_Instance1**  
  
## Next Steps  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)  
  
 [Security and Protection for Microsoft Dynamics NAV on Microsoft Azure](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)  
  
## See Also  
 [Planning and Preparing](Planning-and-Preparing.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md)   
 [Walkthrough: Deploying Microsoft Dynamics NAV on a Microsoft Azure Virtual Machine](Walkthrough--Deploying-Microsoft-Dynamics-NAV-on-a-Microsoft-Azure-Virtual-Machine.md)