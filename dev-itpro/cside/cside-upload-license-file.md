---
title: Upload the License File
description: Describes how to upload a Business Central license when you deploy on-premises
ms.custom:
  - bap-template
  - evergreen
ms.date: 10/14/2025
ms.update-cycle: 1095-days
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: how-to
ms.author: jswymer
author: jswymer
---
# Uploading the license file for Business Central on-premises

After an administrator or a Microsoft Certified Partner initially installs [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, the next step is to upload the license file that is supplied by Microsoft.  

To save the license file, you must have the necessary roles and permissions in SQL Server. Learn more in [Setting Database Owner and Security Administration Permissions](../security/Setting-Database-Owner-and-Security-Administration-Permissions.md).  

> [!NOTE]  
> Uploading the license file is typically something you do once for each database installation, not once for each client installation. If you need to upload a license for a specific database, see [Uploading a License File for a Specific Database](#UploadtoDatabase).  

Initially, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses CRONUS.flf or CRONUS.bclicense, which is the demonstration license file. All license files that aren't demonstration license files are named fin.flf or fin.bclicense. The demonstration license file has different name so that it can't be mistakenly overwritten.  

> [!TIP]
> To learn about the different types of licenses and how licensing works in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], download the [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).

## FLF and bclicense file types

Depending on your Business Central version and when you got your license, the license is either delivered as a single .flf file or as a \.zip that contains both an .flf and a \.bclicense file. The .flf file type is the legacy license format, which was [deprecated and removed in 2023 release wave 1 (v22)](../upgrade/deprecated-features-platform.md#flfformat). The \.bclicense file type is the newer license format. Both file types provide the same terms and permissions. But the \.bclicense file type is better suited for large license files than the \.flf file type. With large licenses, you might have problems importing a \.flf file. So we recommend that you use the \.bclicense file if you have one.

> [!NOTE]
> The bclicense file type is supported on versions 17.12, 18.7, 19.1 and later.

## Upload the License File to SQL Server

To upload the license, use the [Import-NAVServerLicense cmdlet](/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense).  

1. Start the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.  

2. Run the following command:

    ```powershell
    Import-NAVServerLicense -ServerInstance <server instance> -LicenseFile "<path to the license>"
    ```

    Replace `<server instance>`with your [!INCLUDE[server](../developer/includes/server.md)] instance name. Replace `<path to the license>` with the folder path and file name of your license. For example:

    ```powershell
    Import-NAVServerLicense -ServerInstance BC -LicenseFile "c:\licenses\fin.bclicense"
    ```

3. Restart the server instance. For example:

    ```powershell
    Restart-NAVServerInstance -ServerInstance BC
    ```

## Upload the License File to SQL Server using the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]

> **APPLIES TO:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 and earlier.

The following procedure uploads the license for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases on the SQL Server instance.  

1. Start the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].  

    > [!NOTE]  
    >  On a computer running any version of Windows with User Access Control enabled, you must start the development environment as an administrator.  

2. Verify that you're connected to your database. On the **File** menu, point to **Database**, and then choose **Open**.  

3. Upload the new license.  

    1. On the **Tools** menu, choose **License Information**.  

    2. In the **License Information** window, choose **Upload**.  

    3. In the **Upload License File** dialog box, browse to and open the license file.  

     You should see the following message:  

     **The Server license was successfully uploaded.**  

4. Restart the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to activate the license.  

5. Restart all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer to activate the license for other clients.  

> [!NOTE]  
>  Always review your license file after uploading, to verify that all information is correct and that you have all necessary license granules.  

### <a name="UploadtoDatabase"></a> Uploading a License File for a Specific Database  

1. In the development environment, on the **File** menu, point to **Database**, and then choose **Alter**.  

2. In the **Alter Database** window, choose **Integration**, and then select **Save license in database**.  

3. Restart all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer to activate the license for other clients.  

## Related information

[Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544)  
