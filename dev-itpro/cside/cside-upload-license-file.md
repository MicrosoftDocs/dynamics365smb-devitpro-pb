---
title: Upload the License File
description: Describes how to upload a Business Central license when you deploy on-premises
ms.custom: na
ms.date: 10/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---
# Uploading the License File for Business Central On-Premises

After an administrator or a Microsoft Certified Partner initially installs [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, the next step is to upload the license file that is supplied by Microsoft.  

 To save the license file, you must have the necessary roles and permissions in SQL Server. See [Setting Database Owner and Security Administration Permissions](../security/Setting-Database-Owner-and-Security-Administration-Permissions.md).  

> [!NOTE]  
> Uploading the license file is typically something you do once for each database installation, not once for each client installation. If you need to upload a license for a specific database, see [Uploading a License File for a Specific Database](#UploadtoDatabase).  

Initially, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] uses CRONUS.flf, which is the demonstration license file. All license files that are not demonstration license files are named FIN.flf. The demonstration license file has been given a different name so that it cannot be mistakenly overwritten.  

## Upload the License File to SQL Server

To upload the license, use the [Import-NAVServerLicense cmdlet](/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense).  

1. Start the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.  

2. Run the following command:

    ```powershell
    Import-NAVServerLicense -ServerInstance <server instance> -LicenseFile "<path to the license>"
    ```

    Replace `<server instance>`with your [!INCLUDE[server](../developer/includes/server.md)] instance name. Replace `<path to the license>` with the folder path and file name of your license.

3. Restart the server instance.

    ```powershell
    Restart-NAVServerInstance -ServerInstance <server instance>
    ```

## Upload the License File to SQL Server using the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]

> **APPLIES TO:** [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Spring 2019 and earlier.

The following procedure uploads the license for all [!INCLUDE[prodshort](../developer/includes/prodshort.md)] databases on the SQL Server instance.  

1.  Start the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].  

    > [!NOTE]  
    >  On a computer running any version of Windows with User Access Control enabled, you must start the development environment as an administrator.  

2.  Verify that you are connected to your database. On the **File** menu, point to **Database**, and then choose **Open**.  

3.  Upload the new license.  

    1.  On the **Tools** menu, choose **License Information**.  

    2.  In the **License Information** window, choose **Upload**.  

    3.  In the **Upload License File** dialog box, browse to and open the license file.  

     You should see the following message:  

     **The Server license was successfully uploaded.**  

4.  Restart the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to activate the license.  

5.  Restart all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer to activate the license for other clients.  

> [!NOTE]  
>  Always review your license file after uploading, to verify that all information is correct and that you have all necessary license granules.  

##  <a name="UploadtoDatabase"></a> Uploading a License File for a Specific Database  

1.  In the development environment, on the **File** menu, point to **Database**, and then choose **Alter**.  

2.  In the **Alter Database** window, choose **Integration**, and then select **Save license in database**.  

3.  Restart all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer to activate the license for other clients.  

## See Also  
 [Business Central Software License Terms](https://www.microsoft.com/en-us/download/details.aspx?id=57274)  
 [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544)  
