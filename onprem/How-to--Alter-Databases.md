---
title: How to Alter Databases
description: Modify the Database property settings by using the Alter Database window, which gives you access to the same settings as the New Database window.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0aa2c178-eea8-41bf-aecd-87d71552b4c6
caps.latest.revision: 12
---
# How to Alter Databases in Dynamics NAV
You can change the database property settings that you selected when you created the database.  

 The **Alter Database** window gives you access to the same settings as the [New Database](uiref/-$-S_2338-New-Database-$-.md) window.  

> [!NOTE]  
>  You cannot alter a database by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] if the database is deployed on Azure SQL Database.  

### To alter a database  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window opens. In the **Alter Database** window you can change database settings.  

     The **Alter Database** window contains the following tabs:  

    -   [Altering Databases - General Tab](Altering-Databases---General-Tab.md)  

    -   [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)  

    -   [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)  

    -   [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)  

    -   [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)  

    -   [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)  

    -   [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)  

2.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     The changes will not take effect until you restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).  

## Changing Database Collation  
 You cannot change the collation directly in the current database. To change the collation, you must create a new database that uses the correct collation, and then export the data from the old database and import it to the new database. You can do this by using SQL Server Management Studio and the [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell as outlined in the following procedure.  

#### To change the collation of a [!INCLUDE[navnow](includes/navnow_md.md)] database  

1.  In SQL Server Management Studio, create a new database that uses the desired collation.  

     Make sure that the service account of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that will connect to the database has proper permission to the database. The service account must be a member of the db\_owner role of the database. For more information see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  

2.  To export the data from the old database to the new database, open the [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell, and run the Export-NAVData cmdlet as shown in the following example.  

    ```  
    Export-NAVData -DatabaseServer DatabaseServerName -DatabaseName OldDatabaseName -IncludeApplication -IncludeApplicationData -IncludeGlobalData -AllCompanies -FilePath c:\Files\MyNavDB.navdata  
    ```  

     For more information, see [Export-NAVData cmdlet](https://go.microsoft.com/fwlink/?LinkID=401400).  

3.  To import the data from the old database to the new database, run the Import-NAVData cmdlet as shown in the following example.  

    ```  
    Import-NAVData -DatabaseServer DatabaseServerName -DatabaseName NewDatabaseName -IncludeApplication -IncludeApplicationData -IncludeGlobalData -AllCompanies -FilePath c:\Files\MyNavDB.navdata  

    ```  

     For more information, see [Import-NAVData cmdlet](https://go.microsoft.com/fwlink/?LinkID=401402)  

4.  Connect the new database to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     For more information, see [How to: Connect a Microsoft Dynamics NAV Server Instance to a Database](How-to--Connect-a-Microsoft-Dynamics-NAV-Server-Instance-to-a-Database.md).  

5.  Synchronize the table schemas in the database. You can do this from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

    -   From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Sync. Schema For All Tables**, and then choose **With Validation** and follow the schema synchronization instructions.  

    -   From the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] as an administrator, and then run the [Sync-NavTenant cmdlet](https://go.microsoft.com/fwlink/?LinkID=401399).

    For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).  

6.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

     For more information, see [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md).  

## See Also  
 [Alter Database](uiref/-$-S_2339-Alter-Database-$-.md)
