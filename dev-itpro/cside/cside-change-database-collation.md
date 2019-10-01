---
title: How to Alter Databases
description: Modify the Database property settings by using the Alter Database window, which gives you access to the same settings as the New Database window.
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0aa2c178-eea8-41bf-aecd-87d71552b4c6
caps.latest.revision: 12
manager: edupont
---
# Change Collation of an Existing [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

You cannot change the collation directly in the current database. To change the collation, you must create a new database that uses the correct collation, and then export the data from the old database and import it to the new database. You can do this by using SQL Server Management Studio and the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as outlined in the following procedure.  

1.  In SQL Server Management Studio, create a new database that uses the desired collation.  

     Make sure that the service account of the [!INCLUDE[server](../developer/includes/server.md)] instance that will connect to the database has proper permission to the database. The service account must be a member of the db\_owner role of the database. For more information see [Provisioning the Microsoft Dynamics NAV Server Account](../deployment/provision-server-account.md).  

2.  To export the data from the old database to the new database, open the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] Administration Shell, and run the Export-NAVData cmdlet as shown in the following example.  

    ```  
    Export-NAVData -DatabaseServer DatabaseServerName -DatabaseName OldDatabaseName -IncludeApplication -IncludeApplicationData -IncludeGlobalData -AllCompanies -FilePath c:\Files\MyDB.navdata  
    ```  

     For more information, see [Export-NAVData cmdlet](http://go.microsoft.com/fwlink/?LinkID=401400).  

3.  To import the data from the old database to the new database, run the Import-NAVData cmdlet as shown in the following example.  

    ```  
    Import-NAVData -DatabaseServer DatabaseServerName -DatabaseName NewDatabaseName -IncludeApplication -IncludeApplicationData -IncludeGlobalData -AllCompanies -FilePath c:\Files\MyDB.navdata  

    ```  

     For more information, see [Import-NAVData cmdlet](http://go.microsoft.com/fwlink/?LinkID=401402)  

4.  Connect the new database to the [!INCLUDE[server](../developer/includes/server.md)] instance.  

     For more information, see [Connect a Server Instance to a Database](../administration/connect-server-to-database.md).  

5.  Synchronize the table schemas in the database. You can do this from the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

    -   From the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Sync. Schema For All Tables**, and then choose **With Validation** and follow the schema synchronization instructions.  

    -   From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and then run the [Sync-NavTenant cmdlet](http://go.microsoft.com/fwlink/?LinkID=401399).

    For more information, see [Synchronizing the Tenant Database with the Application Database](../administration/synchronize-tenant-database-and-application-database.md).  

6.  Restart the [!INCLUDE[server](../developer/includes/server.md)] instance.  


## See Also  
 [Creating and Altering a  Database](cside-create-databases.md)
