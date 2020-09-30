---
title: "Record.SetAscending Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Record.SetAscending Method
Sets the sort order for the records returned. Use this method after you have set the keys to sort after, using SETCURRENTKEY. The default sort order is ascending. You can use SETASCENDING to change the sort order to descending for a specific field, while the other fields in the specified key are sorted in ascending order.


## Syntax
```
 Record.SetAscending(Field: Any, Ascending: Boolean)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to set the sort order for.
        
*Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The sort order. Specify false if data must be sorted in descending order; otherwise true.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

SETASCENDING is applicable to records that aren't displayed in a page in the client. For example, you can read data from an ODATA web service where data is sorted in ascending order on one field and descending on another. When the records are shown in a page, the method has no effect.

## Example

The following code example shows how to use SETCURRENTKEY and SETASCENDING to sort data in two different directions based on two fields.
It uses SETCURRENTKEY to specify the sort based on City and Name. Data will be sorted in ascending order based on those two fields, first by City, then by Name. Next, you use SETASCENDING to sort City in descending order instead.

```
page 50100 MyCustomerList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("City"; City)
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        SetCurrentKey(City, Name);
        SetAscending(Name, false);
    end;

}
```

If you publish the page as a web service, and read the OData feed, you'll see the records sorted in ascending alphabetical order by city and descending alphabetical order by name. However, if you open the page in the client the city and name are both sorted in ascending order.

## See Also

[SETCURRENTKEY Method](record-setcurrentkey-method.md)
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)