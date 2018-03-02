---
title: "Options"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ecc5ba6a-772d-4d2f-9b2e-4fdbb4a7b029
caps.latest.revision: 20
manager: edupont
---
# Options
Specifies the system setup options for the current database.  

 To open this window, in the [!INCLUDE[nav_dev_long](../includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Options**.  

## Fields  

|Field|Description|  
|-----------|-----------------|  
|**Object Cache \(KB\)**|Specifies the size of the object cache, in kilobytes. Objects such as code, descriptions, and windows that are used on the computer that is running the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)] are stored in the object cache.<br /><br /> Values: Any integer value<br /><br /> Default: 32000|  
|**TempFilePath**|Specifies the path of the location to store temporary files that are created while [!INCLUDE[navnow](../includes/navnow_md.md)] runs. These files are automatically deleted when the [!INCLUDE[navnow](../includes/navnow_md.md)] is closed.<br /><br /> By default, these files are put in the Temp folder for the user, such as \<C:\\Users\\\<*user name*>\\AppData\\Local\\Temp>|  
|**Status Bar**|Specifies whether the status bar is displayed in the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)]. The status bar displays the following:<br /><br /> -   Name and contents of the active field<br />-   Current user ID<br />-   Whether you are working in Insert \(INS\) or Overtype \(OVR\) mode<br /><br /> Values: Yes, No<br /><br /> Default: Yes|  
|**Close Forms on Esc**|Specifies if the active window in the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)] closes when you press Esc.<br /><br /> Values: Yes, No<br /><br /> Default: Yes|  
|**Marquee Full Selection**|Not relevant in [!INCLUDE[navnowlong](../includes/navnowlong_md.md)].|  
|**Quick Find**|Specifies whether quick find is enabled. If quick find is enabled, then you can search for an entry in any non-editable field in the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)] by typing a letter or number. You can also type the complete name of the element you are looking for. When you type a letter or number, the **Find** window opens automatically and the first row that matches what you typed becomes the active row.<br /><br /> If quick find is not enabled, then you can open the **Find** window by choosing the **Edit** menu, and then choosing **Find**.<br /><br /> Values: Yes, No<br /><br /> Default: Yes|  
|**Max. no. of XML records to send**|Not relevant in [!INCLUDE[navnowlong](../includes/navnowlong_md.md)]. For more information about similar functionality, see the MaxNoOfXMLRecordsToSend setting in [Configuring the Windows Client](../Configuring-the-Windows-Client.md).|  
|**Auto-Lock on Design**|Specifies if you want to automatically lock objects when you open them for design in the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)].<br /><br /> Values: Yes, No<br /><br /> Default: No|  
|**Server Name**|Specifies the server that hosts the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance, such as *MyServer*.|  
|**Server Instance Name**|Specifies the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance that is being used, such as [!INCLUDE[nav_server_instance](../includes/nav_server_instance_md.md)].|  
|**Server Port**|Specifies the port on the [!INCLUDE[nav_server](../includes/nav_server_md.md)] server, such as *7046*.|  
|**Management Port**|Specifies the port on the server that runs the [!INCLUDE[nav_server](../includes/nav_server_md.md)] instance that the [!INCLUDE[navnow](../includes/navnow_md.md)] cmdlets access, such as *7045*.|  
|**Tenant**|Specifies the ID of the tenant that is accessed when you run objects from the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)]. If your solution is not set up to deploy in a multitenant deployment architecture, leave the field empty.|  
|**Company**|Specifies the name of the company that is accessed when you run objects from the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)]. If the database only contains a single company, leave the field empty.|  
|**Use Report Builder**|Specifies if you want to use SQL Server Report Builder to design the layout for reports. To continue to use Visual Studio Report Designer, do not change the value of this field.<br /><br /> SQL Server Report Builder is included when you install the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)].|  

## See Also  
 [How to: Change the Microsoft Dynamics NAV Server Instance](../How-to--Change-the-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [Managing Microsoft Dynamics NAV Server Instances](../Managing-Microsoft-Dynamics-NAV-Server-Instances.md)   
 [Locking and Unlocking Objects](../Locking-and-Unlocking-Objects.md)   
 [Find](-$-S_11001-Find-$-.md)
