---
title: Extending Shopify
description: This article provides descriptions and examples of how you can extend your Shopify integration.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: bholtorf
ms.custom: bap-template
ms.date: 08/21/2023
ms.topic: conceptual
---
# Extend the Shopify Connector

The Shopify Connector offers a few points of extensibility. We're keeping the number of points to a minimum so that we can follow the rapid development on the Shopify side without introducing breaking changes.

> [!NOTE]
> We're making extensibility available based on feedback from our partners and customers. If there's a scenario you'd like to cover, you can contribute yourself. To learn more, go to [Is the Shopify connector open for contribution](/dynamics365/business-central/shopify/shopify-faq#is-the-shopify-connector-open-for-contribution).

## Extensibility approaches

### Per-tenant extension.
Classic extensibility, when created extension subscribes exposed events and other artifacts and adjust existings flows. The benefit of this approach is that development can be done against cloud sandbox. The restriction is that you can not modify API calls, for example add new nodes or call against different Shopify API. As connector depends on Shopify API and its release cycle the number of exposed events in connector is noticeably less than in other Microsoft code. There were cases when redesign was needed to uptake the new ways to complete things on Shopify and that would cause multiple breaking changes for per-tenant extensions.

### Hybrid approach
In additon to classic extensibility desribed above, you can also create separate branch of code that interacts with Shopify API directly. This approach gives you more flexibility, but it has higher requirements as you will need to register your own unlisted Shopify app, implement your own communication logic. You can also use cloud sandbox for development.

### Co-development
If needed functionality is missing, somethimes instead of building per-tenant extension or onboard to hybrid approach, you can contribute the code to Shopify Connector instead via co-development process. That approaches ensures that you don't need to maintain proprietary code and use out of the box functionality instead. That approach requires acceptance from engineering team both from use case and architecture perspective. Also worth mentioning that the shipping of new features, including one build by community is usually tight to major releases.

## Useful hints

### Dependency in app.json

If you are building per-tenant extension or plan to utilize hybrid approach, you shall list the Shopify Connector as dependency in the *app.json* file, remember to use right version number:
```json
    "dependencies": [
        {
            "id": "ec255f57-31d0-4ca2-b751-f2fa7c745abb",
            "name": "Shopify Connector",
            "publisher": "Microsoft",
            "version": "25.0.0.0"
        }
    ],
```

For more information see [JSON files](devenv-json-files.md).

### Registering Shopify app
Begin by joining the [Shopify Partner Program](https://help.shopify.com/partners/about). Afterwards, use the **Partner Dashboard** to create the development store and app. 

The steps below lists main points, for specific details refer to Shopify documentation.

1. In the **Shopify Partner Dashboar**, navigate to **Apps**>**All apps** and choose the **Create app** button
2. Choose the **Create app manually** button.
3. Enter the **App name** and choose **Create**.
4. Navigate to the **Overview** section of created app and make note of **Client credentials**: **Client ID** and **Client secret**. You will use this information to access Shopify API.
5. Navigate to the **Configuration** section and add **App URL**, some valid url.
6. Populate **Allowed redirection URL(s)** in following format:`<Server>[:port]/<ServerInstance>/OauthLanding.htm` (e.g. `https://bc-shopify.westeurope.cloudapp.azure.com/BC/OauthLanding.htm` or `https://localhost:48900/BC/OAuthLanding.htm`). Exact value depends on configuration of your development environment. You can see what your development environment returns by calling [GetDefaultRedirectUrl()](/dynamics365/business-central/application/system-application/codeunit/system.security.authentication.oauth2#getdefaultredirecturl) method of the **OAuth2** system module. Also make sure that this URL is reachable. If you use container sandbox development environment, consider using the deployment template from [aka.ms/getbc](https://aka.ms/getbc), where you can enable the Let's Encrypt SSL certificate, to ensure that [!INCLUDE [prod_short](../includes/prod_short.md)] in the container is accessible.
7. For co-development, as Shopify Connector reads all orders, not only last 60 days, you also need to request access for your app. Navigate to the **API access**, choose the **Request access** button in the **Read all order scopes**. The process requires review, which may take some time, so plan in advance. For more information, see [Orders permissions](https://shopify.dev/docs/api/usage/access-scopes#orders-permissions). You will receive email from Shopify when access is granted. You can also check the **API access** section of the  **Shopify Partner dashboard**, you will see message "Your app can access the full order history for a store".

While in the **Shopify partner admin** consider creating a development store for testing. For more infomration, see [Developent Store](/dynamics365/business-central/shopify/shopify-account#development-store).

### Adjusting Shopify Connector for Co-development 

**codeunit 30199 "Shpfy Authentication Mgt."**, path: Apps/W1/Shopify/app/src/Integration/Codeunits/ShpfyAuthenticationMgt.Codeunit.al

Modify GetClientId and GetClientSecret to return Shopify clent credentials as your app doesn't have access to Azure Key Vault. Use Client ID and Client secret from [registered Shoify app](#registering-shopify-app).

```al
    [Scope('OnPrem')]
    local procedure GetClientId(): SecretText
    var
        ...
    begin
        exit(SecretText.SecretStrSubstNo(‘add Client ID here’));  //ADD THIS LINE
        ...
    end;

    [Scope('OnPrem')]
    local procedure GetClientSecret(): SecretText
    var
        ...
    begin
        exit(SecretText.SecretStrSubstNo(‘Add Client secret here’)); //ADD THIS LINE

        ...
    end;
```

if access to read all orders is not available yet, temprorary replace `read_all_orders` in `ScopeTxt` with `read_orders` instead. Once access is granted, reintroduce read_all_orders.

```al
codeunit 30199 "Shpfy Authentication Mgt."
{
    Access = Internal;
    var
        // https://shopify.dev/api/usage/access-scopes
        // ScopeTxt: Label 'write_orders,read_all_orders,...  //replace this line with line below
        ScopeTxt: Label 'write_orders,read_orders,...        

```

Now you can publish updated connector and connect [!INCLUDE [prod_short](../includes/prod_short.md)] to the Shopify online store. For more information, see [Connect Business Central to the Shopify online store](/dynamics365/business-central/shopify/get-started#connect-business-central-to-the-shopify-online-store). 

>[!IMPORTANT]
>Do not commit these changes in public repo. If you did, rotate Shopify client secrets of your app.

### Known issues with authentication

#### Error: Oauth error invalid_request: The redirect_uri is not whitelisted.
Make sure that you populated corrctly the **Allowed redirection URL(s)** in the **Configuration** section.

#### Error: cannot install app
Navigate to the **Overview** section of created app and choose the **Select Store** action. First install app from there, then try to connect [!INCLUDE [prod_short](../includes/prod_short.md)] to Shopify store again.


## Extensibility examples

### Order processing

How businesses process sales orders can vary greatly, depending on various factors. For example, depending on the type of products or services offered, the sales channels used, and policies and procedures for shipping and handling. You can subscribe to various events from the Shpfy Order Events codeunit.

To learn more about synchronizing orders, go to [Synchronize and fulfill sales orders](/dynamics365/business-central/shopify/synchronize-orders).

#### Populate fields on an imported Shopify order

The following example shows how to populate fields on an order that you imported from Shopify. For example, select a customer based on the sales channel. 

```al
codeunit 50113 "Shpfy Order Set Customer"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", 'OnAfterImportShopifyOrderHeader', '', false, false)]
    procedure OnAfterImportShopifyOrderHeader(var ShopifyOrderHeader: Record "Shpfy Order Header", IsNew: Boolean)
    var
        ShopifyShop: Record "Shpfy Shop";
    begin
        if ShopifyOrderHeader."Channel Name" = 'Point of Sale' then begin
            ShopifyShop.Get(ShopifyOrderHeader."Shop Code");
            ShopifyShop.TestField("POS Customer No.");
            ShopifyOrderHeader."Bill-to Customer No." := ShopifyShop."POS Customer No.";
            ShopifyOrderHeader."Sell-to Customer No." := ShopifyShop."POS Customer No.";
            ShopifyOrderHeader.Modify();
        end;
    end;
}
tableextension 50100 "Shpfy Shop Ext" extends "Shpfy Shop"
{
    fields
    {
        field(50100; "POS Customer No."; Code[20])
        {
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
    }
}
pageextension 50102 "Shpfy Shop Ext" extends "Shpfy Shop Card"
{
    layout
    {
        addafter(DefaultCustomer)
        {
            field("POS Customer No."; Rec."POS Customer No.")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
```

#### Verify that a Shopify order is ready to become a sales document

The following example shows how to check whether a Shopify order is ready to be converted to a sales document, and you want to make it mandatory to specify a payment method.

```al
codeunit 50107 "Shpfy Order Check Pay. Method"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", 'OnBeforeCreateSalesHeader', '', false, false)]
    internal procedure OnBeforeCreateSalesHeader(ShopifyOrderHeader: Record "Shpfy Order Header"; var SalesHeader: Record "Sales Header"; var Handled: Boolean)
    begin
        ShopifyOrderHeader.Testfield("Payment Method Code");
    end;
}
```

#### Add information to a sales document that's based on a Shopify order

You can add more information to a sales document that's based on a Shopify order. For example, you can add the Shopify order number as an external document number.


```al
codeunit 50112 "Shpfy Order External Doc. No"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", 'OnAfterCreateSalesHeader', '', false, false)]
    procedure OnAfterCreateSalesHeader(ShopifyHeader: Record "Shpfy Order Header"; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."External Document No." := ShopifyHeader."Shopify Order No.";
        SalesHeader.Modify();
    end;
}
```

#### Add information to a sales document line that's based on a Shopify order

The following example shows how to add dimensions to a sales document line that's based on a Shopify order.

```al
codeunit 50111 "Shpfy Order Line Dim"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Order Events", 'OnAfterCreateItemSalesLine', '', false, false)]

    procedure OnAfterCreateItemSalesLine(ShopifyOrderHeader: Record "Shpfy Order Header"; ShopifyOrderLine: Record "Shpfy Order Line"; SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    var
        DimMgt: Codeunit DimensionManagement;
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimensionValue: Record "Dimension Value";
    begin
        FindShpfyDimension(ShopifyOrderHeader."Channel Name", DimensionValue);

        DimMgt.GetDimensionSet(TempDimSetEntry, SalesLine."Dimension Set ID");
        TempDimSetEntry.Init();
        TempDimSetEntry."Dimension Set ID" := SalesLine."Dimension Set ID";
        TempDimSetEntry.Validate("Dimension Code", DimensionValue."Dimension Code");
        TempDimSetEntry.Validate("Dimension Value Code", DimensionValue.Code);
        if not TempDimSetEntry.Insert() then
            TempDimSetEntry.Modify();
        SalesLine.Validate("Dimension Set ID", DimMgt.GetDimensionSetID(TempDimSetEntry));
        SalesLine.Modify();
    end;

    local procedure FindShpfyDimension(SourceName: Code[20]; var DimensionValue: Record "Dimension Value")
    var
        Dimension: Record Dimension;
    begin
        If not Dimension.get('SHOPIFY') then begin
            Dimension.Code := 'SHOPIFY';
            Dimension.Insert();
        end;
        if not DimensionValue.Get(Dimension.Code, SourceName) then begin
            DimensionValue."Dimension Code" := Dimension.Code;
            DimensionValue.Code := SourceName;
            DimensionValue.Insert();
        end;
    end;
}
```

#### Show information from a Shopify order on a sales document

The following example shows how to include information from a Shopify order on a sales document. For example, the sales channel.

```al
tableextension 50101 "Shpfy Sales Header Extend" extends "Sales Header"
{
    fields
    {
        field(50100; "Channel Name"; Text[100])
        {
            CalcFormula = lookup("Shpfy Order Header"."Channel Name" WHERE("Shopify Order Id" = FIELD("Shpfy Order Id")));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}
pageextension 50100 "Shpfy SI Extend" extends "Sales Invoice"
{
    layout
    {
        addafter(ShpfyOrderNo)
        {
            field("Channel Name"; Rec."Channel Name")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
```

#### Show related information on a sales document

The following example shows how to include related information, for example tags, in a sales document.

```al
pageextension 50103 "Shpfy SO Extend" extends "Sales Order"
{
    layout
    {
        addafter(IncomingDocAttachFactBox)
        {
            part(OrderTags; "Shpfy Tag Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Parent Table No." = const(30118), "Parent Id" = field("Shpfy Order Id");
            }
        }
    }
}
```

#### Show information from a Shopify order line on a sales document line

The following example shows how to include information from a Shopify order line in a sales document line. For example, a description of an item variant.

```al
tableextension 50102 "Shpfy Sales Line Extend" extends "Sales Line"
{
    fields
    {
        field(50102; "Variant Description"; Text[50])
        {
            CalcFormula = lookup("Shpfy Order Line"."Variant Description" WHERE("Line Id" = FIELD("Shpfy Order Line Id")));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}
pageextension 50101 "Shpfy Sales Line Extend" extends "Sales Order Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("Variant Description"; Rec."Variant Description")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}
```

### Stock calculation

Companies have different rules on how and what items to expose to Shopify as available stock. 

You can extend the **Shpfy Stock Calculation** enum by adding your own options. You'll also need to add your own implementation of the **Shpfy Stock Calculation** interface. Remember to add implementaion `Shpfy Can Have Stock` for `Shpfy IStock Available`.

To learn more about standard inventory calculation, go to [Sync inventory to Shopify](/dynamics365/business-central/shopify/synchronize-items#sync-inventory-to-shopify).

#### Calculate on-hand stock

The following example shows how to calculate stock on hand.

```al
enumextension 50101 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
  value(50101; "Inventory on hand")
    {
        Caption = 'Inventory on hand';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Inventory",
                         "Shpfy IStock Available" = "Shpfy Can Have Stock";
    }
}
codeunit 50101 "Shpfy Stock Calc. Inventory" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal
    begin
        Item.Calcfields(Inventory);
        exit(Item.Inventory);
    end;
}
```

#### Calculate on-hand stock reduced by reserved stock

The following example shows how to calculate stock on hand reduced by reserved stock.

```al
enumextension 50102 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50102; "Non-reserved Inventory")
    {
        Caption = 'Free Inventory (not reserved)';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Free Invent",
                         "Shpfy IStock Available" = "Shpfy Can Have Stock";
    }
}
codeunit 50102 "Shpfy Stock Calc. Free Invent" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal
    begin
        Item.Calcfields(Inventory, "Reserved Qty. on Inventory");
        exit(Item.Inventory - Item."Reserved Qty. on Inventory");
    end;
}
```

#### Calculate the projected available balance on a specific date

The following example shows how to calculate the balance that's expected to be available on specific date in the future.

```al
enumextension 50103 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50103; "Projected Available Balance in X Days")
    {
        Caption = 'Projected Available Balance in X Days';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Proj at Date",
                         "Shpfy IStock Available" = "Shpfy Can Have Stock";
    }
}
codeunit 50103 "Shpfy Stock Calc. Proj at Date" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal
    var
        CompanyInfo: Record "Company Information";
        ItemAvailabilityFormsMgt: codeunit "Item Availability Forms Mgt";
        GrossRequirement, PlannedOrderRcpt, ScheduledRcpt, PlannedOrderReleases, ProjAvailableBalance, ExpectedInventory, QtyAvailable : decimal;
    begin
        CompanyInfo.Get();
        Item.SetRange("Date Filter", 0D, CalcDate(CompanyInfo."Check-Avail. Period Calc.", Today()));
        ItemAvailabilityFormsMgt.CalcAvailQuantities(Item, true, GrossRequirement, PlannedOrderRcpt, ScheduledRcpt, PlannedOrderReleases, ProjAvailableBalance, ExpectedInventory, QtyAvailable);
        exit(ProjAvailableBalance);
    end;
}
```

#### Calculate the quantity available to pick for locations

The following example shows how to calculate the quantity that's available and can be picked for locations that require warehouse handling.

```al
enumextension 50104 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50104; "Available to Pick")
    {
        Caption = 'Available to pick (warehouse handling)';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. AvailPick",
                         "Shpfy IStock Available" = "Shpfy Can Have Stock";
    }
}
codeunit 50104 "Shpfy Stock Calc. AvailPick" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal
    var
        Location: Record Location;
        TempWhseWorksheetLine: Record "Whse. Worksheet Line" temporary;
        WhseMgt: Codeunit "Whse. Management";
        AvailableQty: Decimal;
    begin
        TempWhseWorksheetLine.Init();
        TempWhseWorksheetLine."Item No." := Item."No.";
        TempWhseWorksheetLine."Variant Code" := Item."Variant Filter";
        TempWhseWorksheetLine."Unit of Measure Code" := Item."Base Unit of Measure";
        TempWhseWorksheetLine."Qty. per Unit of Measure" := 1;
        TempWhseWorksheetLine."Due Date" := WorkDate();
        Item.CopyFilter("Location Filter", Location.Code);
        if Location.FindSet() then
            repeat
                TempWhseWorksheetLine."Location Code" := Location."Code";
                AvailableQty += TempWhseWorksheetLine.CalcAvailableQtyBase();
            until Location.Next() = 0;
        Exit(AvailableQty)
    end;
}
```

### Price management

Price management is an important aspect of e-commerce because it can impact the profitability and competitiveness of a business. There's no one-size-fits-all approach because companies prioritize different factors and have different strategies for reaching their target audience.

You can subscribe to various events from the **Shpfy Product Events** codeunit.

To learn more about standard price calculation, go to [Sync prices with Shopify](/dynamics365/business-central/shopify/synchronize-items#sync-prices-with-shopify).

#### Implement logic to define prices

The following example shows how to implement logic for defining prices.

```al
codeunit 50105 "Shpfy Custom Price"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnBeforeCalculateUnitPrice', '', false, false)]
    procedure BeforeCalculateUnitPrice(Item: Record Item; VariantCode: Code[20]; UnitOfMeasure: Code[20]; ShopifyShop: Record "Shpfy Shop"; var UnitCost: Decimal; var Price: Decimal; var ComparePrice: Decimal; var Handled: Boolean)
    var
        CurrExchRate: Record "Currency Exchange Rate";
        ItemUOM: Record "Item Unit of Measure";
    begin
        Price := CurrExchRate.ExchangeAmtLCYToFCY(
                        WorkDate(),
                        ShopifyShop."Currency Code",
                        Item."Unit Price",
                        CurrExchRate.ExchangeRate(WorkDate(), ShopifyShop."Currency Code"));

        if (UnitOfMeasure <> '') and ItemUOM.Get(Item."No.", UnitOfMeasure) then
            Price := Price * ItemUOM."Qty. per Unit of Measure";

        Handled := true;
    end;
}
```

#### Implement logic to define compare-at prices

When you're selling an item at a discounted price, you can include the original price, or the price a customer might have paid elsewhere to give them something to compare the discount with. This price is often referred to as a compare-at price.

The following example shows how to implement logic for defining compare-at prices.

```al
codeunit 50110 "Shpfy Custom Compare Price"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnAfterCalculateUnitPrice', '', false, false)]
    procedure AfterCalculateUnitPrice(Item: Record Item; VariantCode: Code[20]; UnitOfMeasure: Code[20]; ShopifyShop: Record "Shpfy Shop"; var UnitCost: Decimal; var Price: Decimal; var ComparePrice: Decimal)
    begin
        ComparePrice := Round(Price * 1.3, 1);
        Price := Round(Price, 1) - 0.05;
    end;
}
```

### Product properties

Product descriptions and specifications help customers understand what they're buying, so they can make informed purchasing decisions. This information should be clear, concise, easy to understand, and include all relevant details.
Starting with version 22, you can subscribe to various events from the **Shpfy Product Events** codeunit.

To learn more about exporting products, go to [Export items to Shopify](/dynamics365/business-central/shopify/synchronize-items#export-items-to-shopify).

#### Use a manufacturer instead of a vendor when you export items

The following example shows how to use a manufacturer instead of a vendor when you export items.

```al
codeunit 50106 "Shpfy Product Export Manuf"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnAfterFillInShopifyProductFields', '', false, false)]
    procedure OnAfterFillInShopifyProductFields(Item: Record Item; var ShopifyProduct: Record "Shpfy Product")
    var
        Manufacturer: Record Manufacturer;
    begin
        if Manufacturer.Get(Item."Manufacturer Code") then begin
            ShopifyProduct.Vendor := Manufacturer.Name;
            if not ShopifyProduct.IsTemporary() then
                ShopifyProduct.Modify();
        end;
    end;
}
```

#### Tag exported items

The following example shows how to tag exported items. Tags categorize products on your online store and organize search results for customers.

```al
codeunit 50109 "Shpfy Product Export Tag"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnAfterCreateTempShopifyProduct', '', false, false)]
    procedure AfterCreateTempShopifyProduct(Item: Record Item; var ShopifyProduct: Record "Shpfy Product"; var ShopifyVariant: Record "Shpfy Variant"; var ShopifyTag: Record "Shpfy Tag")
    begin
        ShopifyTag."Parent Table No." := 30127;
        ShopifyTag."Parent Id" := ShopifyProduct.Id;
        ShopifyTag.Tag := Format(Item."Replenishment System");
        if not ShopifyTag.Insert() then
            ShopifyTag.Modify();
    end;
}
```

#### Map imported products to existing items

The following example shows how to use the GTIN field to map imported products to existing items. If it makes sense for your implementation, you can also use other fields for the mapping. For example, a field that your extension adds.

```al
codeunit 50108 "Shpfy Product Import Mapping"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnBeforeFindMapping', '', false, false)]
    procedure BeforeFindMapping(Direction: Enum "Shpfy Mapping Direction"; var ShopifyProduct: Record "Shpfy Product"; var ShopifyVariant: Record "Shpfy Variant"; var Item: Record Item; ItemVariant: Record "Item Variant"; var Handled: Boolean)
    var
        FindItem: Record Item;
    begin
        if (Direction = Direction::ShopifyToBC) and (not Handled) and (not ShopifyProduct."Has Variants") then
            if IsNullGuid(ShopifyProduct."Item SystemId") and (ShopifyVariant.SKU <> '') then begin
                Clear(Item);
                Clear(ItemVariant);
                FindItem.SetRange(GTIN, ShopifyVariant.SKU);
                If FindItem.FindFirst() then begin
                    Item := FindItem;
                    Handled := true;
                end;
            end;
    end;
}
```



## See also

[Extensibility overview](devenv-extensibility-overview.md)  
[Shopify](/dynamics365/business-central/shopify/get-started)  
[Shopify FAQ](https://aka.ms/bcshopifyfaq)  
[Shopify walkthroughs](/dynamics365/business-central/shopify/walkthrough-setting-up-and-using-shopify)  
