---
title: "Creating and Interacting with an OData V4 Bound Action"
description: "Document how to create and interact with an OData V4 Bound Action in AL."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/04/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](includes/vnext_preview.md)]

# Creating and Interacting with an OData V4 Bound Action

This topic provides an overview of how to expose a procedure as an OData V4 web service action and how to verify that the service is working as expected.

## Declaring the OData bound action

The following example shows you how you can declare an OData bound action on a page exposed as a web service. For that, you need to add a procedure to the `Sales Invoice` page by using a page extension, expose the procedure using the `[ServiceEnabled]` attribute, and use the `WebServiceActionContext` and `WebServiceActionResultCode` AL types to set the result of the function.  

```al
pageextension 50110 SalesInvoiceExtension extends "Sales Invoice"
{
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

        FromSalesHeader.Get(Rec."Document Type", Rec."No.");
        ToSalesHeader."Document Type" := FromSalesHeader."Document Type";
        ToSalesHeader.Insert(true);

        CopyDocMgt.CopySalesDoc(DocType::Invoice, FromSalesHeader."No.", ToSalesHeader);

        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::"Sales Invoice");
        actionContext.AddEntityKey(Rec.FIELDNO(Id), ToSalesHeader.Id);

        // Set the result code to inform the caller that an item was created.
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    end;

}
```

## Registering and publishing the page as a web service

> [!NOTE]  
> If the `Sales Invoice` page is already present in the list of **Web Services**, the following actions are not necessary.

1. Open the Business Central Web Client.
2. In the **Search** box, enter **Web Services**, and choose the related link.
3. In the **Web Services** page, on the **Home** tab, choose **New**.
4. In the **Object Type** column, select **Page**. In the **Object ID** column, enter 43, and in the **Service Name** column, enter `SalesInvoice`.
5. Select the check box in the **Published** column. 
6. When you publish the web service, in the **OData URL** and **SOAP URL** fields, you can see the URLs that are generated for the web service. 

## Verifying the web service availability  

After publishing a web service, verify that the port that web service applications will use to connect to your web service is open.  

1. Download **Postman** or another similar tool that can execute a POST command against the web service URI.  
2. In the **Address** field, enter a URI in this format:    

```
http://<Server>:<WebServicePort>/<ServerInstance>/api/beta/companies(<companyid>)/salesInvoices(<invoiceid>)/Microsoft.NAV.Copy)
```

- `<Server>` is the address of the computer that is running Microsoft Dynamics Business Central server.
- `<WebServicePort>` is the port on which OData V4 is running. The default port is 7047.
- `<ServiceInstance>` is the name of the Microsoft Dynamics Business Central server instance.  

3. **Postman** should now show the web service method that you have published, and perform the action of copying an invoice.

You have now published a method as an OData V4 web service action and verified that the service works as expected.

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Devoloping for Multiple Platform Versions](devenv-developing-for-multiple-platform-versions.md)  
[Exporting Permission Sets](devenv-export-permission-sets.md)  
[Discover Events Using the Event Recorder](devenv-events-discoverability.md)    


