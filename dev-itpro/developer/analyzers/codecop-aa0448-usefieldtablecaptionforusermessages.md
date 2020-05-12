---
title: "You must use the FieldCaption method instead of the FieldName method and TableCaption method instead of TableName method."
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Rule AA0448
You must use the FieldCaption method instead of the FieldName method and TableCaption method instead of TableName method.  

## Description
If you want to enable your application for multilanguage functionality, you must use the FieldCaption and TableCaption methods instead of the FieldName and TableName methods.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule

To prevent exposing personal data, make sure that Email or Phone No information is not available in the source code because that might be collected as telemetry data.

## Bad code example
```
table 18 Customer
{
   ...
   fields
   {
      field(1; Email; Text[50]){ CaptionML = ENU = 'john.smith@contoso.com'; }
   }
   ...
}
```

## Good code example
```
table 18 Customer
{
   ...
   fields
   {
      field(1; Email; Text[50]){ CaptionML = ENU = 'Email'; }
   }
   ...
}
```
## Remarks
The following elements are checked in code: object names, table captions, table field names, table field captions, page captions, page field names, page field captions, page field tooltips, the value of labels (in declaration), the value of text constants, translation files (tags <source>, <target>, <note>), and the app manifest file (Name, Brief, Description, Publisher).

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  