---
title: Enable text search on table fields
description: Description of how you use enable text search on table fields.
author: kennieNP
ms.reviewer: jswymer
ms.date: 07/17/2024
ms.topic: conceptual
ms.author: kepontop
ms.collection: get-started
---
# Enable full-text search on table fields

[!INCLUDE[2024rw2_and_later](includes/2024rw2_and_later.md)]

Business Central supports the full-text search feature in SQL Server and Azure SQL Database databases, which lets users and applications run full-text queries against character-based data in tables. Learn more at [Full-text search in SQL](/sql/relational-databases/search/full-text-search).

This article explains how you can specify full-text search on table fields and use it in data filters in AL. By enabling full-text search on fields, you can significantly enhance data search in your AL code.

In the client, full-text search is used in various search functionalities, such as in the company-wide data search and on lists that include full-text search fields, referred to as modern search. Learn more in [Search for a record in company data](/dynamics365/business-central/ui-search-data) and [Search lists](/dynamics365/business-central/ui-enter-criteria-filters#searching).

## Enable full-text search on fields

To enable full-text search on field, set the [OptimizeForTextSearch property](properties/devenv-optimizefortextsearch-property.md) to `true`. The following example shows how text search is enabled on the field level:

```AL
table 50104 Address
{
    Caption = 'Sample table';

    fields
    {
        field(1; Address; Text[50])
        {
            Caption = 'Address retrieved by Service';
            // In 2024 release wave 2 and later, you can define that table fields are included in full-text search
            OptimizeForTextSearch = true;
        }
        field(2; Locality; Text[30])
        {
            Caption = 'Locality retrieved by Service';
            OptimizeForTextSearch = true;
        }
        field(3; "Town/City"; Text[30])
        {
            Caption = 'Town/City retrieved by Service';
            OptimizeForTextSearch = true;            
        }
        field(4; County; Text[30])
        {
            Caption = 'County retrieved by Service';
            OptimizeForTextSearch = true;
        }
        field(5; IsValidated; Boolean)
        {
            Caption = 'Address validated yet?';
        }        
    }
```

You can use the `OptimizedForTextSearch` property on the **Field** virtual table. You can also use the [IsOptimizedForTextSearch() method](methods-auto/fieldref/fieldref-isoptimizedfortextsearch-method.md) on FieldRef type variables of the FieldRef data type.


## Filter syntax for full-text search

To use full-text search in AL, you can add the `&&` operator when setting a filter, as illustrated in the following example: 

```AL
// Full-text search without wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString);
```

You can also include wildcards in full-text search by adding the `*` symbol to the search clause as illustrated in the following example 

```AL
// optimized text search with wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString + '*' ); 
```

This syntax supports a subset of SQL Server's `CONTAINS` predicate. Learn more at [CONTAINS (Transact-SQL)](/sql/t-sql/queries/contains-transact-sql).

## Optimized text search semantics

Optimized text search differs from the traditional search using the '%' symbol in the following ways:

- TODO

### Example 

Hvis vi antager vi har rows med foelgede data i Description feltet:
1 "Fast Computer Human Trainer"
2 "Computerization Television"
3 "'Blue Computer - Telegram'"
4 "Red Computer - Telegram'"
 
 
Eksemple uden prefix: 
Item.SetFilter(Item.Description, '&&computer');
Item.FindSet()... 
 
Matcher 1, 3, 4.
Eksemple uden prefix flere ord:
Item.SetFilter(Item.Description, '&&computer trainer');
Item.FindSet()... 
 
Matcher ingen.
Der maa ikke vaere ord imellem.

## Install full-text search on the database (on-premises only)

For full-text search to work in Business Central on-premsises, it must be be installed on the SQL Server instance. 

[!INCLUDE[upgrade-install-full-text-serach-sql](includes/upgrade-install-full-text-search-sql.md)]

## See also

[OptimizeForTextSearch property](properties/devenv-optimizefortextsearch-property.md)  
[IsOptimizeForTextSearch method](methods-auto/fieldref/fieldref-isoptimizedfortextsearch-method.md)
[Table object](devenv-table-object.md)
[Tables overview](devenv-tables-overview.md)
