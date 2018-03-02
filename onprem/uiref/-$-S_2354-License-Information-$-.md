---
title: "License Information"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ee25a540-338d-483a-9a54-cf9e2dc32db9
caps.latest.revision: 12
manager: edupont
---
# License Information
Shows the contents of the current license file. The information includes the license number, the name of the license owner, which application granules are included, and when the license expires. Typically, your serial number and the name of your company appear in the window. If your license file is not is shown in the window, then you must upload your own file by choosing the **Upload** button.  

 You generally do not have to use the **License Information** window. However, if you want to make any modifications or if you have problems with your license file, then you may have to open it.  

 To open this window, on the **Tools** menu, choose **License Information**.  

> [!NOTE]  
>  All license files that are not [!INCLUDE[demoname](../includes/demoname_md.md)] demonstration license files have the same name, which is fin.flf. After you have received your license file and imported it, you should store the disk that contains the file in a safe location until you need it again. The [!INCLUDE[demo](../includes/demo_md.md)] demonstration license file is saved under a different name, which is cronus.flf, so that you cannot overwrite it with your own license file.  

## Buttons  
 The following table shows the buttons in the **License Information** window.  

|Button|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|**Upload**|Uploads your license file to the SQL Server that you want to access. The license information will be used by all client computers that connect to this server unless a database license file is being used.|  
|**Change**|Allows for a temporary change to a license file. This function ensures that the change is not saved the next time that you start the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)], and your old license file is used. Use this function if you want to use the cronus.flf [!INCLUDE[demo](../includes/demo_md.md)] demonstration license file and not overwrite your own license file.<br /><br /> You will receive a warning message before your license expires. If you allow the license on the server to expire, then you cannot access the server. However, you can use the **Change** function to access the server by using an alternate license file.|  

## See Also  
 [How to: Upload the License File](../How-to--Upload-the-License-File.md)   
 [Properties of the Demo License](../Properties-of-the-Demo-License.md)   
 [Administration in the Development Environment](../Administration-in-the-Development-Environment.md)
