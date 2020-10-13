---
title: "When using 'OnInstallPerCompany' you should also add 'Company - Initialize'::'OnCompanyInitialize' event subscriber."
ms.author: solsen
ms.custom: na
ms.date: 10/13/2020
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
# CodeCop Rule AA0235
When using 'OnInstallPerCompany' you must also add 'OnCompanyInitialize' subscription.  

## Description
When using trigger 'OnInstallPerCompany' in a codeunit with 'Subtype = Install' you must also add a 'Company - Initialize'::'OnCompanyInitialize' subscription.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
'OnInstallAppPerCompany' is only run on companies that exist when installing the extension. Many extensions were missing a 'OnCompanyInitialize' subscription, so companies that were created after the extension installation were missing setup that the extension should do. For example, insertion of records in some tables was done only for existing companies and not for new ones.

## Bad code example
```
codeunit 1160 "AP Install"
{
   Subtype = Install;

   trigger OnInstallAppPerCompany()

   begin
   ...
   end;
}
```

## Good code example
```
codeunit 1160 "AP Install"
{
   Subtype = Install;

   trigger OnInstallAppPerCompany()

   begin
   ...
   end;

   [EventSubscriber(ObjectType::Codeunit, Codeunit::""Company - Initialize"", 'OnCompanyInitialize', '', false, false)]

   local procedure CompanyInitialize()
   begin
   ...
   end;
}
```

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  