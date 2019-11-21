---
title: "How to: Download and Import Publish Settings and Subscription Information"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7a45d42f-a80b-47cf-b1e6-4fcf968ebe24
caps.latest.revision: 8
---
# How to: Download and Import Publish Settings and Subscription Information
Before you start using the Microsoft Azure cmdlets to automate deployments, you must configure connectivity between the provisioning computer and Azure. This procedure describes how to do this by using the Azure PowerShell console. For information about how to configure the connectivity, see [How to install and configure Azure PowerShell](https://go.microsoft.com/fwlink/?LinkId=275578).  
  
### To download and import publish settings and subscription information  
  
1.  Sign in to the [Azure Management Portal](https://manage.windowsazure.com/).  
  
2.  Open the Azure PowerShell console as an administrator as follows:  
  
    1.  Choose **Start**, in the **Search** box, type **Azure PowerShell**.  
  
    2.  Right-click the **Azure PowerShell** link, and then choose **Run as administrator**.  
  
3.  At the command prompt, type the following command, and then press Enter.  
  
    ```  
    Get-AzurePublishSettingsFile  
    ```  
  
     A web browser opens at [https://go.microsoft.com/fwlink/?LinkID=294709](https://go.microsoft.com/fwlink/?LinkID=294709).  
  
4.  When prompted, download and save the publishing settings file as a .publishsettings type file to your computer.  
  
     The default file name format is *\[SubscriptionName\]-\[DownloadDate\]-credentials.publishsettings*.  
  
    > [!IMPORTANT]  
    >  Note of the path and file name because you will use it in the next step and later on when you deploy [!INCLUDE[navnow](includes/navnow_md.md)].  
  
5.  At the command prompt, type the following command to import the publish settings file.  
  
    ```  
    Import-AzurePublishSettingsFile [mypublishsettingsfile]  
    ```  
  
     Substitute `[mypublishsettings]` with the full path and file name of the publish settings file that you downloaded in the previous step. For example, if the file is in the *C:\\Users\\Administrator* folder and has the name *MyAzure-2-21-2013.publishsettings*, then you use the following command:  
  
    ```  
    Import-AzurePublishSettingsFile C:\Users\Administrator\MyAzure-2-21-2013.publishsettings  
    ```  
  
## See Also  
 [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Install the Microsoft Azure Cmdlets Module](How-to--Install-the-Microsoft-Azure-Cmdlets-Module.md)