---
title: "Extension Packages Capability Support Matrix"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 83351319-ce8a-4a84-9831-f68ed9f14835
ms.author: solsen
---

# Extension Capability Support Matrix
If you want to modify existing code, use extensions to do so. For more information to get started, see [Development in AL](developer/devenv-dev-overview.md). In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can add new objects of the following object types to an extension:  

- [Table object](developer/devenv-table-object.md)
- [Table extension object](developer/devenv-table-ext-object.md)
- [Page object](developer/devenv-page-object.md)
- [Page extension object](developer/devenv-page-ext-object.md)
- [Page customization object](developer/devenv-page-customization-object.md)
- [Profile object](developer/devenv-profile-object.md)
- [Report object](developer/devenv-report-object.md)
- [XmlPort object](developer/devenv-xmlport-object.md)
- [Query object](developer/devenv-query-object.md)
- [Control add-in object](developer/devenv-control-addin-object.md)
- [Codeunit object](developer/devenv-codeunit-object.md)

You cannot delete any existing objects. To see the properties that apply to the available objects, see [Properties](developer/properties/devenv-properties.md). 

> [!IMPORTANT]  
> When developing cloud solutions, .NET is not considered secure, and you must rewrite code to use other classes that the extension framework makes available. For more information, see [HTTP, JSON, TextBuilder, and XML API Overview](developer/devenv-restapi-overview.md).

<!--
## Restricted properties  
 There are restrictions on certain property changes for modified objects. The following sections list the properties you cannot change. The cmdlets that create and install packages will halt with errors if any of these properties are changed in your extension.  

### Restricted properties on existing page modifications  
 You cannot change the values for the following properties for existing [!INCLUDE[navnow](includes/navnow_md.md)] pages in an extension.  

-   AccessByPermission  

-   AssistEdit  

-   AutoSplitKey  

-   CardPageID  

-   CharAllowed  

-   ContainerType  

-   ControlAddIn  

-   Data Type  

-   DataLength  

-   DateFormula  

-   DelayedInsert  

-   DeleteAllowed  

-   DrillDown  

-   DrillDownPageID  

-   Editable  

-   ExtendedDatatype  

-   FieldClass  

-   GroupType  

-   ID  

-   InsertAllowed  

-   LinkedObject  

-   Lookup  

-   LookupPageID  

-   MaxValue  

-   MinValue  

-   ModifyAllowed  

-   MultipleNewLines  

-   Name  

-   NotBlank  

-   Numeric  

-   PageType  

-   PartType  

-   PasteIsValid  

-   Permissions  

-   PopulateAllFields  

-   RefreshOnActivate  

-   SourceExpr  

-   SourceTable  

-   SourceTableTemporary  

-   SourceTableView  

-   SubType  

-   SystemPartID  

-   TableRelation  

-   TableType  

-   TestTableRelation  

-   ValidateTableRelation  

-   ValuesAllowed  

 Most of these are typically not properties changed through customization as they can have a negative effect on the [!INCLUDE[navnow](includes/navnow_md.md)] deployment.  

### Restricted properties on existing table modifications  
You cannot change the values for the following properties for existing tables and fields in an extension.  

#### Table Properties
-   Name  
-   DataPerCompany  
-   Permissions  
-   LookupPageID  
-   DrillDownPageID  
-   PasteIsValid  
-   LinkedObject  
-   TableType  

You can add table keys, but you cannot delete or modify existing keys.  

#### Field Properties
-   Name  
-   AccessByPermission  
-   Compressed  
-   Data Type  
-   DataLength  
-   DateFormula  
-   ExtendedDataType  
-   FieldClass  
-   MaxValue  
-   MinValue  
-   NotBlank  
-   Numeric  
-   Owner  
-   SQL Data Type  
-   SubType \(BLOB\)  
-   TableIDExpr  
-   TableRelation  
-   TestTableRelation  
-   ValidateTableRelation  
-   ValuesAllowed Width  

You can add fields to a table group, but you cannot remove fields or groups.  
-->

## See Also  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)  
[Development in AL](developer/devenv-dev-overview.md)  
