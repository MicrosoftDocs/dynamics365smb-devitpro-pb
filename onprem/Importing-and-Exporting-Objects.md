---
title: "Importing and Exporting Objects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ee3d07c6-b153-4786-ac79-ffeaab477dcb
caps.latest.revision: 11
---
# Importing and Exporting Objects
You can import objects into [!INCLUDE[navnow](includes/navnow_md.md)] and export objects from [!INCLUDE[navnow](includes/navnow_md.md)] in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or by using development environment commands. The following table describes when you can use each method.  
  
|Method|Recommended uses|For more information|  
|------------|----------------------|--------------------------|  
|**Import** and **Export** from the **File** menu in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].|To move, copy, or share objects from Object Designer.|[How to: Import Objects](How-to--Import-Objects.md)<br /><br /> [How to: Export Objects](How-to--Export-Objects.md)<br /><br /> [Import Worksheet](Import-Worksheet.md)|  
|ImportObjects and ExportObjects commands.|To move, copy, or share objects at a command prompt. Use the commands if you want to automate the import or export.|[Development Environment Commands](Development-Environment-Commands.md)<br /><br /> [How to: Import Objects](How-to--Import-Objects.md)<br /><br /> [How to: Export Objects](How-to--Export-Objects.md)|  
  
 When you export an object, you export the design object, but not the data, from the database.  
  
> [!WARNING]  
>  When you import objects to [!INCLUDE[navnow](includes/navnow_md.md)] from a .txt file, and the file contains syntax errors, the objects are not imported. You must correct the error and import the .txt file again.  
  
 To translate strings for customized objects in a multilanguage environment, you can import and export text strings. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md). Alternatively, you can export your application objects into text files and then use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to export and import languages. For more information, see [Working with Application Objects as Text Files](Working-with-Application-Objects-as-Text-Files.md).  
  
 To view or troubleshoot a report on a computer that does not have [!INCLUDE[navnow](includes/navnow_md.md)] installed, you can export the dataset of a report as an .xml file. This exports the structure of the dataset and the data from the report. For more information, see [Walkthrough: Running a Report Offline](Walkthrough--Running-a-Report-Offline.md).  
  
## See Also  
 [How to: Import Objects](How-to--Import-Objects.md)   
 [How to: Export Objects](How-to--Export-Objects.md)   
 [ImportObjects](ImportObjects.md)   
 [Objects](Objects.md)   
 [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md)   
 [Import Worksheet](Import-Worksheet.md)   
 [Working with Application Objects as Text Files](Working-with-Application-Objects-as-Text-Files.md)
