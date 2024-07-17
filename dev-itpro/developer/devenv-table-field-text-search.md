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

# Enable text search on table fields

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define which table fields that should be included in optimized text search. 

The optimized text search is used in a number of search functionality in [!INCLUDE[prod_short](includes/prod_short.md)], such as in the company-wide search, but you can also use optimized text search in your own AL code.

## Example syntax (table fields)

The following example shows how text search is enabled on the field level:

```AL
table 50104 Address
{
    Caption = 'Sample table';

    fields
    {
        field(1; Address; Text[50])
        {
            Caption = 'Address retrieved by Service';
            // in 2024 release wave 2, you can define that table fields are included in optimized text search
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

## Filter syntax for optimized text search

To use optimized text search in AL, use the new `&&` operator when setting a filter, as illustrated in the following example 

```AL
// optimized text search without wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString);
```

You can also include wildcards in optimized text search by adding the `*` symbol to the search clause as illustrated in the following example 

```AL
// optimized text search with wildcard
Rec.SetFilter(Rec.Field, '&&' + SearchString + '*' ); 
```

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

## See also

TODO: add link to methods-auto article
[Table object](devenv-table-object.md)
[Tables overview](devenv-tables-overview.md)
