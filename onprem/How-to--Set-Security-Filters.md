---
title: "How to: Set Security Filters"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 662b1b7c-5ace-4d47-bbd7-f8873b4249de
caps.latest.revision: 9
manager: edupont
---
# How to: Set Security Filters
You set security filters to limit the access that a user has to data in a table. You set security filters on permission sets, which you assign to users. For more information, see [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md).  
  
### To set a security filter  
  
1.  In the **Search** box, enter **Permission Sets**, and then choose the related link.  
  
2.  On the **Permission Sets** page, select the permission set to which you want to add a security filter, and then choose **Permissions**.  
  
3.  On the **Permissions** page, on the row for the table data to which you want to add a security filter, in the **Security Filter** column, choose the **AssistEdit** button.  
  
     The **Table Filter** page opens.  
  
4.  In the **Table Filter** page, in the **Field Number** column, select the field on which you want to limit a user's access. For example, if you want to create a security filter so that a user can view only sales with a specific salesperson code, then choose the field number for the **Salesperson Code** field.  
  
     The **Field Caption** column in the **Table Filter** page is filled in automatically after you select the field number.  
  
5.  In the **Field Filter** column, enter the value of field that you want to use to limit access. For example, to limit a user's access to only Annette Hill's sales, enter **AH**, which is the salesperson code for Annette Hill, in the **Field Filter** column.  
  
    > [!NOTE]  
    >  Record level security filters do not support wildcard characters. This means that you cannot use \* and ? in the filters. You can use other symbols, delimiters and, operators, such as, \<, >, &#124;, &, .., and =. If you do not enter an operator, then the default operator = is used.  
  
    > [!NOTE]  
    >  Security filters support Unicode characters. The maximum length of a security filter is 200 characters, including all field names, delimiters, symbols, and operators that used in the filter.  
  
    > [!NOTE]  
    >  When multiple permission sets that refer to the same table data are assigned to a user, they are combined so that the least restrictive filter is used. You should not repeat a table in multiple permission sets if you plan to combine those permissions sets for one user.  
  
## See Also  
 [Record-Level Security](Record-Level-Security.md)   
 [Security Filter Modes](Security-Filter-Modes.md)