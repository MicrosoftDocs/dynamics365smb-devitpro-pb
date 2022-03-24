---
title: "Record.AddLink(Text [, Text]) Method"
description: "Adds a link to a record."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.AddLink(Text [, Text]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a link to a record.


## Syntax
```AL
[ID := ]  Record.AddLink(URL: Text [, Description: Text])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*URL*  
&emsp;Type: [Text](../text/text-data-type.md)  
  

*[Optional] Description*  
&emsp;Type: [Text](../text/text-data-type.md)  
  


## Return Value
*[Optional] ID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When you add a link to a page or a table, an entry is created in the **Record Link** system table. Each entry is given an ID.  
  
The URL can be a link to a website, a file stored on the local computer or on a remote computer, or a link to a [!INCLUDE [prod_short](../../includes/prod_short.md)] page.  

## Example

In this example, you get the customer record that has a primary key number of 15000 and then add the specified URL to the **Record Link** table for that customer. You can then view the link in the **Links** FactBox on the Customer list or Customer card pages. 

```al
codeunit 50111 CustomerLink
{
    trigger OnRun()
    var
        Customer: Record Customer;
        Id: Integer;

    begin
        Customer.Get('15000');
        Id := Customer.AddLink('www.northwindtraders.com', 'Northwind Traders');
    end;
}
```

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)