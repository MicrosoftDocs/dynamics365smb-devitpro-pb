---
title: "Strings"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b1b49e36-5e2a-4ebf-9827-d5fa65e07564
caps.latest.revision: 9
---
# Strings
This section contains the following topics:  

-   [BigText Data Type](BigText-Data-Type.md)  

-   [Code Data Type](Code-Data-Type.md)  

-   [Text Data Type](Text-Data-Type.md)  

-   [BigText Functions](BigText-Functions.md)  

-   [String Functions](String-Functions.md)  

 We recommend the following guidelines for using the BigText, Code, and Text data types:  

-   Use the BigText data type for large documents.  

-   If a text field is part of a primary key, then use the Code data type.  

-   If a text field has a TableRelation, then use the Code data type.  

-   If the field is assigned values from a Code field, then use the Code data type. For example, if the **Document No.** field in the **G/L Entry** table is copied from the primary key field **No.** in the **Sales Header** or **Purchase Heade**r table, then use the Code data type for the **Document No.** field.  

-   For all other text fields, use the Text data type.  

 In addition to the system functions that are available for string data types, you can also use C/AL operators on strings. For example, to concatenate two strings, use the + operator. For more information, see [C/AL Operators](C-AL-Operators.md).
