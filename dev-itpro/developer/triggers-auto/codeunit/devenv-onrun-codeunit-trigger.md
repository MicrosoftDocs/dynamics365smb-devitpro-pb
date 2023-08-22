---
title: "OnRun (Codeunit) Trigger"
description: "Runs when a codeunit is run."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnRun (Codeunit) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when a codeunit is run.


## Syntax
```AL
trigger OnRun()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The `OnRun()` trigger is used to initialize the codeunit. A codeunit can be called from another codeunit, a page, or a report. The `OnRun()` trigger is run when the codeunit is called. The following pseudo code illustrates how the `OnRun()` trigger is run when a codeunit is called from a page.

```AL
page 50111 MyPage
{
    trigger OnOpenPage();
    begin
        Codeunit.Run(Codeunit::RunMyCode);
    end;
}

codeunit 50110 RunMyCode
{
    trigger OnRun()
    begin
        // Run some code here
    end;
}
```

## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
