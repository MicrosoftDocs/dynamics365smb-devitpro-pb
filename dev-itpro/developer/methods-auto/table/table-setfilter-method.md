---
title: "SetFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# SetFilter Method
Assigns a filter to a field that you specify.

## Syntax
```
 Table.SetFilter(Field: Any, String: String, [Value: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to filter.
          
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, >, \, &, &#124;, and =. You can use replacement fields (%1, %2, and so on) to insert values at run-time.
          
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Replacement values to insert in replacement fields in the filter expression. The data type of Value must match the data type of Field.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the method is called with a field for which a filter already exists, that filter will be removed before the new one is set. You can construct filters using the following operators:  
  
-   ..   Range  
  
-   &   And  
  
-   &#124;   Or  
  
-   \<   Less than  
  
-   \<=   Less than or equal to  
  
-   >   Greater than  
  
-   >=   Greater than or equal to  
  
-   \<>   Different from  
  
-   \*   Forms a part of value  
  
-   @   Case-insensitive  
  
## Example  
 The following table shows examples of filters.  
  
|Filter|Description|  
|------------|-----------------|  
|A..Z|A range from A to Z|  
|A&#124;G|A or G|  
|F.. & \*A/S|A range from F and A/S is included in the field|  
|\<>B|All except B|  
|\<>''|All not blank|  
|\<=200 &#124; >500|All less than or equal to 200 or greater than 500|  
  
 This example requires that you create the following variable.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|GLAccountRec|Record|G/L Account|  
  
```  
// Using a filter with replacement field.  
// This filter selects all accounts in the range from 100 to 200   
//   and No. 300.  
GLAccountRec.SETFILTER("No.", '%1..%2|%3', '100', '200', '300');  
// Using a filter entered directly in a string.  
// This filter, which is entered as a string, has the same result as  
//   the previous example.   
//   This filter selects all accounts in the range from 100 to 200 and   
//   and No. 300.  
GLAccountRec.SETFILTER("No.", '100..200|300');   
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)