---
title: "Manage Data Encryption"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 0adbd6ea-16d6-4030-9f3b-d9b02b447191
caps.latest.revision: 14
---

# Manage Data Encryption

You can encrypt data on the [!INCLUDE[nav_server](includes/nav_server_md.md)] by generating new or importing existing encryption keys that you enable on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database.  
  
 If [!INCLUDE[navnow](includes/navnow_md.md)] is configured with multiple service tiers ([!INCLUDE[nav_server](includes/nav_server_md.md)] instances), then you must first enable encryption on one server instance, and then export the key so it can be imported to other server instances where you enable encryption.  
  
> [!IMPORTANT]  
>  If you export companies and other data that is secured by data encryption, then remember to also export the encryption key so that you can access the data after you import it into another database, for example when you restore a backup. Creating a backup of encrypted data involves the following high-level steps.  
>   
>  1.  Export the data from one database. For more information, see [How to: Export and Import Companies and Other Data in Clients](How-to--Export-and-Import-Companies-and-Other-Data-in-Clients.md).  
> 2.  Export the data encryption key. For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  
> 3.  Import the data into another database. For more information, see [How to: Export and Import Companies and Other Data in Clients](How-to--Export-and-Import-Companies-and-Other-Data-in-Clients.md).  
> 4.  Import the data encryption key. For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  
  
 The following table describes a sequence of tasks, with links to the topics that describe them. These tasks are listed in the order in which they are generally performed.  
  
|**To**|**See**|  
|------------|-------------|  
|Export a configuration key from one [!INCLUDE[navnow](includes/navnow_md.md)] server instance so that it can be imported on another server instance or to make a copy of the key.|[How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md)|  
|Enable data encryption on a [!INCLUDE[navnow](includes/navnow_md.md)] server instance where an encryption key exists. Disable data encryption, for example to access a database for which you do not have the encryption key.|[How to: Enable and Disable Encryption Keys](how-to-enable-and-disable-encryption-keys.md)|  
  
## See Also  
 [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md)   
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)   
 [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md)