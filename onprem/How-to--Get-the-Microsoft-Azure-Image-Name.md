---
title: "How to: Get the Microsoft Azure Image Name"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 81172ef7-24b4-44f0-8fa2-5a00ed960fb9
caps.latest.revision: 4
---
# How to: Get the Microsoft Azure Image Name
This topic describes how to get the name of the Microsoft Azure Marketplace image. When you use the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] to deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure, you must provide the image name in the Set-PartnerSetting file or Set-PartnerSettings-Custom file.  
  
> [!NOTE]  
>  The name that appears for an image in the Azure Marketplace is a user-friendly label and not necessarily the same as the image name that is required in the Set-PartnerSetting file or Set-PartnerSettings-Custom file.  
  
### To get the Azure image name  
  
1.  Sign in to the [Azure Management Portal](https://manage.windowsazure.com/).  
  
2.  Choose **VIRTUAL MACHINES**, choose **NEW**, and then choose **FROM GALLERY**.  
  
3.  On the **Select the virtual machine operating system** page, locate the image that you want to use.  
  
4.  Note the name of the image.  
  
     This is the label that is assigned to the image.  
  
5.  Start Azure PowerShell.  
  
6.  At the command prompt, type the following command:  
  
    ```  
    ( Get-AzureVMImage | where-object { $_.Label -like "<ImageLabel>*" } )  
  
    ```  
  
     Replace `<ImageLabel>` with the image label that you identified in step 3.  
  
     For example, if the image label is Windows Server 2012, then type the following code:  
  
    ```  
    ( Get-AzureVMImage | where-object { $_.Label -like "Windows Server 2012*" } )  
    ```  
  
7.  Press Enter to run the command.  
  
     The command returns a list of images that match the image label that you provided. An image can have several versions. You will typically use the latest version.  
  
8.  Locate the image that you want to use from the list, and then note the text string that is next to `ImageName:` parameter.  
  
     This specifies the image name that you must provide in the Set-PartnerSetting file or Set-PartnerSettings-Custom file.  
  
## See Also  
 [Modifying the Parameter Settings](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md#SetSettings)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)   
 [Preparing a Microsoft Azure Virtual Machine Image for Microsoft Dynamics NAV](Preparing-a-Microsoft-Azure-Virtual-Machine-Image-for-Microsoft-Dynamics-NAV.md)