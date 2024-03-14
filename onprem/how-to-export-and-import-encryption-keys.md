---
title: "How to: Export and Import Encryption Keys"
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

# How to: Export and Import Encryption Keys

You can encrypt data on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance by generating new encryption keys or importing or changing existing encryption keys that you enable on the server instance.  

> [!NOTE]  
>  If [!INCLUDE[navnow](includes/navnow_md.md)] is configured with multiple service tiers ([!INCLUDE[nav_server](includes/nav_server_md.md)] instances), then you must first enable encryption on one server instance and then export the key so it can be imported to another server instance where you enable encryption. You cannot generate different keys within one multiple-server instance environment.  

## Exporting an Encryption Key  
 You export an encryption key to make a copy of the key or so that it can be imported on another server instance. Exporting an encryption key stores the encryption key that is used by the current server instance to a file on your computer or network.  

#### To export an encryption key  

1.  In the **Search** box, enter Data Encryption Management, and then choose the related link.  

2.  On the **Home** tab, in the **Process** group, choose **Export Encryption Key**.  

     On the message about saving the encryption key, choose **Yes**.  

3.  In the **Set Password** window, enter the password that will protect the exported key file, and then choose **OK**.  

4.  In the **Export File** window, choose **Save**, choose a safe location where the key file is stored, and then choose **Save**.  

## Importing an Encryption Key  
 You can import an encryption key to a server instance from an encryption key file that was exported from another server instance or saved as a copy when the encryption was enabled. You cannot import an encryption key on a server instance that already includes an encryption key. In this case, you must change the encryption key instead.  

#### To import an encryption key  

1.  In the **Search** box, enter Data Encryption Management, and then choose the related link.  

2.  On the **Home** tab, in the **Process** group, choose **Import Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  

## Changing an Encryption Key  
 If a server instance already has an encryption key, then you can replace the current encryption key with an encryption key that is stored in an encryption key file that was exported from another server.  

> [!NOTE]  
>  If [!INCLUDE[navnow](includes/navnow_md.md)] is configured with multiple server instances, when you change the encryption key on a server instance, then the old encryption key is no longer valid on the other server instances. To enable the new encryption key on the other server instances, import it on each server instance.  

#### To change an encryption key  

1.  In the **Search** box, enter Data Encryption Management, and then choose the related link.  

2.  On the **Home** tab, in the **Process** group, choose **Change Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  

## See Also  
 [How to: Enable and Disable Encryption Keys](how-to-enable-and-disable-encryption-keys.md)   
 [Manage Data Encryption](Manage-Data-Encryption.md)   
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)   
 [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md)
