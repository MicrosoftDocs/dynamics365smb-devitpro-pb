---
title: "SqlIndex Property"
description: "Sets the actual fields that are used in the corresponding index on SQL Server."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# SqlIndex Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the actual fields that are used in the corresponding index on SQL Server.

## Applies to
-   Table Key

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
SqlIndex = List of Fields;
```

## Remarks  

This property allows you to define the fields that are used in the SQL index.  
  
The fields in the SQL index can:  
  
- Differ in number from the fields defined in the key in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] — there can be fewer fields or more fields.  
  
- Be arranged in a different order.  
  
If you use this property to define an index on a key that is not the primary key, then the index that is created contains exactly the fields that you specify and will not be a unique index. A unique index will only be created if it contains all of the primary key fields.  
  
If you use this property to define an index for the primary key, it must include all the fields defined in the primary key. You can add extra fields and you can rearrange the fields to suit your needs.  

## Example

The following example uses the SQLIndex property on a primary key that includes two fields. The clustered index in the database will be ordered like this: (MyField2,MyField1).

```AL
keys
{
    key(PK; MyField1, MyField2) 
    {
        Clustered = true;
        SqlIndex = MyField2,MyField1;
    }
}
```

## See Also

[Properties](devenv-properties.md)  
[Table Keys](../devenv-table-keys.md)   