---
title: "Fields of field class 'Normal' must use the DataClassification property and its value should be different from ToBeClassified"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# AppSourceCop Rule AS0016
Fields of field class 'Normal' must use the DataClassification property and its value should be different from ToBeClassified

## Description
Fields of field class 'Normal' must use the DataClassification property and its value must be different from ToBeClassified. FlowFields and FlowFilter fields are automatically set to the SystemMetadata data classification.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information about data classification, see the documentation on the [DataClassification](../properties/devenv-dataclassification-property.md) property and on [Classifying Data in Dynamics 365](../devenv-classifying-data.md).

> [!NOTE]  
> Tables and fields marked as [Obsolete Removed](../properties/devenv-obsoletestate-property.md) are and not deleted from the database. This is why they are 
also validated by this rule.

## How to fix this diagnostic?

In order to fix the diagnostics reported you must set the [DataClassification](../properties/devenv-dataclassification-property.md) property on the table fields in your extension following the guidelines defined in [Classifying Data in Dynamics 365](../devenv-classifying-data.md).

## Code examples triggering the rule

### Example 1 - No data classification specified

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[50]) { }
    }
}
```
The following example triggers the rule because the field `MyField` does not have any DataClassification specified.

### Example 2 - Data classification has to be classified

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[50]) 
        { 
            DataClassification = ToBeClassified;
        }
    }
}
```
The following example triggers the rule because the data classification for field `MyField` still has to be classified.

## Code example not triggering the rule

```AL
table 50100 MyTable
{
    fields
    {
        field(50100; MyField; Text[50]) 
        { 
            DataClassification = CustomerContent;
        }
    }
}
```

The following example does not trigger the rule because the data classification for field `MyField` still has a valid data classification specified.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
