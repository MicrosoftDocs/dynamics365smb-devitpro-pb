---
title: "FieldRef.CalcSum Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.CalcSum Method
Calculates the total of all values of a SumIndexField in a table.


## Syntax
```
[Ok := ]  FieldRef.CalcSum()
```

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method is like the [CALCSUMS Method \(Record\)](../../methods-auto/record/record-calcsums-method.md) method. This method operates only on records that meet the conditions of any filters associated with the record.  

 If possible, the CALCSUM method uses SumIndexField Technology \(SIFT\). SIFT is used only if the following conditions are true:  

-   The [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key contains the fields that are used in the filters that are defined for the FlowField.  

-   The SumIndexFields on the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key contain the field to which the FieldRef parameter refers.  

-   The [MaintainSIFTIndex Property](../../properties/devenv-maintainsift-index-property.md) is set to **true**.  

> [!NOTE]  
>  By default this property is set to **true** for all keys.  

 For [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], CALCSUM execution is decoupled from [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] SIFT index definitions. This means that if any of the conditions for using SIFT indexes are not true, then [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] traverses all records in the base table to perform the calculation instead of using SIFT. This can reduce the number of required SIFT indexes, which can improve performance. In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], if the conditions for using SIFT indexes were not true and the **MaintainSIFTIndex** property was enabled, then you received an error when you called the CALCSUM method. This provided a degree of protection in earlier versions against accidentally requesting a sorting for which no index existed. In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  

 The CALCSUM method adheres to the [SecurityFiltering Property](../../properties/devenv-securityfiltering-property.md). <!--For more information about security filters, see [Record-Level Security](record-level-security.md).-->

## Example  
 This example sets a RecordRef variable to refer to table 21, the **Cust. Ledger Entry** table. Next, it creates a reference to field 18, the **Sales \(LCY\)** field, in the **Cust. Ledger Entry** table and assigns the field reference to a FieldRef variable. The **Sales \(LCY\)** field is a decimal field and is one of the SumIndexFields on a [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key in the **Cust. Ledger Entry** table. The code displays the original value of the FieldRef variable, then calls the CALCSUM method and displays the calculated value of the field.  

```
var
    MyFieldRef: FieldRef;
    MyRecRef: RecordRef;
begin
    MyRecRef.OPEN(21);  
    MyFieldRef := MyRecRef.FIELD(18);  
    MESSAGE('Before CALCSUM, Sales (LCY) is %1.', MyFieldRef.VALUE);  
    MyFieldRef.CALCSUM;  
    MESSAGE('After CALCSUM, Sales (LCY) is %1.', MyFieldRef.VALUE);  
end;
```  

 On a computer that has the regional format set to English \(United States\), the first message window displays the following:  

 **Before CALCSUM, Sales \(LCY\) is 0.**  

 The second message window displays the following:  

 **After CALCSUM, Sales \(LCY\) is 55,162.67.**  


## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
 [CALCSUM Method (Record)](../record/record-calcsums-method.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)