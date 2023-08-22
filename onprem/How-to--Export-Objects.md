---
title: "How to: Export Objects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 899abeac-1f26-4544-8806-03128865677d
caps.latest.revision: 10
---
# How to: Export Objects
You can export one or more application objects to one of the following formats:  

-   [!INCLUDE[navnow](includes/navnow_md.md)] Object format \(.fob\)  

-   Text format \(.txt\)  

 You can export objects either by using the development environment UI or by running finsql.exe with the ExportObjects command.  

> [!NOTE]  
>  To export objects to .txt format, you must have a developer license. To export objects to .fob format, you can have either an end-user license or a developer license.  

### <a name="ExportObjectsDevEnv"></a>To export objects by using the development environment UI  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, select the object type that you want to export, or select **All** if you want to export different types of objects to the same file.  

3.  Select one or more objects that you want to export. To select multiple objects, hold down the Ctrl key when you select objects.  

4.  On the **File** menu, choose **Export**.  

5.  In the **Export Objects** window, locate the folder where you want to create the exported objects file, enter a file name, select the file type, and then choose the **Save** button.  

### <a name="ExportObjectsFinSQL"></a>To export objects by running finsql.exe with the ExportObjects command  

1.  At a command prompt, move to the location of finsql.exe. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\[!INCLUDE[rtc](includes/rtc_md.md)]\\.  

2.  Run finsql.exe with the parameter "command=exportobjects". You must specify the following parameters:  

    -   file  

    -   servername  

    -   database  

     All other parameters are optional.  

     For more information about the ExportObjects command, see [ExportObjects](ExportObjects.md).  

## See Also  
 [Importing and Exporting Objects](Importing-and-Exporting-Objects.md)
