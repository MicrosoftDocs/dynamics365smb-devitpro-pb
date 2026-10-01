---
title: "Compiler Error AL0922"
description: "The method '{0}' cannot be used as the implementation for the interface method '{1}' because it has 'OnPrem' scope."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0922

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The method '{0}' cannot be used as the implementation for the interface method '{1}' because it has 'OnPrem' scope.

## Description
Interface implementations cannot have OnPrem scope because interfaces can be invoked in cloud environments where OnPrem methods are not available.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Interface methods can be called from any environment, including cloud (SaaS). A method marked with `[Scope('OnPrem')]` is only available in on-premises deployments. If such a method implements an interface, calling the interface from a cloud environment would fail at runtime.

## How to fix it

Remove the `[Scope('OnPrem')]` attribute from the implementing method. If the method contains on-premises-only logic, refactor it so the interface implementation works in all environments.

## Example of code that triggers AL0922

```al
interface IDataExporter
{
    procedure Export(data: Text);
}

codeunit 50100 FileExporter implements IDataExporter
{
    // Error: OnPrem method cannot implement an interface method.
    [Scope('OnPrem')]
    procedure Export(data: Text);
    begin
        // File I/O that only works on-premises
    end;
}
```

## Example of how to fix it

Remove the `OnPrem` scope and use cloud-compatible APIs, or redesign your feature.

```al
interface IDataExporter
{
    procedure Export(data: Text);
}

codeunit 50100 FileExporter implements IDataExporter
{
    procedure Export(data: Text);
    var
        TempBlob: Codeunit "Temp Blob";
    begin
        // Use cloud-compatible approach
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
