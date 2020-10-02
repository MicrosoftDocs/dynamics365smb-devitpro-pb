---
title: "Adding Custom Filter Tokens"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: mikebcMSFT
---

# Adding Custom Filter Tokens

In the client, when filtering lists using the filter pane, users can enter filter tokens, which are special words that resolve to one or more values. This powerful feature makes filtering easier by reducing the need to navigate to other pages to look up values to enter as filter criteria.

There are several useful filter tokens available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For example, entering **%mycustomers** in a **Customer No.** field will resolve to the set of customers in the user's **My Customers** list such as `1001|1002`, making it easy to find relevant sales orders for customers 1001 and 1002.

You can add custom filter tokens and make these available in any language and across the application. To add your custom filter token, you need to define the token word that users will enter as filter criteria, and define a handler that resolves the token to a concrete value at runtime. For more information, see [Filter Tokens](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Filter%20Tokens) in our ALAppExtensions repository on GitHub.

## Defining the token word and the handler

To create the token word, start by defining a multi-language text string for your word. Subscribe to the `OnResolveTextFilterToken` event associated with the `MakeTextFilter` method from the `Filter Tokens` codeunit.  
In the event subscriber, if the value of the `TextFilter` parameter contains the token string, process its value and construct the final filter string. If the filter string must contain multiple values, you must handle the operators that join them by adding the `|` filter symbol (OR operation). Complete the operation by setting the value of the `TextFilter` parameter to the value of the final filter string.

> [!TIP]  
> Filter criteria will often contain symbols along with filter tokens. We recommend that you only modify the filter token you have introduced and preserve the rest of the filter string. 

## Example 

This example shows how you can use the guidelines above to create the **%MYTOKEN** filter token. This will return a filter with the accounts marked as favorite by the user. 

> [!NOTE]  
> To keep this sample short and simple, the entire filter string is overwritten.

```
codeunit 50101 MyAccountFilterTokenSimple
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveTextFilterToken', '', true, true)]
    local procedure FilterMyAccounts(TextToken: Text; var TextFilter: Text; var Handled: Boolean)
    var
        MyAccount: Record "My Account";
        MaxCount: Integer;
    begin
        if StrLen(TextToken) < 3 then
            exit;

        if StrPos(UpperCase('MYTOKEN'), UpperCase(TextToken)) = 0 then
            exit;

       Handled := true;

        MaxCount := 20;
        MyAccount.SetRange("User ID", UserId());

        if MyAccount.FindSet() then begin
            MaxCount -= 1;
            TextFilter := MyAccount."Account No.";

            if MyAccount.Next() <> 0 then
                repeat
                    MaxCount -= 1;
                    TextFilter += '|' + MyAccount."Account No.";
                until (MyAccount.Next() = 0) or (MaxCount <= 0);
        end;
    end;

}

```
To try it out in the client, open the `Charts of Accounts` page, filter on **No.** field, and type in a substring that starts the same way with the chosen token word, like **%MYTO**.

<!--
## Filter token example
This example extends the application with a new token word "%mysalesperson" representing my salesperson code as defined in the user table.
-->

## Design considerations

Resolving tokens is intended to be fast, simple, and reliable. When implementing event subscribers to resolve filter tokens, keep in mind that these events can be triggered from any user task in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and in some cases may be triggered repeatedly such as when searching across columns. To improve usability and reduce the impact on performance, do consider the following practices:

 - Avoid implementing tokens that are only relevant to few business tasks, or assume they are used in the context of a specific page.
 - Avoid implementing tokens that are time-consuming to resolve. Examples of this include looking up records in large or poorly indexed tables, or fetching data from a remote service.  
 - Avoid implementing tokens that are complex or unreliable and may result in error.  
 - Avoid displaying pages, dialogs or any other form of interactive UI.  
 

## See Also 

[Sorting, Searching and Filtering Lists](/dynamics365/business-central/ui-enter-criteria-filters)  
