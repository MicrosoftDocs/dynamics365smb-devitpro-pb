---
title: "SETASCENDING Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9ca16239-3e08-450a-87c1-29d5b7764094
caps.latest.revision: 2
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETASCENDING Method (Record)
Sets the sort order for the records returned. Use this method after you have set the keys to sort after, using SETCURRENTKEY. The default sort order is ascending. You can use SETASCENDING to change the sort order to descending for a specific field, while the other fields in the specified key are sorted in ascending order.  
  
 For example, you can read data from an ODATA web service where the data is sorted in ascending order on the Name field but in descending order on the City field.  
  
## Syntax  
  
```  
  
[Ascending :=] Record.SETASCENDING(Field,[ SetAscending])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table that you want to set the sort order for.  
  
 *Field*  
 Type: Field  
  
 The field that you want to set the sort order for.  
  
 *SetAscending*  
 Type: Boolean  
  
 The sort order. Specify `Descending` if data must be sorted in descending order; otherwise `Ascending`.  
  
## Example  
 The following code example illustrates how you can use SETCURRENTKEY and SETASCENDING to sort data in two different directions based on two fields.  
  
```  
Customer.SETCURRENTKEY(City,"Name");  
  
Customer.SETASCENDING(City,Descending);  
```  
  
 In this example, you use SETCURRENTKEY to specify that you want to sort based on City and Name. This means that data will be sorted in ascending order based on those two fields, first by City, then by Name. Next, you use SETASCENDING to sort City in descending order instead. As a result, your data will look like this:  
  
```  
CTown  
  
   ACustomer  
  
   BCustomer  
  
BTown  
  
   ACustomer  
  
   BCustomer  
  
   CCustomer  
  
ATown  
  
   ACustomer  
  
   BCustomer  
  
```  
  
## See Also  
 [SETCURRENTKEY Method \(Record\)](devenv-SETCURRENTKEY-Method-Record.md)   
 <!--Links [OData Web Services](OData-Web-Services.md)-->