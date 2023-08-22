---
title: "DesignObject"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5701acd3-515e-4a03-8edd-be1b2a2b67d3
caps.latest.revision: 11
---
# DesignObject
Opens the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and opens the specified object for design.  

## Syntax  

```  
Finsql.exe [servername=<server>,] [database=<database>,] designobject=<object type> <object ID>, [username=<user name>,] [password=<password>,] [ntauthentication=<yes|no|0|1>]  
```  

#### Parameters  
 *servername*  

 The name of the database server on which you want to run the command.  

 If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.  

> [!TIP]  
>  To view the name of the server on which the current database is stored, in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  

 *database*  

 The database in which the objects that you want to compile are stored.  

 If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *database* parameter but you do specify the *servername* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database name.  

> [!TIP]  
>  To view the name of the current database, in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Name** field for the *database* parameter.  

 *designobject*  

 The type and ID of the object that you want to design. This parameter is required. The possible values of the object type are:  

-   Table  

-   Page  

-   Report  

-   Codeunit  

-   Query  

-   XMLport  

 The possible values of the object ID are 0 and any ID of an existing object. If you specify 0 for the object ID, then you open a new object to design.  

 *username*  

 The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  

> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *username* parameter and the current Windows user is an Administrator, then the command is run as the standard user.  

 If you specify the *username* parameter, then you must also specify the *password* parameter and the *ntauthentication* parameter must be **no**.  

 For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  

 *password*  

 The password to use with the *username* parameter to authenticate to the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  

 *ntauthentication*  

 Specifies if you want to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.  

## Remarks  
 You use the **DesignObject** parameter together with the finsql.exe executable. Finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

 To design objects, you must have a developer license.  

## Example  
 This example shows how to run a command to open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and open Page Designer to design page 21, **Customer Card**.  

```  
finsql.exe servername=TestComputer01\NAVDEMO, database="Demo Database NAV (10-0)", designobject=Page 21  
```  

## See Also  
 [Objects](Objects.md)   
 [Compiling Objects](Compiling-Objects.md)   
 [BuildVirtualMetadata](BuildVirtualMetadata.md)   
 [CreateDatabase](CreateDatabase.md)   
 [UpgradeDatabase](UpgradeDatabase.md)   
 [CreateLanguage](CreateLanguage.md)   
 [CreateLanguage](CreateLanguage.md)   
 [DesignObject](DesignObject.md)   
 [ExportObjects](ExportObjects.md)   
 [ImportObjects](ImportObjects.md)   
 [ExportLangModule](ExportLangModule.md)   
 [ImportLangModule](ImportLangModule.md)   
 [ExportTranslate](ExportTranslate.md)   
 [ImportTranslate](ImportTranslate.md)   
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)
