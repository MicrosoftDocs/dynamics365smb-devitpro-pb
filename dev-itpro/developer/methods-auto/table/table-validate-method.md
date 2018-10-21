---
title: "Validate Method"
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
# Validate Method
Calls the OnValidate trigger for the field that you specify.

## Syntax
```
 Table.Validate(Field: Any, [NewValue: Any])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
A field together with associated triggers.
          
*NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value to insert into Field.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 **VALIDATE** first checks any [TableRelation Property](../../properties/devenv-tablerelation-property.md) and then executes the [OnValidate \(Fields\) Trigger](../../triggers/devenv-onvalidate-fields-trigger.md) of the field.  
  
 If you omit *NewValue*, then the method validates the current value.  
  
## Example  
 This example shows how to use the **VALIDATE** method.  
  
 When you enter an account number in a ledger, some table trigger code is executed to transfer the name of the account from the chart of accounts.  
  
 If you enter an account number in a batch job, then the code which transfers the name of the account is not automatically executed. The following code specifies that the appropriate field-level trigger code must be executed.  
  
 This example requires that you create the following variable.  
  
|Variable|Data type|Subtype|  
|--------------|---------------|-------------|  
|GeneralLedgerEntry|Record|G/L Entry|  
  
```  
GeneralLedgerEntry.VALIDATE("G/L AccountNo", '100');  
// This corresponds to:  
GeneralLedgerEntry."G/L AccountNo" := '100';  
GeneralLedgerEntry.VALIDATE("G/L AccountNo");   
```  
  
 The **VALIDATE** method is useful for centralizing processing, which makes your application easier to maintain.  
  
 For example, if the **OnValidate** trigger of the **Total Amount** field performs a calculation that uses values from three other fields as operands, then the calculation must be performed again if the contents of any one of these fields changes.  
  
 You should avoid entering the calculation formula in the **OnValidate** triggers of each field. This can create errors if the calculation formula has to be changed later and you have to update the code in all the triggers. Instead, you should enter the calculation formula in the **OnValidate** trigger of only one of the fields and call this trigger code from the **OnValidate** triggers of the other fields.  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)