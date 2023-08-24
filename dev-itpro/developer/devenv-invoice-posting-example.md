---
title: "Extending G/L Entry Aggregations When Posting Invoices"
description: Explore an example of how to extend the posting process for sales, purchase, and service documents.
ms.custom: na
ms.date: 09/09/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Extending G/L Entry Aggregations When Posting Invoices

> [!IMPORTANT]
> This feature is currently available only for sandbox environments. Do not use it in production environments.

This article provides an example of how to customize the way that G/L entries are aggregated when you post sales, purchase, and service documents.

Extend the posting process for sales, purchase, and service documents by changing the way the posting algorithm aggregates G/L entries. For example, for specific document lines, posting groups, or the tax setup required by local legislation. Replace customizations to G/L invoice posting by using the Invoice Posting interface, resolve issues for the legacy Invoice Post. Buffer table, and use your own implementation of G/L invoice posting.

> [!NOTE]
> The **Invoice Post. Buffer** table has been an important part of localizations and customizations for businesses that must aggregate lines on sales, purchase, and service document lines in a specific way when they post the documents in order to comply with local, industry, or customer requirements. Historically, this design wasn't extensible because we couldn't change the primary key in the Invoice Post. Buffer table without introducing a breaking change in third-party solutions and localizations.
>
> We've removed the dependencies from the Invoice Posting Buffer table in the Base Application and built an Invoice Posting object with an interface and an extensible enum for the implementation setup. For more information, see [The Objects to Use](devenv-invoice-posting-example.md#the-objects-to-use-for-your-extension)

## The Objects to Use for Your Extension

* The **Invoice Posting** interface provides a set of procedures for posting sales, purchase, and service invoices. This interface let's you replace the invoice posting implementation for an extension. 
   > [!NOTE]
   > The legacy implementation is still available in posting codeunits, but are tagged as `obsolete`.
* The **Sales Invoice Posting**. **Purchase Invoice Posting**, and **Service Invoice Posting** enums are extensible and define the current implementation. 

The following is an example of an implementation that uses the **Sales Invoice Posting** enum.

```AL
enum 815 "Sales Invoice Posting" implements "Invoice Posting" 
{ 
    Extensible = true; 

    value(0; "Invoice Posting (Default)") 
    { 
        Caption = 'Invoice Posting (Default)'; 
        Implementation = "Invoice Posting" = "Undefined Post Invoice"; 
    } 

    value(815; "Invoice Posting (v.19)") 
    { 
        Caption = 'Invoice Posting (v.19)'; 
        Implementation = "Invoice Posting" = "Sales Post Invoice"; 
    } 
} 
```

* The temporary **Invoice Posting Buffer** table uses the generic key, `Group ID: Text[1000]`. You can use the `BuildPrimaryKey()` method to compose the key from table fields. The `OnAfterBuildPrimaryKey` event can be used to compose the primary key in a different way. 
* The **Invoice Posting Setup** field on the purchase and service setup tables lets you define the implementation for the (Sales) Invoice Posting codeunit. If you define the value `Invoice Posting (v.19)`, the Base Application will run codeunit 815 Sales Invoice Posting from the Sales-Post codeunit for your customized posting process. 

Typically, you'll only need to add fields to the Invoice Posting Buffer table.

## Example: Post G/L entries according to your product line code

1. Add a new **Product Line Code** field to the **Invoice Posting Buffer** table in your extension. The following code sample shows how.

    ```AL
    tableextension 50000 "Invoice Posting Buffer Ext." extends "Invoice Posting Buffer" 
    { 
        fields 
        { 
            field(50000; "Product Line Code"; Code[10]) 
            { 
                Caption = 'Product Line Code'; 
            } 
        } 
    } 
    ```

2. After you have a Product Line Code field on sales lines, add subscribers as shown in the following code sample.

    ```AL
    codeunit 50000 "Product Line Subscribers" 
    { 
      
      [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Post Invoice", 'OnPrepareLineOnAfterFillInvoicePostingBuffer', '', false, false)] 
        local procedure OnPrepareLineOnAfterFillInvoicePostingBuffer(var InvoicePostingBuffer: Record "Invoice Posting Buffer"; SalesLine: Record "Sales Line") 
        begin 
            InvoicePostingBuffer."Product Line Code" := SalesLine."Product Line Code"; 
        end; 
    
        [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterBuildPrimaryKey', '', false, false)] 
        local procedure InvoicePostingBufferOnAfterBuildPrimaryKey(var InvoicePostingBuffer: Record "Invoice Posting Buffer") 
        begin 
            // Product Line Code value added as first field to the existing primary key as example 
            // although Hroup ID field can be composed in any alternative way to support another sorting and 
            //  aggregation of G/L entries for posting 
            InvoicePostingBuffer."Group ID" := 
                InvoicePostingBuffer.PadField(InvoicePostingBuffer."Product Line Code", MaxStrLen(InvoicePostingBuffer."Product Line Code")) + 
                InvoicePostingBuffer."Group ID"; 
        end; 
    }
    ```

3. Use your extension to set the `Invoice Posting (v.19)` value in the **Invoice Posting Setup** field on the **Sales & Receivables Setup** table. The Invoice Posting Setup field is not available on the Sales & Receivables Setup page to prevent the Invoice Posting interface from being misconfigured.

## Advanced Scenarios

In more advanced scenarios, you can create your own implementation codeunit and use it instead of codeunit 815 Sales Post Invoice, implement interface methods, and add your values to the Sales Invoice Posting enum. You can then use any methods for aggregation of G/L entries.

## See Also
[The Microsoft_Application.app File](devenv-application-app-file.md)  
[Publishing a Code-Customized Base Application for Business Central On-Prem](devenv-publish-code-customization.md)  
[Extending Application Areas](devenv-extending-application-areas.md)  
