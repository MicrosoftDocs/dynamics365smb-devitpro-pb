---
title: "TestPage.Trap() Method"
description: "Traps the next test page that is invoked and assigns it to the test page variable."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestPage.Trap() Method
> **Version**: _Available or changed with runtime version 1.0._

Traps the next test page that is invoked and assigns it to the test page variable.


## Syntax
```AL
 TestPage.Trap()
```

## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Only non-modal pages can be trapped. To trap modal pages that you invoke with the RunModal method or the [Page.RunModal() Method](../page/page-runmodal--method.md), you must use the ModalPageHandler method. For more information, see [Create Handler Methods](../../devenv-creating-handler-methods.md).

## Example

This example shows how to use the `Trap` method to trap a call to open a test page so that the opened page is assigned to a variable.

```al
local procedure TrapPage()

    begin
        CustomerCard.OpenEdit;
        CustomerStatistics.Trap(); // Next page invoked will be trapped and assigned to the CustomerStatistics variable  
        CustomerCard."Customer/Item Statistics".Invoke(); // Invokes an action from the Customer Card page   
        CustomerStatistics."Balance (LCY)".AssertEquals(0); // Now that the CustomerStatistics test page is open, use the variable to test the page

    end;

    var
        CustomerCard: TestPage "Customer Card";
        CustomerStatistics: TestPage "Customer Statistics";

```

## See Also

[TestPage Data Type](testpage-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)