---
title: "Option Data Type"
ms.author: solsen
ms.custom: na
ms.date: 01/12/2020
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
# Option Data Type
> **Version**: _Available from runtime version 1.0._

Denotes an option value. In the code snippet below, you can see how the Option data type is declared.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax example

```al
procedure HelloWithOptions(OptionParameter : Option Alpha, "Bra-vo")
    var 
        OptionVariable : Option C, "or D";
    begin
        Message('%1',OptionParameter::Alpha);
        Message('%1',OptionVariable::C);
    end;
```


> [!NOTE]  
> It is not possible to reference the members of the `OptionParameter` from outside the body of the procedure. 
  
## Remarks

In the [OptionString Property](../../properties/devenv-optionstring-property.md) of the field or variable, you can enter the option values as a comma-separated list. The Option type is a zero-based enumerator type, which means that the option values are assigned to sequential numbers, starting with 0. You can convert option data types to integers.  
 <!-- 
 For more information about option variables in multilanguage-enabled applications, see [Developing Multilanguage-Enabled Applications](../../dynamics-nav/Developing-Multilanguage-Enabled-Applications.md).  
 --> 

 
## Example

This example shows how you can use the value of an option field as a constant in your AL code.  
  
```al
PurchHeaderRec."Document Type" := PurchHeaderRec."Document Type"::Invoice;   
```

## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  