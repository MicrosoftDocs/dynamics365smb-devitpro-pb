---
title: "SetAscending Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SetAscending Method
Sets the sort order for the records returned. Use this function after you have set the keys to sort after, using SETCURRENTKEY. The default sort order is ascending. You can use SETASCENDING to change the sort order to descending for a specific field, while the other fields in the specified key are sorted in ascending order.

## Syntax
```
 Table.SetAscending(Field: Any, Ascending: Boolean)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to set the sort order for.
        
*Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The sort order. Specify false if data must be sorted in descending order; otherwise true.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)