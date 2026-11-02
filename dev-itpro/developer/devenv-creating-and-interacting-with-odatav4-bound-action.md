---
title: "Creating and Interacting with an OData V4 Bound Action"
description: "Create an OData V4 bound action in AL, publish its page, and call it with an authenticated POST request to copy an existing sales invoice in Business Central."
author: SusanneWindfeldPedersen
ms.date: 10/29/2026
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Creating and interacting with an OData V4 bound action

Use an OData V4 bound action to run an AL procedure for a specific record through a web service. This article shows how to copy an existing unposted sales invoice to a new unposted invoice, publish the custom page, and call its `Copy` action.

## Prerequisites for the invoice-copy example

- An AL extension project that references the Business Central application. Include object ID **50110** in the project's `app.json` ID ranges.
- A sandbox or test company with **Sales & Receivables Setup**, invoice number series, posting number series, and a valid unposted sales invoice with a customer. Start with a simple invoice whose data supports the standard copy-document operation.
- Permission to publish web services. The calling identity also needs access to the custom page, the copy-document codeunit, sales documents, setup, and number series. Publishing the page doesn't grant these permissions.
- An HTTP client and authentication for your environment. For Business Central online, use an OAuth access token. Learn more in [Using OAuth to authorize Business Central web services](../webservices/authenticate-web-services-using-oauth.md).
- For on-premises environments, enabled OData V4 services. Learn more in [Business Central Server instance settings](../administration/server-instance-settings.md#expose-odata-and-api-services).

## Declare the OData bound action

Declare a procedure on the page and add the `[ServiceEnabled]` attribute. Use `WebServiceActionContext` to identify the new invoice and set `WebServiceActionResultCode::Created`.

The page exposes `SystemId` through the `Id` control and uses it as the OData key. The action result must use the same table field, `SystemId`, when it identifies the new record.

> [!NOTE]
> Declare the procedure on the page object itself. Adding a procedure through a `pageextension` doesn't expose it as an OData bound action. You can define the new page in an AL extension.

```al
using Microsoft.Sales.Document;
using Microsoft.Sales.Setup;
using Microsoft.Utilities;

page 50110 SalesInvoiceCopy
{
    Caption = 'Sales invoice copy';
    PageType = Card;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Invoice));
    ODataKeyFields = SystemId;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Id; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                    ToolTip = 'Specifies the unique identifier of the sales invoice.';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'Specifies the sales invoice number.';
                }

                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Specifies the customer who receives the sales invoice.';
                }
            }
        }
    }

    [ServiceEnabled]
    procedure Copy(var ActionContext: WebServiceActionContext)
    var
        FromSalesHeader: Record "Sales Header";
        ToSalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        CopyDocumentMgt: Codeunit "Copy Document Mgt.";
    begin
        FromSalesHeader.Get(Rec."Document Type", Rec."No.");
        FromSalesHeader.TestField(
            "Document Type", FromSalesHeader."Document Type"::Invoice);
        FromSalesHeader.TestField("Sell-to Customer No.");

        SalesSetup.Get();
        CopyDocumentMgt.SetProperties(
            true, false, false, false, true,
            SalesSetup."Exact Cost Reversing Mandatory", false);

        ToSalesHeader.Init();
        ToSalesHeader."Document Type" :=
            ToSalesHeader."Document Type"::Invoice;
        ToSalesHeader.SetHideValidationDialog(true);
        ToSalesHeader.Insert(true);

        CopyDocumentMgt.CopySalesDoc(
            "Sales Document Type From"::Invoice,
            FromSalesHeader."No.", ToSalesHeader);

        ToSalesHeader.Get(
            ToSalesHeader."Document Type", ToSalesHeader."No.");

        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(Page::SalesInvoiceCopy);
        ActionContext.AddEntityKey(
            Rec.FieldNo(SystemId), ToSalesHeader.SystemId);
        ActionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;
}
```

The page settings prevent direct inserts, edits, and deletes through the page. The `Copy` procedure creates the new invoice through AL code. The sample suppresses standard dialogs. Permissions and applicable validation still run, but availability warnings and interactive credit-limit notifications don't run through this web-service path.

## Publish the custom page as a web service

1. Build and publish the extension to your test environment.
1. In Business Central, use **Search** to find and open the **Web Services** page.
1. Select **New**.
1. Set **Object Type** to **Page**, **Object ID** to **50110**, and **Service Name** to `SalesInvoiceCopy`.
1. Select **Published**.
1. Copy the **OData V4 URL** for the service.

Publish page **50110**, not the standard **Sales Invoice** page, which has object ID **43**. The service name alone doesn't associate the custom action with another page. Learn more in [Publish a web service](../webservices/publish-web-service.md).

## Retrieve an invoice and its OData key

Use the copied URL to retrieve invoices before you invoke the action. In the following requests, replace `<BaseUrl>` with the URL prefix before `/ODataV4`. Replace `<CompanyName>` with your actual company name, URL-encoded and escaped as an OData string.

For Business Central online, `<BaseUrl>` is `https://api.businesscentral.dynamics.com/v2.0/<TenantId>/<EnvironmentName>`. Replace `<TenantId>` and `<EnvironmentName>` with your tenant ID and environment name. For on-premises environments, use the prefix from the copied service URL.

For OAuth authentication, replace `<AccessToken>` with an access token for your environment.

```http
GET <BaseUrl>/ODataV4/Company('<CompanyName>')/SalesInvoiceCopy
Authorization: Bearer <AccessToken>
Accept: application/json
```

In the returned collection, find the source invoice and copy its `Id` value. This property exposes the record's `SystemId`, not its invoice number.

The GUID `aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb` in the next example is an illustrative record ID. Replace it with the retrieved `Id`. Don't enclose the GUID in single quotation marks.

## Invoke the bound action with POST

Send a POST request to the invoice's URL followed by `/NAV.Copy`. Use the same `<BaseUrl>` and `<CompanyName>` values that you used to retrieve the invoice.

```http
POST <BaseUrl>/ODataV4/Company('<CompanyName>')/SalesInvoiceCopy(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)/NAV.Copy
Authorization: Bearer <AccessToken>
Content-Length: 0
```

This action has no request body. The platform supplies `ActionContext`; don't send it as a JSON parameter. A GET request retrieves data but doesn't invoke the action.

### Expected response

On success, the action returns `201 Created` with a `Location` header that identifies the new invoice. It doesn't return an invoice JSON body.

```http
HTTP/1.1 201 Created
Location: <BaseUrl>/ODataV4/Company('<CompanyName>')/SalesInvoiceCopy(<NewInvoiceGuid>)
```

Retrieve the URL in the `Location` header to inspect the new invoice. Replace `<NewInvoiceGuid>` only if you're constructing the URL yourself; the actual response supplies the new record's GUID.

Open the new invoice in Business Central and review its header and lines. The standard copy-document operation can skip lines, including lines with blocked items. A `201 Created` response confirms that the new invoice was created, not that every source line was copied.

### Troubleshoot action requests

- If the key count or type is incorrect, confirm that you published page **50110** and that its `ODataKeyFields` property is `SystemId`. Use the returned `Id` GUID, not the document number. Inspect `<BaseUrl>/ODataV4/$metadata` to check the published entity's key definition.
- If the action isn't found, use the exact service name and `/NAV.Copy` suffix with POST. Confirm that the installed page declares the `[ServiceEnabled]` procedure.
- If copying fails, check the calling identity's permissions, number series, company setup, and source invoice data.

## Related information

[ServiceEnabled attribute](attributes/devenv-serviceenabled-attribute.md)  
[WebServiceActionContext data type](methods-auto/webserviceactioncontext/webserviceactioncontext-data-type.md)  
[ODataKeyFields property](properties/devenv-odatakeyfields-property.md)  
[System fields](devenv-table-system-fields.md)  
[Publish a web service](../webservices/publish-web-service.md)  
[Create and call an OData V4 unbound action](devenv-creating-and-interacting-with-odatav4-unbound-action.md)  
