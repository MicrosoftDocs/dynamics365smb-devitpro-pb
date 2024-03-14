---
title: "How to: Install Control Add-Ins and Support Files for Your Solution"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: ced668d6-5e2c-4355-813a-4041060cf25f
ms.author: jswymer
---
# How to: Install Control Add-Ins and Support Files for Your Solution
If the [!INCLUDE[navnow](includes/navnow_md.md)] application that you are deploying on Microsoft Azure includes control add-ins or additional files that will run on the [!INCLUDE[nav_server](includes/nav_server_md.md)], then you must first install these files to the Azure virtual machine. To accomplish this, you customize the HowTo-UploadFilesToVM.ps1 script that is available with the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)]. If you are using the example end-to-end scripts Example-1VM and Example-2VM to deploy [!INCLUDE[navnow](includes/navnow_md.md)], perform the following procedure before you run the scripts.  

### To install control add-ins to the Azure virtual machine  

1.  Place the control add-in assembly \(.dll\) or support files on your provisioning computer.  

2.  Open the HowTo-UploadFilesToVM.ps1 script for editing.  

     The script is located in the Cloud\\NAVRemoteAdministration folder of the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)].  

3.  Locate the following command:  

    ```  
    # Copy-FileToRemoteMachine -SourceFile 'C:\MyAddin.dll' -DestinationFile 'navnow_install\Service\Add-ins\MyAddin\MyAddin.dll' -Session $psSession  
    ```  

4.  Do the following:  

    1.  Remove the comment character `#`.  

    2.  Change the value of *C:\\MyAddin.dll* to the path and name of the control add-in or support file that you want to deploy on the Azure virtual machine.  

    3.  Change the value of *MyAddin\\MyAddin.dll* to the folder and name of the control add-in on the Azure virtual machine.  

        > [!NOTE]  
        >  The [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Add-ins\\ folder is the default folder for control add-ins on the virtual machine that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

    4.  Add the command for each additional file that you want to upload.  

5.  Save the HowTo-UploadFilesToVM.ps1 script.  

## See Also  
 [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Extending Microsoft Dynamics NAV Using Control Add-ins](Extending-Microsoft-Dynamics-NAV-Using-Control-Add-ins.md)
