---
title: "Managing Encryption Keys for SQL Server Authentication"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a5fcce05-dd4a-45db-ac10-54b877af7057
caps.latest.revision: 6
---
# Managing Encryption Keys for SQL Server Authentication
When using SQL Server authentication between the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the database in SQL Server, an encryption key is used to encrypt the credentials that the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance uses to log on to the database. The encryption key is stored on the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)] and also registered in the database. There is single encryption key per [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and it must match the encryption key in the database.  

 On the computer running the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, the encryption key file has the name [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].key and is stored in the *%systemroot%\\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90\\Server\\Keys*. In the database, the encryption key is registered in the dbo.$ndo$publicencryptionkey table. In a multitenant deployment, the encryption key is registered in the application database.  

 You can create encryption keys and then import and export the keys to and from databases by using encryption key cmdlets in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. These cmdlets are useful when upgrading or transferring a solution from one set of hardware to another, where you might need a copy of the encryption key to use it on another [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

> [!NOTE]  
>  When you use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to set up SQL Server Authentication on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for the first time, instead of creating or importing your own encryption key in advance, you can decide to use a system encryption key, which is generated and installed automatically.  

## Managing Encryption Keys by Using [!INCLUDE[nav_shell](includes/nav_shell_md.md)]  
 The [!INCLUDE[nav_shell](includes/nav_shell_md.md)] includes the following cmdlets that enable you to manage the encryption key that is used on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances:  

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|Export-NAVEncryptionKey|Exports an encryption key from a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to a password protected file.|  
|Import-NAVEncryptionKey|Imports an encryption key from a password protected file to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|  
|New-NAVEncryptionKey|Create an encryption key in a password protected file.|  

 For more information about how to run the cmdlets, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  

## Changing the Current Encryption Key  
 If you want to change an encryption key that is currently used by a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and database to another encryption key that is contained in an encryption key file, use the Import-NAVEncryptionkey cmdlet. Before you run the Import-NAVEncryptionkey cmdlet, you must delete the encryption key that is stored on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  

#### To change the encryption key that is used by the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance  

1.  On the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, delete the encryption key file for SQL Server authentication.  

     The encryption key file has the name [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].key and is stored in the *%systemroot%\\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90\\Server\\Keys* folder.  

2.  In the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], run the Import-NAVEncryptionkey cmdlet with the -Force parameter set.  

    ```  
    Import-NAVEncryptionKey -ServerInstance [Server Instance] -KeyPath [Encryption key file path] - ApplicationDatabaseServer [Database server instance] -ApplicationDatabaseName [Database name] -Force  
    ```  

## See Also  
 [How to: Configure SQL Server Authentication in Microsoft Dynamics NAV](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md)
