---
title: Set Primary and Secondary Keys
description: When you create a table in Table Designer, the field with the lowest field number sets the primary key. Use this procedure to define a different primary key.
ms.custom: na 
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cf31b59c-3436-48cb-ae78-c8e03a80ca92
caps.latest.revision: 10
---
# Define Primary and Secondary Keys
A maximum of 20 distinct fields can be used to define a primary key. The number of fields used in the primary key limits the number of fields in the secondary keys. Fields used by one key can also be used in another key; however, no more than 20 unique fields can be used to create primary or secondary keys.  
  
 This means that if your primary key includes four distinct fields, your secondary keys can include these four fields, and at most 16 other fields. Correspondingly, if your primary key consists of 20 distinct fields, then your secondary keys must consist only of combinations of these fields.  
  
 When you create a table in Table Designer, by default [!INCLUDE[navnow](includes/navnow_md.md)] uses the field with the lowest field number as the primary key. Use the following procedure to define a different primary key.  
  
> [!NOTE]  
>  The maximum record size in [!INCLUDE[navnow](includes/navnow_md.md)] is 8000 bytes. Adding a primary key to a table when the record size limit is close to this limit will prevent the table from compiling.  
  
### To define a primary key  
  
1.  On the **Tools** menu, choose **Object Designer**.  
  
2.  Choose **Table**.  
  
3.  Select a table from the list and then choose **Design**.  
  
4.  Select the first empty line and then from the **View** menu, choose **Keys**.  
  
     The **Keys** window appears.  
  
5.  In the first line of the **Keys** window, enter the primary key as a comma-delimited list; for example, "ID Number, Name".  
  
## Defining Secondary Keys  
 Up to 40 keys can be defined for a table. The first key defined is the primary key. All the other keys are secondary keys and are optional. Secondary keys are used to view records in an order that is different from the order defined by the primary key fields.  
  
#### To define a secondary key  
  
1.  On the **Tools** menu, choose **Object Designer**.  
  
2.  Choose **Table**.  
  
3.  Select a table from the list and then choose **Design**.  
  
4.  Select the first empty line and then from the **View** menu, choose **Keys**.  
  
     The **Keys** window appears.  
  
5.  The first line shows the primary key. Enter the secondary keys on the following lines as comma-separated lists; for example: Name, Address.  
  
## See Also  
 [Table Keys](Table-Keys.md)   
 [How to: View or Modify Properties on a Key](How-to--View-or-Modify-Properties-on-a-Key.md)
