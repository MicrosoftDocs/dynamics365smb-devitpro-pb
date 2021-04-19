---
title: "Using Filter Expressions in OData URIs"
description: Learn how to use filter expressions in OData URIs to limit the results returned in a document.
author: jswymer
ms.author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
---
# Using Filter Expressions in OData URIs

You use filter expressions in OData URIs to limit the results in a returned document. This article lists the filter expressions, and describes the equivalent field or table filter in AL. It provides examples of syntax for using filter expressions in OData URIs and applications.  

## Filter Expressions  
 To add a filter to an OData URI, add `$filter=` to the end of the name of the published web service. For example, the following URI filters the **City** field in the **Customer** page to return all customers who are located in Miami:  

```  
https://localhost:7048/BC130/OData/Company('CRONUS International Ltd.')/Customer?$filter=City eq 'Miami'  
```  

 The following table shows the filters that are supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData web services and the equivalent AL filter expressions. All examples are based either on page 21, Customer \(published as **Customer**\), or on page 20, General Ledger Entry \(published as **GLEntry**\).  

> [!NOTE]  
> Filters that do not have equivalent AL expressions might take longer to process compared to filters that do have equivalent AL expressions. The reason is that filters that do not have equivalent AL expressions are processed on the [!INCLUDE[server](../developer/includes/server.md)] tier, while filters that do have equivalent AL expressions are processed on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database tier.  

|Definition|Example and explanation|Equivalent AL expression|  
|----------------|-----------------------------|---------------------------------|  
|Select a range of values|`$filter=Entry_No gt 610 and Entry_No lt 615`<br /><br /> Query on GLEntry service. Returns entry numbers 611 through 614.|..|  
|And|`$filter=Country_Region_Code eq 'ES' and Payment_Terms_Code eq '14 DAYS'`<br /><br /> Query on Customer service. Returns customers in Spain where Payment\_Terms\_Code=**14 DAYS**.|&|  
|Or|`$filter= Country_Region_Code eq 'ES' or Country_Region_Code eq 'US'`<br /><br /> Query on Customer service. Returns customers in Spain and the United States.<br /><br /> **Alert:** You can use OR operators to apply different filters on the same field. However, you cannot use OR operators to apply filters on two different fields.|&#124;|  
|Less than|`$filter=Entry_No lt 610`<br /><br /> Query on GLEntry service. Returns entry numbers that are less than 610.|\<|  
|Greater than|`$filter= Entry_No gt 610`<br /><br /> Query on GLEntry service. Returns entry numbers 611 and higher.|>|  
|Greater than or equal to|`$filter=Entry_No ge 610`<br /><br /> Query on GLEntry service. Returns entry numbers 610 and higher.|>=|  
|Less than or equal to|`$filter=Entry_No le 610`<br /><br /> Query on GLEntry service. Returns entry numbers up to and including 610.|\<=|  
|Different from \(not equal\)|`$filter=VAT_Bus_Posting_Group ne 'EXPORT'`<br /><br /> Query on Customer service. Returns all customers with VAT\_Bus\_Posting\_Group not equal to EXPORT.|\<>|  
|endswith|`$filter=endswith(VAT_Bus_Posting_Group,'RT')`<br /><br /> Query on Customer service. Returns all customers with VAT\_Bus\_Posting\_Group values that end in RT.|\*|  
|startswith|`$filter=startswith(Name, 'S')`<br /><br /> Query on Customer service. Returns all customers names beginning with “S”.||  
|contains|`$filter=contains(Name, 'urn')`<br /><br /> Query on Customer service. Returns customer records for customers with names containing the string “urn”.||  
|indexof|`$filter=indexof(Location_Code, 'BLUE') eq 0`<br /><br /> Query on Customer service. Returns customer records for customers having a location code beginning with the string BLUE.||  
|replace|`$filter=replace(City, 'Miami', 'Tampa') eq 'CODERED'`||  
|substring|`$filter=substring(Location_Code, 5) eq 'RED'`<br /><br /> Query on Customer service. Returns true for customers with the string RED in their location code starting as position 5.||  
|tolower|`$filter=tolower(Location_Code) eq 'code red'`||  
|toupper|`$filter=toupper(FText) eq '2ND ROW'`||  
|trim|`$filter=trim(FCode) eq 'CODE RED'`||  
|concat|`$filter=concat(concat(FText, ', '), FCode) eq '2nd row, CODE RED'`||  
|round|`$filter=round(FDecimal) eq 1`||  
|floor|`$filter=floor(FDecimal) eq 0`||  
|ceiling|`$filter=ceiling(FDecimal) eq 1`||  

## Referencing Different Data Types in Filter Expressions

Use the appropriate notation for different data types with filter expressions.  

- String values must be delimited by single quotation marks.  

- Numeric values require no delimiters.  

## See Also

[OData Web Services](OData-Web-Services.md)  
[Microsoft OData Docs - Query options overview](/odata/concepts/queryoptions-overview)  