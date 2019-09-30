---
title: "Access Property"
description:
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Access Property

[!INCLUDE[2019_releasewave2.md](../../includes/2019_releasewave2.md)]

The `Access` property is an access modifier which allows controlling the accessibility level of methods and objects. If the `Access` property is not specified, the default is `Public`.

## Applies To  

- Tables and table fields
- Codeunits
- Queries

## Property Values  

### Object level
The **Access** property values are as described below for objects:

|Access modifier    |Level of accessibility |
|-------------------|-----------------------|
|Internal           |The object can be accessed only by code in the same module, but not from another module.|
|Public             |The object can be accessed by any other code in the same module and in other modules that references it. This is the default value.|

### Table field level
For table fields there are two additional settings for **Access** and you have the following settings available:

|Access modifier    |Level of accessibility |
|-------------------|-----------------------|
|Internal           |The field can be accessed only by code in the same module, but not from another module.|
|Local              |The field can be accessed only by code in the same table or table extension where the field is defined.|
|Protected          |The field can be accessed only by code in the same table or tableextensions of that table.|
|Public             |The field can be accessed by any other code in the same module and in other modules that references it.|

## Syntax
```
table 50111 MyTable
{
    DataClassification = CustomerContent;
    Access = Internal;
    ...
    
```
```
table 50111 MyTable
{
    DataClassification = CustomerContent;
        
    fields
    {
        field(1;MyField; Integer)
        {
            DataClassification = CustomerContent;
            Access = Protected;
    ...            

```
```
query 50114 MyQuery
{
    QueryType = Normal;
    Access = Internal;
    ...
```
```
codeunit 50113 MyCodeunit
{
    Access = Internal;
    ...

```

## See Also  
[Properties](devenv-properties.md)  
[Extensible Property](devenv-extensible-property.md)  
[Protected Variables](../devenv-protected-variables.md)