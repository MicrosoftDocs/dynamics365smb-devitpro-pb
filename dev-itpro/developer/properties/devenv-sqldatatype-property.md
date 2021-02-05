---
title: "SqlDataType Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SqlDataType Property
> **Version**: _Available from runtime version 1.0._

Sets the data type that you want to allow in a code field.

## Applies to
-   Table Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Varchar**|The data type is Varchar. This is the default value.|
|**Integer**|The data type is Integer.|
|**Variant**|The data type is Variant|
|**BigInteger**|The data type is BigInteger.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## Syntax

```AL
SQLDataType = Varchar;
```

## Remarks  

The values available are Varchar, Integer, BigInteger, and Variant. Leaving the value set at \<Undefined>means that you accept the default setting, which is Varchar.  
  
> [!NOTE]  
> The Variant option is represented by the SQL\_VARIANT SQL data type that has been introduced in SQL Server 2000 and is not supported by SQL Server 7.0. This means that selecting Variant as the SQL Data Type property when creating or modifying a table on SQL Server 7.0 results in an error.  
  
## Varchar  

If you set SQL Data Type to Varchar, all the values in the field are compared and sorted as character data, including numeric values.  
  
## Integer  

If you set SQL Data Type to Integer, then the following are true:  
  
- All the values in the field are compared and sorted as integers. No alphanumeric values can be stored in the field.  
  
- If you enter negative values in the column outside [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] using external tools, they cannot be read into [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  
  
- The value "0" \(zero\) is used to represent an empty string in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  
  
- Non-numeric code values or any numeric values beginning with "0" \(zero\) cannot be entered in the code field.  
  
## Variant  
 If you set SQL Data Type to Variant, then the following are true:  
  
- The values in the field are compared and sorted according to their base data type. Numeric values are sorted after alphanumeric values.  
  
- Data that is entered into the code field in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] is stored as either the Varchar or Integer base data type, depending on the value that has been entered.  
  
- Any value beginning with "0" \(zero\) can be entered in the code field and is stored as an Integer base data type.  
  
  > [!NOTE]  
  >  You can change the SQL Data Type of a code field from Varchar or Integer to Variant and the data in the column is changed accordingly. You cannot change the SQL Data Type of a code field from Variant to Varchar or Integer, unless there are no rows in the table or unless the field contains only an empty string in every row.  
  
## See Also

[Properties](devenv-properties.md)  
[Integer Data Type](../datatypes/devenv-integer-data-type.md)  
[BigInteger Data Type](../datatypes/devenv-biginteger-data-type.md)  
[Variant Data Type](../datatypes/devenv-variant-data-type.md)