---
title: "System-Defined Variables"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# System-Defined Variables
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] automatically declares and initializes several variables that you can use when you develop applications. The following table describes the system-defined variables.  

|System-defined variable|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------------------------|---------------------------------------|  
|Rec|When a record is modified, this variable specifies the current record, including the changes that are made.|  
|xRec|When a record is modified, this variable specifies the original values of the record, before the changes.|  
|CurrPage|This variable specifies the current page. You can access the controls of the page through this variable and set the dynamic properties of the page and its controls.<br /><br /> The CurrPage.Editable variable reflects the run-time value of the editable property, which can be changed at design time, programmatically, or by the user when switching view modes on a page.<br /><br /> The CurrPage.Update([SaveRecord]) variable can be used to save the current record and then update the controls in the page.<br /><br /> When the View mode on a page is **false**, then the Edit, New, and Delete modes are **true**.|  
|CurrReport|This variable specifies the current report.|  
|RequestOptionsPage|This variable specifies the request options page for the current report.|  
|CurrFieldNo|This variable specifies the field number of the current field in the current table. Retained for compatibility reasons.| 

## Example  
 The following example shows how to use the Rec and xRec pair of records.  

 In an application, data is stored in two tables, a header table and a line table. The header table contains general information about, for example, sales orders, while the line table contains the specific order lines. The page that you use to enter information into the header table has fields that contain the customer’s address. These fields are related to the **Customer** table, and can be filled by using a lookup method in the field that establishes the relationship. In the header table, only the customer number is stored, and the other fields that have customer information, such as name and address, are retrieved from the **Customer** table when the **Customer No.** field is validated.  

 In some situations, the user should be able to change the customer number, and in other situations the user should not be able to change it. For example, if the order has already been shipped, the user should not be able to change the customer number. If there is an incorrect number on an order that has not been processed completely, the user should be able to correct the error.  

 You could use the Rec and xRec variables to design your application in the following way:  

- When validating the customer number field, check whether the order has shipped.  

- If the order has shipped, compare the customer number fields in the Rec and xRec records. If they differ, reject the change.  

## See Also  
 [AL Method Reference](methods-auto/library.md)   
 [Properties](properties/devenv-properties.md)
