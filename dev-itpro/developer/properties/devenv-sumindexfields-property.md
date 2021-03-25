---
title: "SumIndexFields Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# SumIndexFields Property
> **Version**: _Available from runtime version 1.0._

Specify which fields should be the "aggregation fields" in a **SumIndexField Technology (SIFT)** index, if applicable.  

## Applies to
-   Table Key


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
key(<key name>;<comma-separated list of lookup fields>) { 
            SumIndexFields=<comma-separated list of aggregation fields>; 
        }
```  
 
## Example

```AL
table 50100 Student
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; Code; Text[50])
        {
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(2; FirstNames; Text[100])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; ECTSPoints; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(4; NumberOfCourses; Integer)
        {
            DataClassification = CustomerContent;
        }
    }
    // this defines a SIFT index on Code, FirstNames with aggregations fields for count, SUM(ECTSPoints), and SUM(NumberOfCourses)
    // Because MaintainSqlIndex is set to false, no non-clustered index is created on (Code,FirstNames)
    // 
    keys
    {
        key(SIFTKeyOnCode;Code,FirstNames) { 
            SumIndexFields=ECTSPoints,NumberOfCourses; 
            MaintainSqlIndex = false;            
        }
    }
}
```

## Remarks  

You can select up to 20 SumIndexFields for each key.  
  
The fields must be of a numeric datatype \(Decimal, Integer, BigInteger, or Duration\).  
  
Changing existing keys may affect the behavior of the application since other parts of your application may depend on the existence of certain keys.  

## See Also  

[Properties](devenv-properties.md)   
[MaintainSIFTIndex Property](devenv-maintainsiftindex-property.md)   
[MaintainSQLIndex Property](devenv-maintainsqlindex-property.md)   
[AL Data Types](../methods-auto/library.md)