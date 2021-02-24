---
title: "How to: Export and Import Encryption Keys"
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Managing Encryption and Encryption Keys

You encrypt data on the server instance by using encryption keys. You can generate new keys or use existing encryption keys.  

> [!NOTE]
> [!INCLUDE[on_prem_only](../developer/includes/on_prem_only.md)]

> [!NOTE]  
>  If the deployment is configured with multiple service instances, then you must first enable encryption on one server instance and then export the key so it can be imported to another server instance where you enable encryption. You cannot generate different keys within one multiple-server instance environment.  

## <a name="encryption"></a> Enable and Disable Encryption

1.  In client, search for and open the **Data Encryption Management** page.

2.  To enable encryption, choose **Enable Encryption**.

    This action will automatically generate an encryption key. Follow instructions onscreen.  

2.  To disable encryption, choose **Disable Encryption**.  

## Exporting an Encryption Key
  
 You export an encryption key to make a copy of the key. The copy can then be imported on another server instance. The system stores the encryption key used by the current server instance to a file on your computer or network.  

1.  In client, search for and open the **Data Encryption Management** page.   

2.  Choose **Export Encryption Key**.  

     On the message about saving the encryption key, choose **Yes**.  

3.  In the **Set Password** window, enter the password that will protect the exported key file, and then choose **OK**.  

4.  In the **Export File** window, choose **Save**, choose a safe location where the key file is stored, and then choose **Save**.  

## Importing an Encryption Key
  
You can import an encryption key that was copied from the current server instance or another server instance. You can't import an encryption key on a server instance that already includes an encryption key. In this case, you must change the encryption key instead.  

1.  In client, search for and open the **Data Encryption Management** page.

2.  Choose **Import Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  

## Changing an Encryption Key  

If a server instance already has an encryption key, you can replace it with an encryption key exported from another server.  

> [!NOTE]  
>  If the deployment is configured with multiple server instances, when you change the encryption key on a server instance, then the old encryption key is no longer valid on the other server instances. To enable the new encryption key on the other server instances, import it on each server instance.  


1.  In client, search for and open the **Data Encryption Management** page.

2.  Choose **Change Encryption Key**.  

3.  In the **Select a key file to import** window, choose the encryption key file, and then choose **Open**.  

4.  In the **Password** window, enter the password that protects the key file, and then choose **OK**.  