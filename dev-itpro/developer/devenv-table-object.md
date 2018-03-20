---
title: "Table Object"
description: "Description of the table object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Table Object
Tables are the core objects used to store data in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Regardless of how data is inputted to the product - from a web service to a finger swipe on the phone app, the results of that transaction will be recorded in a table. 

The structure of a table has four sections. The first block contains metadata for the overall table; the table type. The fields section describes the data elements that make up the table; their name and the type of data they can store. The keys section contains the definitions of the keys that the table needs to support. The final section details the triggers and code that can run on the table.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.      

## Snippet support
Typing the shortcut ```ttable``` will create the basic layout for a table object when using the AL Extension in Visual Studio Code.

## Table example
This table stores address information and has four fields; Address, Locality, Town/City, and County.

```
table 70000030 Address
{
    captionML = ENU='Sample table';
    DataPerCompany = true;

    fields
    {
        field(1;Address;Text[50])
        {
            Description='Address retrieved by Service';
        }
        field(2;Locality;Text[30])
        {
            Description='Locality retrieved by Service';
        }
        field(3;"Town/City";Text[30])
        {
            Description='Town/City retrieved by Service';
        }
        field(4;County;Text[30])
        {
            Description='County retrieved by Service';

            trigger OnValidate();
            begin
                ValidateCounty(County);
            end;

        }
    }
    keys
    {
        key(PrimaryKey;Address)
        {
            Clustered=TRUE;
        }
    }

    var
        Msg : TextConst ENU='Hello from my method';

    trigger OnInsert();
    begin

    end;

    procedure MyMethod();
    begin
        Message(Msg);
    end;
}
```

## See Also
[Table Extension Object](devenv-table-ext-object.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Table Keys](devenv-table-keys.md)  
[Table Properties](properties/devenv-table-properties.md)  
