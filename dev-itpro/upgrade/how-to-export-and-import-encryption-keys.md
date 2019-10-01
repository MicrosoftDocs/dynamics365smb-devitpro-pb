---
title: "How to: Export and Import Encryption Keys"
author: jswymer
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Exporting and Importing Encryption Keys
You can encrypt data on the server instance by generating new encryption keys or importing or changing existing encryption keys that you enable on the server instance.  

> [!NOTE]
> [!INCLUDE[on_prem_only](../developer/includes/on_prem_only.md)]

> [!NOTE]  
>  If the deployment is configured with multiple service instances, then you must first enable encryption on one server instance and then export the key so it can be imported to another server instance where you enable encryption. You cannot generate different keys within one multiple-server instance environment.  

## Exporting an Encryption Key
  
 You export an encryption key to make a copy of the key or so that it can be imported on another server instance. Exporting an encryption key stores the encryption key that is used by the current server instance to a file on your computer or network.  

1.  In client, search for and open the **Data Encryption Management** page.   

2.  Choose **Export Encryption Key**.  

     On the message about saving the encryption key, choose **Yes**.  

3.  In the **Set Password** window, enter the password that will protect the exported key file, and then choose **OK**.  

4.  In the **Export File** window, choose **Save**, choose a safe location where the key file is stored, and then choose **Save**.  

## Importing an Encryption Key
  
 You can import an encryption key to a server instance from an encryption key file that was exported from another server instance or saved as a copy when the encryption was enabled. You cannot import an encryption key on a server instance that already includes an encryption key. In this case, you must change the encryption key instead.  

1.  In client, search for and open the **Data Encryption Management** page.

2.  Choose **Import Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  

## Changing an Encryption Key  
 If a server instance already has an encryption key, then you can replace the current encryption key with an encryption key that is stored in an encryption key file that was exported from another server.  

> [!NOTE]  
>  If the deployment is configured with multiple server instances, when you change the encryption key on a server instance, then the old encryption key is no longer valid on the other server instances. To enable the new encryption key on the other server instances, import it on each server instance.  


1.  In client, search for and open the **Data Encryption Management** page.

2.  Choose **Change Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  