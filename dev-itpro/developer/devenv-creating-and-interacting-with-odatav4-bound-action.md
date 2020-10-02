---
title: "Creating and Interacting with an OData V4 Bound Action"
description: "Document how to create and interact with an OData V4 Bound Action in AL."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating and Interacting with an OData V4 Bound Action

This topic provides an overview of how to expose a procedure as an OData V4 web service action and how to verify that the service is working as expected.

## Declaring the OData bound action

The following example shows you how you can declare an OData bound action on a page exposed as a web service. For that, you need to add a procedure to the `SalesInvoiceCopy` page, expose the procedure using the `[ServiceEnabled]` attribute, and use the `WebServiceActionContext` and `WebServiceActionResultCode` AL types to set the result of the function.  

> [!NOTE]   
> Bound actions cannot be added by extending an existing page that has been exposed as a web service. 

```
page 50110 SalesInvoiceCopy
{
    ODataKeyFields = "Id";
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Id; Id)
                {
                    ApplicationArea = All;
                }

                field("No."; "No.")
                {
                    ApplicationArea = All;
                }

                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange("Document Type", "Document Type"::Invoice);
    end;

    [ServiceEnabled]
    procedure Copy(var actionContext: WebServiceActionContext)
    var
        FromSalesHeader: Record "Sales Header";
        ToSalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        CopyDocMgt: Codeunit "Copy Document Mgt.";
        DocType: Option Quote,"Blanket Order",Order,Invoice,"Return Order","Credit Memo","Posted Shipment","Posted Invoice","Posted Return Receipt","Posted Credit Memo";
    begin
        SalesSetup.Get;
        CopyDocMgt.SetProperties(true, false, false, false, false, SalesSetup."Exact Cost Reversing Mandatory", false);

        FromSalesHeader.Get("Document Type", "No.");
        ToSalesHeader."Document Type" := FromSalesHeader."Document Type";
        ToSalesHeader.Insert(true);

        CopyDocMgt.CopySalesDoc(DocType::Invoice, FromSalesHeader."No.", ToSalesHeader);

        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::SalesInvoiceCopy);
        actionContext.AddEntityKey(Rec.FIELDNO(Id), ToSalesHeader.Id);

        // Set the result code to inform the caller that an item was created.
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;
}
```

## Registering and publishing the page as a web service

1. Open the Business Central Web Client.
2. In the **Search** box, enter **Web Services**, and choose the related link.
3. In the **Web Services** page, on the **Home** tab, choose **New**.
4. In the **Object Type** column, select **Page**. In the **Object ID** column, enter 43, and in the **Service Name** column, enter `SalesInvoiceCopy`.
5. Select the check box in the **Published** column. 
6. When you publish the web service, in the **OData URL** and **SOAP URL** fields, you can see the URLs that are generated for the web service. 

## Verifying the web service availability  

### HTTP request

```
POST /ODataV4/Company({companyName})/SalesInvoiceCopy({id})/NAV.Copy
```

### Request headers

|Header|Value|
|------|-----|
|Authorization|Bearer {token}. Required.|

### Example

```
{baseurl}/ODataV4/Company('CRONUS%20USA%2C%20Inc.')/SalesInvoiceCopy('S-ORD101001')/NAV.Copy
```


## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Devoloping for Multiple Platform Versions](devenv-developing-for-multiple-platform-versions.md)  
[Exporting Permission Sets](devenv-export-permission-sets.md)  
[Discover Events Using the Event Recorder](devenv-events-discoverability.md)    
