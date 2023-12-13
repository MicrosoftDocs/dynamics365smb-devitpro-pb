---
title: "System.GuiAllowed() Method"
description: "Checks whether the AL code can show any information on the screen."
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
# System.GuiAllowed() Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether the AL code can show any information on the screen.


## Syntax
```AL
Ok :=   System.GuiAllowed()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `System.GuiAllowed` method returns true if the session where your AL code is running allows you to use methods that interact with the user, such as Dialog.Open, Dialog.Update, Window.Open, Window.Update, or System.Error.

If the same codeunit needs to run both in the UI but also in the background (in a scheduled task or with a job queue entry) or in a web service call (SOAP/OData/API), then use `if GuiAllowed() then` calls to encapsulate AL code that interact with the user.

## Example  

This example shows how to use the GuiAllowed method.  

```AL
if GuiAllowed then  
    Message('Code is running on a client.');  
```  

 If the code runs on a client, which means that the user interface is available, a message box will appear with the following message.  

 **Code is running on a client**  

If the code runs in a web service call or in the background, then the message will not be displayed.  

## Example (Shopify integration)

This example shows how the Shopify integration use GuiAllowed to provide feedback to the user when the code is running in the client, while allowing the business logic to also run in the background or being called from a web service.

```AL
procedure AddItemToShopify(Item: Record Item; ShopifyShop: Record "Shpfy Shop")
var
    ProgressDialog: Dialog;
begin
    if GuiAllowed then begin
        ProgressDialog.Open(DialogMsg);
        ProgressDialog.Update(1, SyncInformationProgressLbl);
    end;

    // business logic code here

    if ShopifyShop."Sync Item Images" = ShopifyShop."Sync Item Images"::"To Shopify" then begin
        if GuiAllowed then
            ProgressDialog.Update(1, FinishSyncProgressLbl);
        // business logic code here
    end;

    // some more business logic
end;
```  


## See Also

[System Data Type](system-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)