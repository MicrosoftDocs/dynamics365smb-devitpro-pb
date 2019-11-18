---
title: "How to: Deploy Microsoft Dynamics NAV on Microsoft Azure by Using the Example Scripts"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 64f54243-c168-4f02-8de2-a3f663a3b437
caps.latest.revision: 13
---
# How to: Deploy Microsoft Dynamics NAV on Microsoft Azure by Using the Example Scripts
This topic describes how to deploy [!INCLUDE[navnow](includes/navnow_md.md)] by using the Example-1VM.ps1 and Example-2VM.ps1 scripts that are available with the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)]. The scripts deploy [!INCLUDE[navnow](includes/navnow_md.md)] in different network topologies. For more information, see [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md).  
  
 To deploy [!INCLUDE[navnow](includes/navnow_md.md)] by using the scripts, you must follow the steps as described in this topic:  
  
 [Modifying the Parameter Settings](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md#SetSettings)  
  
 [Running the Example Scripts](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md#RunScripts)  
  
##  <a name="SetSettings"></a> Modifying the Parameter Settings  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] include the Set-PartnerSettings.ps1 script, which by default is located in the WindowsPowerShellScripts\\Cloud\\HowTo folder on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\). The Set-PartnerSettings.ps1 script contains parameters that are used by the -1VM.ps1 and Example-2VM.ps1 scripts to configure the [!INCLUDE[navnow](includes/navnow_md.md)] deployment. For example, the Set-PartnerSettings.ps1 file contains parameters that specify the Microsoft Azure subscription, [!INCLUDE[navnow](includes/navnow_md.md)] DVD location, security certificates, and more. Before you run the Example-1VM.ps1 or Example-2VM.ps1 script, you must modify Set-PartnerSettings.ps1 to provide values for all the parameters.  
  
 There are two ways to modify the parameters. You can modify the Set-PartnerSettings.ps1 file directly, or you can create a copy of the Set-PartnerSettings.ps1 file, and then modify the copy. Creating a copy of the Set-PartnerSettings.ps1 file is the preferred method, especially in a testing environment, because it enables testers to specify and save different parameter values without having to change the Set-PartnerSettings.ps1 every time.  
  
> [!NOTE]  
>  The procedures in this section use Windows PowerShell Integrated Scripting Environment \(ISE\) because if its script running, writing, and debugging capabilities. You can use Windows PowerShell if you prefer.  
  
#### To configure the parameters in the Set-PartnerSettings File  
  
1.  If you have not already done this, prepare for the deployment.  
  
     For more information, see [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  
  
2.  On the computer that you will use to provision [!INCLUDE[navnow](includes/navnow_md.md)] on Azure, run the Windows PowerShell environment as Administrator.  
  
    > [!IMPORTANT]  
    >  You must run Windows PowerShell ISE or Windows PowerShell as an Administrator; otherwise the scripts will not execute correctly.  
  
3.  At the command prompt, change to the *Cloud\\HowTo* folder of the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)]. For example, enter the code:  
  
    ```  
    cd <rootdrive>:\Cloud\HowTo  
    ```  
  
     Substitute `<rootdrive>` with the drive letter on your computer.  
  
4.  On the **File** menu, open the Set-PartnerSettings.ps1 file.  
  
     The script is located in the *HowTo* directory.  
  
5.  To create a copy of the Set-PartnerSettings.ps1 file for editing, do the following:  
  
    1.  On the **File** menu, choose **Save As**.  
  
    2.  Save the file in the same folder as the Set-PartnerSettings.ps1 and give it the name **Set-PartnerSettings-CUSTOM.ps1**.  
  
         Because you save it in the same folder as Set-PartnerSettings.ps1, the Set-PartnerSettings-CUSTOM.ps1 is automatically loaded by the example scripts.  
  
        > [!NOTE]  
        >  By default, the example scripts search the *Cloud\\HowTo* folder for files that contain the text "custom" in the file name, so it is important that only one custom settings file is included in the folder when you run the scripts.  
  
6.  Open **Set-PartnerSettings-CUSTOM.ps1**, and then set the parameters as follows.  
  
     By default, parameters are commented lines that are preceded by `# TODO`.  
  
     To set a parameter, delete the `# TODO`, and then provide a value for the parameter. For example, the following line of code contains the parameter that specifies the Azure service name, which in turn becomes the virtual machine name:  
  
    ```  
    # TODO: $NAV_AzureServiceName = 'MyService'  
    ```  
  
     To set this parameter to `MyCompanyVM`, you would change the code to the following:  
  
    ```  
    $NAV_AzureServiceName = 'MyCompanyVM'  
  
    ```  
  
    > [!NOTE]  
    >  To understand the parameters, use the help content that is provided above each parameter in the script.  
  
7.  When you have set all the parameters, save the file, and then proceed to the next task.  
  
##  <a name="RunScripts"></a> Running the Example Scripts  
 After you have modified the partner settings, you can run the example scripts to deploy [!INCLUDE[navnow](includes/navnow_md.md)].  
  
#### To run the example script  
  
1.  In the Windows PowerShell ISE, open the Example-1VM.ps1 or Example-2VM.ps1 file.  
  
     The scripts are located in the Cloud\\HowTo folder of the provisioning tools.  
  
2.  Press F5 to run the script.  
  
     It will take approximately 30-45 minutes for the script to be completed. If the script is completed without errors, then text similar to the following appears in the console:  
  
    ```  
    The NAV Server machine is: MyNavVm.cloudapp.net  
    The NAV Server machine administrator password: 123NavVm!a  
    The NAV Server Instance is: nav_server_instance_Ins1  
    The NAV Server account credentials: NSTService/P@ssword312  
    The Windows client can be downloaded via ClickOnce at: https://MyNavVm.cloudapp.net:9004  
    The Web Client can be accessed at: https://MyNavVm.cloudapp.net/nav_server_instance_Ins1  
    A user has been added to the database with the following credentials:  
      user=navuser  
      password=N@Vpw312  
    ```  
  
     New virtual machines appear in the Azure management portal under Virtual Machines, and you can access [!INCLUDE[navnow](includes/navnow_md.md)] from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [How to: Open Microsoft Dynamics NAV Clients that Connect to Microsoft Dynamics NAV on Microsoft Azure](How-to--Open-Microsoft-Dynamics-NAV-Clients-that-Connect-to-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  
  
## See Also  
 [How to: Install the Microsoft Dynamics NAV Provisioning Tools for Microsoft Azure](How-to--Install-the-Microsoft-Dynamics-NAV-Provisioning-Tools-for-Microsoft-Azure.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md)   
 [Deploying Microsoft Dynamics NAV on One Virtual Machine Using Example-1VM Script](Deploying-Microsoft-Dynamics-NAV-on-One-Virtual-Machine-Using-Example-1VM-Script.md)   
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [How to: Get the Microsoft Azure Image Name](How-to--Get-the-Microsoft-Azure-Image-Name.md)