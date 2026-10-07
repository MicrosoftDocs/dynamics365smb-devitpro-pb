---
title: Create Custom Filter Tokens in Business Central
description: Learn how to create custom filter tokens in AL so users can enter shortcuts that resolve to reusable filter values in Business Central lists.
ms.date: 10/06/2026
ms.topic: concept-article
author: mikebcMSFT
ms.author: mikebc
ms.reviewer: jswymer
---

# Create a custom filter token

In the client, when filtering lists using the filter pane, users can enter filter tokens, which are special words that resolve to one or more values. This powerful feature makes filtering easier by reducing the need to navigate to other pages to look up values to enter as filter criteria.

[!INCLUDE[prod_short](includes/prod_short.md)] provides several useful filter tokens. For example, when you enter `%mycustomers` in a **Customer No.** field, it resolves to the set of customers in the user's **My Customers** list, such as `1001|1002`. The resolved filter makes it easy to find relevant sales orders for customers 1001 and 1002.

You can add custom filter tokens and make these available in any language and across the application. To add your custom filter token, you need to define the token word that users will enter as filter criteria, and define a handler that resolves the token to a concrete value at runtime. Learn more about filter tokens in [Filter Tokens](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Filter%20Tokens) in the BCApps repository on GitHub.

## Define the token word and handler

To create the token word, start by defining a multi-language text string for your word. Subscribe to the `OnResolveTextFilterToken` event associated with the `MakeTextFilter` method from the `Filter Tokens` codeunit.  
In the event subscriber, if the value of the `TextToken` parameter contains the token string, process its value and construct the final filter string. If the filter string must contain multiple values, handle the operators that join them by adding the `|` filter symbol (OR operation). Complete the operation by setting the `TextFilter` parameter to the final filter string and the `Handled` parameter to `true`.

> [!TIP]  
> Filter criteria will often contain symbols along with filter tokens. We recommend that you only modify the filter token you have introduced and preserve the rest of the filter string.

## Create a custom filter token

This example shows how you can use the guidelines to create the `%MYTOKEN` filter token. The token returns a filter with the accounts that the user marked as favorites.

> [!NOTE]  
> To keep this sample short and simple, the entire filter string is overwritten.

```AL
codeunit 50101 MyAccountFilterTokenSimple
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveTextFilterToken', '', true, true)]
    local procedure FilterMyAccounts(TextToken: Text; var TextFilter: Text; var Handled: Boolean)
    var
        MyAccount: Record "My Account";
        MaxCount: Integer;
        MyTokenLbl: Label 'MYTOKEN';
    begin
        if StrLen(TextToken) < 3 then
            exit;

        if StrPos(UpperCase(MyTokenLbl), UpperCase(TextToken)) = 0 then
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
To try it in the client, open the **Chart of Accounts** page, filter the **No.** field, and enter a substring that starts with the chosen token word, such as `%MYTO`.

<!--
## Filter token example
This example extends the application with a new token word "%mysalesperson" representing my salesperson code as defined in the user table.
-->

## Design considerations

Filter tokens must resolve quickly and reliably. These events can run for any user task in [!INCLUDE[prod_short](includes/prod_short.md)]. In some cases, they run repeatedly, such as when users search across columns. To improve usability and performance, consider these practices:

- Avoid implementing tokens that are relevant to only a few business tasks or that assume they're used in the context of a specific page.
- Avoid implementing tokens that are time-consuming to resolve. Examples include looking up records in large or poorly indexed tables and fetching data from a remote service.
- Avoid implementing tokens that are complex or unreliable and might result in an error.
- Avoid displaying pages, dialogs, or any other form of interactive UI.


## Related information

[Sorting, searching, and filtering lists](/dynamics365/business-central/ui-enter-criteria-filters)
