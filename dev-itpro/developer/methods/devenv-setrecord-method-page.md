---
title: "SETRECORD Method (Page)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: c89a0e5b-d8c7-4b2e-ab7b-0f3b31b0480a
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETRECORD Method (Page)
Sets the current record for the page.  
  
## Syntax  
  
```vb  
  
Page.SETRECORD(Record)  
```  
  
```c#  
  
```  
  
#### Parameters  
 *Page*  
 Type: Page  
  
 The page on which to set the current record.  
  
 *Record*  
 Type: Record  
  
 The record to set as the current record.  
  
> [!NOTE]  
>  You cannot use a temporary record for the *Record* parameter.  
  
## Remarks  
 You can use this method to set the record to display when the user opens the page.  
  
## Example  
 The following example retrieves the record that has a primary key value of ‘30000’ from the Customer table. If the record is found, it is stored in the MyRecord variable. The **SETRECORD** method uses the retrieved record as the current record and sets record for MyPage, which is a Customer Card page. When the code unit is run, the record is displayed on the MyPage page. If the record is not found, a message box displays a message that indicates that the record was not found. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyPage|Page|Customer Card|  
|MyRecord|Record|Customer|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text 000|The record was not found.|  
  
```  
IF  
  MyRecord.GET('30000') THEN BEGIN  
  MyPage.SETRECORD(MyRecord);  
  MyPage.RUN;  
   END  
ELSE BEGIN  
  MESSAGE(Text000);  
  END;  
```