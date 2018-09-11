---
title: "How to: Import Objects"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Importing Objects
You can import application objects into the database from a file. The file must be one of the following formats:  

-   Object format \(.fob\)  

-   Text format \(.txt\)  

 You can import objects either by using the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] or by running finsql.exe with the ImportObjects command.  

> [!NOTE]  
>  To import objects from .txt format, you must have a developer license. To import objects from .fob format, you can have either an end-user license or a developer license.  

### <a name="ImportObjectsDevEnv"></a>To import objects by using the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)]  

1.  In the development environment, on the **Tools** menu, choose **Object Designer**.  

2.  On the **File** menu, choose **Import**.  

3.  In the **Import Objects** window, locate the folder where the import file is located, select the file, and then choose **Open**.  

     If you import objects from a .txt file, then the objects in the file overwrite any objects that are already in the database. If you import objects from a .fob file and one or more objects in the file has the same ID as an object that are already in the database, then you receive a warning. You can choose to either cancel the import or open the Import Worksheet to resolve the conflicts.  

4.  Use the Import Worksheet to specify how to resolve conflicts between objects in the import file and objects in the database. For more information, see [Import Worksheet](Import-Worksheet.md).  

### <a name="ImportObjectsFinSQL"></a>To import objects by running finsql.exe with the ImportObjects command  

1.  At a command prompt, move to the location of finsql.exe. The finsql.exe is located where the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] is installed.  

2.  Run finsql.exe with the parameter "command=importobjects". You must specify the following parameters:  

    -   file  

    -   servername  

    -   database  

     All other parameters are optional.  

     For more information about the ImportObjects command, see [ImportObjects](https://docs.microsoft.com/en-us/dynamics-nav/importobjects).  

