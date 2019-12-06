---
title: "Adding custom filter tokens"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: mikebcMSFT
---

# Adding Filter Tokens

In the client, when filtering lists using the filter pane, users can enter filter tokens, which are special words that resolve to one or more values. This powerful feature makes filtering easier by reducing the need to navigate to other pages to look up values to enter as filter criteria.

There are several useful filter tokens available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For example, entering **%mycustomers** in a **Customer No.** field will resolve to the set of customers in the user's **My Customers** list such as `1001|1002`, making it easy to find relevant sales orders for customers 1001 and 1002.

You can add custom filter tokens and make these available in any language and across the application. To add your custom filter token, you need to define the token word that users will enter as filter criteria, and define a handler that resolves the token to a concrete value at runtime.

## Defining the token word and the handler

To create the desired token word, start by defining a multi-language text string for your word. Subscribe to the `OnBeforeMakeTextFilter` or `OnAfterMakeTextFilter` events associated with the `MakeTextFilter` method from the `TextManagement` codeunit.  
In the event subscriber, if the value of the `TextFilterText` parameter contains the token string proceed to process its value and construct the final filter string. If the filter string must contain multiple values, you must handle the operators that join them together, by inserting the `|` filter symbol (OR operation). Complete the operation by setting the value of the `TextFilterText` parameter to the value of the final filter string.

> [!TIP]  
> Filter criteria will often contain symbols along with filter tokens. It is recommended that you only modify the filter token you have introduced and preserve the rest of the filter string. 

## Example 

This example shows how you can use the guidelines above to create the **%MYTOKEN** filter token. This will return a filter with the accounts marked as favorite by the user. 

> [!NOTE]  
> To keep this sample short and simple, the entire filter string is overwritten.

```
codeunit 50101 MyAccountFilterTokenSimple
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::TextManagement, 'OnAfterMakeTextFilter', '', true, true)]
    local procedure FilterMyAccountsOnAfterMakeTextFilter(var Position: Integer; var TextFilterText: Text)
    var
        MyAccountTxt: Label 'MYTOKEN';
        MyAccount: Record "My Account";
        MaxCount: Integer;
    begin
        if StrLen(TextFilterText) < 3 then
            exit;
        if StrPos(UpperCase(MyAccountTxt), UpperCase(TextFilterText)) = 0 then
            exit;

        MaxCount := 2000;
        MyAccount.SetRange("User ID", UserId);
        if MyAccount.FindSet() then begin
            MaxCount -= 1;
            TextFilterText := MyAccount."Account No.";
            if MyAccount.next <> 0 then
                repeat
                    MaxCount -= 1;
                    TextFilterText += '|' + MyAccount."Account No."
                until (MyAccount.Next = 0) or (MaxCount <= 0);
        end;
    end;
}

```
To try it out in the client, open the `Charts of Accounts` page, filter on No. field, and type in a substring that starts the same way with the chosen token word, like **%MYTO**.

<!--
## Filter token example
This example extends the application with a new token word "%mysalesperson" representing my salesperson code as defined in the user table.
-->

## See Also 
[Sorting, Searching and Filtering Lists](/dynamics365/business-central/ui-enter-criteria-filters)
