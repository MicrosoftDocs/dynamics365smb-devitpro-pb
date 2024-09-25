---
title: Enable optimized text search on table fields
description: Description of how you use enable text search on table fields.
author: kennieNP
ms.reviewer: jswymer
ms.date: 09/25/2024
ms.topic: conceptual
ms.author: kepontop
ms.collection: get-started
---
# Enable optimized text search on table fields

[!INCLUDE[2024rw2_and_later](includes/2024rw2_and_later.md)]

Business Central includes an optimized text search feature on table fields, which uses the full-text search feature in SQL Server and Azure SQL Database databases. Optimized text search lets users and applications run full-text queries against character-based data in tables. This article explains how to enable optimized text search on table fields and how you can use it to filter data in AL.

In the client, optimized text search is used in various search functionalities, such as in the company-wide data search and on lists that include optimized text search fields, referred to as modern search. Learn more in [Search for a record in company data](/dynamics365/business-central/ui-search-data) and [Search lists](/dynamics365/business-central/ui-enter-criteria-filters#searching). By enabling optimized text search on fields in extensions, you can significantly optimize data search in your AL code.

## Enable optimized text search on fields

To enable optimized text search on field, set the [OptimizeForTextSearch property](properties/devenv-optimizefortextsearch-property.md) to `true`. The following example shows how text search is enabled on the field level:

```AL
table 50100 Address
{
    Caption = 'Sample table';

    fields
    {
        field(1; Address; Text[50])
        {
            Caption = 'Address retrieved by Service';
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

## Filter syntax for optimized text search

To use optimized text search in AL, you can add the `&&` operator when setting a filter, as illustrated in the following example: 

```AL
// Optimized text search without wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString);
```

You can also include wildcards in full-text search by adding the `*` symbol to the search clause as illustrated in the following example 

```AL
// Optimized text search with wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString + '*' ); 
```

## Optimized text search semantics

Optimized text search differs from the traditional wildcard search using the '*' symbol in the following ways:

- Optimized text search is always case insensitive, where wildcard search is case sensitive unless either the dataset collation is insensitive or the `@` operator is prefixed.
- Optimized text search is always accent insensitive, where wildcard search is accent sensitive unless either the dataset collation is insensitive or the `@` operator is prefixed.
- Optimized text search searches for words within fields, where wildcard search for letters within fields. That means full-text search can find words or prefixes of words within a field, but wildcard search can find arbitrary substrings within words. Learn more in the following example.

### Example

Consider a database that includes the item `london swivel chair`. The following table demonstrates different queries on the item and indicates whether there's a match.

|Query|Match|
|-|:-:|
| `*swivel*`  | Yes|
| `&&swivel`  | Yes|
| `*swiv*`    | Yes|
| `&&swiv`    | No|
| `&&swiv*`   | Yes|
| `*hair*`    | Yes|
| `&&hair`    | No|
| `&&hair*`   | No|

## Install full-text search on the database (on-premises only)

To support optimized text search in Business Central on-premises, the SQL Server instance must include the full-text search feature.

[!INCLUDE[upgrade-install-full-text-serach-sql](includes/upgrade-install-full-text-search-sql.md)]

## See also

[OptimizeForTextSearch property](properties/devenv-optimizefortextsearch-property.md)  
[IsOptimizeForTextSearch method](methods-auto/fieldref/fieldref-isoptimizedfortextsearch-method.md)
[Table object](devenv-table-object.md)
[Tables overview](devenv-tables-overview.md)  
[Full-text search in SQL](/sql/relational-databases/search/full-text-search)  
