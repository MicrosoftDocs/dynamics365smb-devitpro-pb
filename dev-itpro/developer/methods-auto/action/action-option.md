---
title: "Action System Option"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# Action Option Type
> **Version**: _Available from runtime version 1.0._

Represents the action that the user took on the page.

## Members
|  Member  |  Description  |
|----------------|---------------|
|None|Represents the result of running a page.|
|OK|<br/>      Represents the result of the user closing a page window by performing one of the following actions:<br/>      - Chooses the **OK** button.<br/>      - Chooses the **X** button when there was no **Cancel** button on the window.<br/>      - Presses the Esc key when there is no **Cancel** button on the window.<br/>    |
|Cancel|<br/>      Represents the result of the user closing a page window by performing one of the following actions:<br/>      - Chooses the **Cancel** button.<br/>      - Chooses the **X** button when there is a **Cancel** button on the window.<br/>      - Presses the Esc key when there is a **Cancel** button on the window<br/>    |
|LookupOK|<br/>      Represents the result of the user closing a lookup window by performing one of the following actions:<br/>      - Chooses the **OK** button.<br/>      - Chooses an item in the Lookup window.<br/>    |
|LookupCancel|Represents the result of the user closing a lookup window by choosing the **Cancel** button.|
|Yes|Represents the result of the user closing a confirmation window by choosing the **Yes** button.|
|No|<br/>      Represents the result of the user closing a confirmation window by performing one of the following actions:<br/>      - Chooses the No button.<br/>      - Chooses the X button.<br/>      - Presses the Esc key.<br/>    |
|RunObject|Represents the result of the user selecting an option that ran another object.|
|RunSystem|Represents the result of the user selecting an option that ran an external program.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  