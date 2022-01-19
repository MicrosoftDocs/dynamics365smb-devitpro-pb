---
title: "TestAction.Invoke() Method"
description: "Invokes an action on a test page."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# TestAction.Invoke() Method
> **Version**: _Available or changed with runtime version 1.0._

Invokes an action on a test page.


## Syntax
```AL
 TestAction.Invoke()
```

## Parameters
*TestAction*  
&emsp;Type: [TestAction](testaction-data-type.md)  
An instance of the [TestAction](testaction-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 All actions that are available on the page are also available on the test page.  

## Example

```
var
    InvtDocumentHeader: Record "Invt. Document Header";
    InvtShipment: TestPage "Invt. Shipment";
begin
    // Open Item Shipment page
    InvtShipment.OpenEdit;
    InvtShipment.GotoRecord(InvtDocumentHeader);

    // Push "Print" on the page ribbon.
    InvtShipment.Print.Invoke();
end;
```

## See Also
[TestAction Data Type](testaction-data-type.md)  
[No Method](../testpage/testpage-no-method.md)
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)