---
title: "How to: Enable and Disable Encryption Keys"
author: SusanneWindfeldPedersen
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 0adbd6ea-16d6-4030-9f3b-d9b02b447191
caps.latest.revision: 14
---
# How to: Enable and Disable Encryption Keys

You can encrypt data on the [!INCLUDE[nav_server](includes/nav_server_md.md)] by generating new or importing existing encryption keys that you enable on the server.  
  
> [!NOTE]  
>  If [!INCLUDE[navnow](includes/navnow_md.md)] is configured with multiple service tiers, then you must first enable encryption on one server and then export the key so it can be imported to another server where you enable encryption. You cannot generate different keys within one multiple\-server environment.  
  
 You encrypt data by enabling an encryption key on a server where an encryption key exists.  
  
 You can disable data encryption, for example to access a database for which you do not have the encryption key.  
  
> [!IMPORTANT]  
>  If you disable encryption when there is no encryption key available, encrypted data will be deleted.  
  
### To enable data encryption  
  
1.  In the **Search** box, enter Data Encryption Management, and then choose the related link.  
  
2.  On the **Home** tab, in the **Process** group, choose **Enable Encryption**.  
  
     On the message about saving a copy of the encryption key, choose **Yes**.  
  
3.  In the **Set Password** window, enter a password that protects the encryption key, and then choose **OK**.  
  
4.  In the **Export File** window, choose **Save**, choose a safe location where the encryption key is stored, and then choose **Save**.  
  
### To disable data encryption  
  
1.  In the **Search** box, enter Data Encryption Management, and then choose the related link.  
  
2.  On the **Home** tab, in the **Process** group, choose **Disable Encryption**.  
  
3.  On the warning message about non-encrypted data, choose **Yes**.  
  
## See Also  
 [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md)   
 [Manage Data Encryption](manage-data-encryption.md)   
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)   
 [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md)