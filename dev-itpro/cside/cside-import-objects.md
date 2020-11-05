---
title: "How to: Import Objects"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: jswymer
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Exporting and Importing Objects
You can export and import application objects from and to the database from a file. The file must be one of the following formats:  

-   Object format \(.fob\)  

-   Text format \(.txt\)  

 You can export and import objects either by using the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] or by running finsql.exe with the [ImportObjects](/dynamics-nav/importobjects) command.  

> [!NOTE]  
>  To export or import objects from .txt format, you must have a developer license. To import objects from .fob format, you can have either an end-user license or a developer license.  

### <a name="ExportObjectsDevEnv"></a>To export objects by using the development environment UI  

1.  In the [!INCLUDE[[nav_dev_long](../developer/includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, select the object type that you want to export, or select **All** if you want to export different types of objects to the same file.  

3.  Select one or more objects that you want to export. To select multiple objects, hold down the Ctrl key when you select objects.  

4.  On the **File** menu, choose **Export**.  

5.  In the **Export Objects** window, locate the folder where you want to create the exported objects file, enter a file name, select the file type, and then choose the **Save** button.  

### <a name="ExportObjectsFinSQL"></a>To export objects by running finsql.exe with the ExportObjects command  

1.  At a command prompt, move to the location of finsql.exe. The finsql.exe is located where the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] is installed.  

2.  Run finsql.exe with the parameter `command=exportobjects`. You must specify the following parameters:  

    -   `file`  

    -   `servername`  

    -   `database`  

     All other parameters are optional.  

     For more information about the ExportObjects command, see [ExportObjects](/dynamics-nav/ExportObjects).  


### <a name="ImportObjectsDevEnv"></a>To import objects by using the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)]  

1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  

2.  On the **File** menu, choose **Import**.  

3.  In the **Import Objects** window, locate the folder where the import file is located, select the file, and then choose **Open**.  

     If you import objects from a .txt file, then the objects in the file overwrite any objects that are already in the database. If you import objects from a .fob file and one or more objects in the file has the same ID as an object that are already in the database, then you receive a warning. You can choose to either cancel the import or open the Import Worksheet to resolve the conflicts.  

4.  Use the Import Worksheet to specify how to resolve conflicts between objects in the import file and objects in the database. For more information, see [Import Worksheet](../cside/cside-import-worksheet.md).  

### <a name="ImportObjectsFinSQL"></a>To import objects by running finsql.exe with the ImportObjects command  

1.  At a command prompt, move to the location of finsql.exe. The finsql.exe is located where the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] is installed.  

2.  Run finsql.exe with the parameter `command=importobjects`. You must specify the following parameters:  

    -   `file`  

    -   `servername`  

    -   `database` 

    For example: 

	```    
    finsql.exe command=importobjects, file=C:\NewObjects.fob, servername=TestComputer01, database="Demo Database BC"
	```  
    
    All other parameters are optional.

    > [!TIP]  
    > By default, when importing objects from a .fob file, the command will also build the object search index. To save time, if you do not to build the search index, use the `suppressbuildsearchindex=yes` parameter with the command, for example:
    >
    > `finsql.exe command=importobjects, file=C:\NewObjects.fob, servername=TestComputer01, database="Demo Database BC", suppressbuildsearchindex=yes`
    
    For more information about the ImportObjects command, see [ImportObjects](cside-command-prompt.md#ImportObjects).  

