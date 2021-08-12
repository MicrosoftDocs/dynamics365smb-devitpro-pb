---
title: "QueryCategory Property"
description: "Used to indicate a given query can be made available as views displayed on certain main entity lists."
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
# QueryCategory Property
> **Version**: _Available or changed with runtime version 3.0._

Used to indicate a given query can be made available as views displayed on certain main entity lists. On queries, the QueryCategory property specifies one or more query categories that the object supports. On pages, QueryCategory specifies the query category that the page supports.

## Applies to
-   Page
-   Query

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```al
query 50100 QueryWithCategories
{
    QueryType = Normal;
    QueryCategory = 'Customer', 'Items';

    elements
    {
        dataitem(DataItemName; Customer)
        {
            column(ColumnName; Name)
            {

            }

        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
```

```al
page 50111 CustomerSourceTable
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    QueryCategory = 'Customer';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}
```

## Remarks

With this functionality, you can create your own queries through extensions and then have them assigned to a main list page by setting the QueryCategory property. This way you can direct users to related information based on a query even where the data is not coming from a single table.

For the syntax examples above, when page **CustomerSourceTable** is opened in the client, query **QueryWithCategories** will be available as a view. **QueryWithCategories** could also be used on other pages by setting the QueryCategory of the pages to either `'Customer'` or `'Items'`.

## See Also

[Properties](devenv-properties.md)   
[Query Object](../devenv-query-object.md)  
[Page Object](../devenv-page-object.md)