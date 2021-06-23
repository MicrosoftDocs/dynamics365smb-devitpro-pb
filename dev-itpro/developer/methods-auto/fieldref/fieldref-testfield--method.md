---
title: "FieldRef.TestField Method"
description: "Determines whether the contents of a field matches a given value."
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
# FieldRef.TestField Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.


## Syntax
```AL
 FieldRef.TestField()
```

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is like the [TestField Method \(Record\)](../../methods-auto/record/record-testfield-joker-method.md) method.  
  
## Example 1

The following example opens the Customer table as a RecordRef variable that is named CustomerRecref, created a reference to the first field \(No\) and stores the reference in the MyFieldRef variable. The [Value Method \(FieldRef, TestPage Field\)](fieldref-value-method.md) sets the No. field to a blank text. The TestField method determines whether the contents of the field match 10000, the specified value. In this case, the content does not match so the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] throws an exception. If the there is a match, no exception is thrown.  

```al
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
begin
    CustomerRecref.Open(Database::Customer);  
    MyFieldRef := CustomerRecref.Field(1);  
    MyFieldRef.Value := '';  
    MyFieldRef.TestField('10000');  
end;
```  
  
In this example, the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] displays following error message:  
  
**No. must be equal to 10000 in Customer: No.=. Current value is ''.**
  
## Example 2

If the value of the No. field is set to a value other than 10000, [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] displays the following error message:  
  
**No. must be equal to 10000 in Customer: No.=AAA10000. Current value is 'AAA 10000'.**
  
```al
CustomerRecref.Open(DataBase::Customer);  
MyFieldRef := CustomerRecref.Field(1);  
MyFieldRef.Value := 'AAA 10000';  
MyFieldRef.TestField('10000');  
```  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)