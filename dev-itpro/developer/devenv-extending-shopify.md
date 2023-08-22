---
title: Extending Shopify
description: This article provides descriptions and examples of how you can extend your Shopify integration.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: andreipa
ms.custom: bap-template
ms.date: 08/21/2023
ms.topic: conceptual
---
# Extend the Shopify Connector

The Shopify Connector offers a few points of extensibility. We're keeping the number of points to a minimum so that we can follow the rapid development on the Shopify side without introducing breaking changes.

> [!NOTE]
> We're making extensibility available based on feedback from our partners and customers. If there's a scenario you'd like to cover, you can contribute yourself. To learn more, go to [Is the Shopify connector open for contribution](/dynamics365/business-central/shopify/shopify-faq#is-the-shopify-connector-open-for-contribution).

## Extensibility examples

### Order processing

How businesses process sales orders can vary greatly, depending on various factors. For example, depending on the type of products or services offered, the sales channels used, and policies and procedures for shipping and handling. You can subscribe to various events from the Shpfy Order Events codeunit.

To learn more about synchronizing orders, go to [Synchronize and fulfill sales orders](/dynamics365/business-central/shopify/synchronize-orders).

#### Populate fields on an imported Shopify order

The following example shows how to populate fields on an order that you imported from Shopify. For example, select a customer based on the sales channel. 

```
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

```
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


```
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

```
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

```
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

```
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

```
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

You can extend the **Shpfy Stock Calculation** enum by adding your own options. You'll also need to add your own implementation of the **Shpfy Stock Calculation** interface.

To learn more about standard inventory calculation, go to [Sync inventory to Shopify](/dynamics365/business-central/shopify/synchronize-items#sync-inventory-to-shopify).

#### Calculate on-hand stock

The following example shows how to calculate stock on hand.

```
enumextension 50101 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
  value(50101; "Inventory on hand")
    {
        Caption = 'Inventory on hand';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Inventory";
    }
}
codeunit 50101 "Shpfy Stock Calc. Inventory" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal;
    begin
        Item.Calcfields(Inventory);
        exit(Item.Inventory);
    end;
}
```

#### Calculate on-hand stock reduced by reserved stock

The following example shows how to calculate stock on hand reduced by reserved stock.

```
enumextension 50102 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50102; "Non-reserved Inventory")
    {
        Caption = 'Free Inventory (not reserved)';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Free Invent";
    }
}
codeunit 50102 "Shpfy Stock Calc. Free Invent" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal;
    begin
        Item.Calcfields(Inventory, "Reserved Qty. on Inventory");
        exit(Item.Inventory - Item."Reserved Qty. on Inventory");
    end;
}
```

#### Calculate the projected available balance on a specific date

The following example shows how to calculate the balance that's expected to be available on specific date in the future.

```
enumextension 50103 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50103; "Projected Available Balance in X Days")
    {
        Caption = 'Projected Available Balance in X Days';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. Proj at Date";
    }
}
codeunit 50103 "Shpfy Stock Calc. Proj at Date" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal;
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

```
enumextension 50104 "Extended Stock Calculations" extends "Shpfy Stock Calculation"
{
    value(50104; "Available to Pick")
    {
        Caption = 'Available to pick (warehouse handling)';
        Implementation = "Shpfy Stock Calculation" = "Shpfy Stock Calc. AvailPick";
    }
}
codeunit 50104 "Shpfy Stock Calc. AvailPick" implements "Shpfy Stock Calculation"
{
    procedure GetStock(var Item: Record Item): decimal;
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

```
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

```
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

```
codeunit 50106 "Shpfy Product Export Manuf"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnAfterCreateTempShopifyProduct', '', false, false)]
    procedure AfterCreateTempShopifyProduct1(Item: Record Item; var ShopifyProduct: Record "Shpfy Product"; var ShopifyVariant: Record "Shpfy Variant"; var ShopifyTag: Record "Shpfy Tag")
    var
        Manufacturer: Record Manufacturer;
    begin
        if Manufacturer.Get(Item."Manufacturer Code") then begin
            ShopifyProduct.Vendor := Manufacturer.Name;
            ShopifyProduct.Modify();
        end;
    end;
}
```

#### Tag exported items

The following example shows how to tag exported items. Tags categorize products on your online store and organize search results for customers.

```
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

```
codeunit 50108 "Shpfy Product Import Mapping"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Product Events", 'OnBeforeFindMapping', '', false, false)]
    procedure BeforeFindMapping(Direction: enum "Shpfy Mapping Direction"; var ShopifyProduct: Record "Shpfy Product"; var ShopifyVariant: Record "Shpfy Variant"; var Item: Record Item; ItemVariant: Record "Item Variant"; var Handled: Boolean);
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

[Extending Application Areas](devenv-extending-application-areas.md)  
[Shopify](/dynamics365/business-central/shopify/get-started)  
[FAQ](https://aka.ms/bcshopifyfaq)  
[walkthroughs](/dynamics365/business-central/shopify/walkthrough-setting-up-and-using-shopify)  