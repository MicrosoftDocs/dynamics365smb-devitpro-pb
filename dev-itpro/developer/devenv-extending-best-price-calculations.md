---
title: "Extend Price Calculations"
ms.custom: na
ms.date: 03/17/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Extending Price Calculations
If you record special prices and line discounts for sales and purchases, [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] can automatically calculate prices on sales and purchase documents, and on job and item journal lines. The price is the lowest permissible price with the highest permissible line discount on a given date. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] automatically calculates the price when it inserts the unit price and the line discount percentage for items on new document and journal lines. For more information, see [Price Calculation](/dynamics365/business-central/sales-how-record-sales-price-discount-payment-agreements.md#best-price-calculation).

This topic describes how price calculations are implemented in 2020 release wave 1 (referred to as "version 16" in the illustrations), and provides comparisons with 2019 release wave 2 (referred to as "version 15" in the illustrations) to show what we have changed. It also provides some examples of how you can extend price calculations in 2020 release wave 1. 

Price calculation for 2019 release wave 2 will continue to work as it always has. The changes for 2020 release wave 1 are an alternative implementation that you can extend. The calculations work the same, but are restructured so that they are extensible. 

> [!NOTE]
> The new price calculation capabilities in 2020 release wave 2 exist in code only, and do not include any user experience. We will provide that in an upcoming release. For now, to use the new capability you must create your own page.

## Price Calculation Extensibility
Price calculation are based on the **Price Calculation Setup** table, where you choose one of the existing implementations of price calculation, as shown in the following image.

:::image type="content" source="../media/best-pricing-diagram1-setup.png" alt-text="Diagram showing a price calculation implementation.":::

The combination of a price type (sales or purchase) and asset type (item, resource, G/L account, and so on) determines the method (all three are extendable enums) and the implementation codeunit. There can be multiple implementations for the same method that will perform a certain calculation. 

The codeunits that implement specific calculations subscribe to the OnFindSupportedSetup() event of codeunit 7001 "Price Calculation Mgt." and return the combinations of setup records that can be implemented by the current codeunit. The **Price Calculation Setup** table collects these combinations and you can choose one of the existing concurrent implementations. For example, the calculation of sale prices for all asset types can be implemented by the "Business Central (Version 16.0)" codeunit, but calculation of purchase prices – by "Business Central (Version 15.0)" codeunit.

<!--Insert image? Is this UI available?-->

If you want to add concurrent implementations and new methods you can add detailed setup lines that define combinations of assets and sources that use a method that you specify. For example, the following image shows detailed lines for the combination of asset number, source group, and source number. 

:::image type="content" source="../media/best-pricing-diagram2-detailed-setup.png" alt-text="Diagram showing an example of a default setup.":::

The detailed setup lines shown in the following image mean that all sales prices for Customer 10000 and job GUILFORD, 10 CR are calculated by the Business Central (version 16.0) implementation codeunit.

## Data Structure
The Business Central (Version 15.0) calculation uses the following tables that store information about prices, costs, and discounts: 

* table 7002 "Sales Price" 
* table 7004 "Sales Line Discount" 
* table 7012 "Purchase Price" 
* table 7014 "Purchase Line Discount" 
* table 201 "Resource Price" 
* table 1014 "Job G/L Account Price" 
* table 1013 "Job Item Price" 
* table 1012 "Job Resource Price" 

The "Business Central (Version 16.0)" calculation uses the following tables: 

<!--* table 7000 "Price List" -->
* table 7001 "Price List Line" 

The table 7001 "Price List Line" is compatible with all tables used by the Business Central (Version 15.0)" calculation. It contains the set of CopyFrom() methods that convert the data from the tables to the Price List Line table. 

If you extended the version 15 tables you must also extend the Price List Line table and the CopyFrom() methods by subscribing to special events.

**Add Code Example**

The Price Calculation Method field is added to all tables that need calculation of prices/discounts: 

* table 37 "Sales Line" 
* table 5902 "Service Line" 
* table 39 "Purchase Line" 
* table 246 "Requisition Line"  
* table 83 "Item Journal Line" 
* table 753 "Standard Item Journal Line" 
* table 210 "Job Journal Line" 
* table 1003 "Job Planning Line" 

The following image shows the schema of how the methods called in the Sales Line table get price/discount amounts from either the Sales Price or Price List Line tables.

:::image type="content" source="../media/best-pricing-diagram3-data-sources.png" alt-text="Diagram showing an price calculation for a sales line.":::

## Interface Objects
Best price calculation uses the following AL interface objects:

* Price Calculation
* Line With Price
* Price Source

### Price Calculation
The Price Calculation interface defines methods that calculate amounts and discount percentages in journal and document lines. The Price Calculation - V15 codeunit implements the interface, as shown in the following image.

:::image type="content" source="../media/best-pricing-diagram4-price-calculation.png" alt-text="Diagram showing an implementation of the Price Calculation interface.":::

To add another implementation codeunit you must also extend the Price Calculation Handler enum that implements the Price Calculation interface and is used in the Price Calculation Setup table. If you do not update the enum the price calculation will not be available to users.

### Line With Price
The Line With Price interface defines methods for a generic line that requires the calculation of a price, cost, and line discount. The following image shows the codeunits that implement this interface.

:::image type="content" source="../media/best-pricing-diagram5-line-with-price.png" alt-text="Diagram showing an implementation of the Line With Price interface.":::

The following example shows a typical use of the codeunits in the Sales Line table.

```
 local procedure GetPriceCalculationHandler(SalesHeader: Record "Sales Header"; var PriceCalculation: Interface "Price Calculation")
    var
        PriceCalculationMgt: codeunit "Price Calculation Mgt.";
        SalesLinePrice: Codeunit "Sales Line - Price";
        PriceType: Enum "Price Type";
    begin
        if (SalesHeader."No." = '') and ("Document No." <> '') then
            SalesHeader.Get("Document Type", "Document No.");
        SalesLinePrice.SetLine(PriceType::Sale, SalesHeader, Rec);
        PriceCalculationMgt.GetHandler(SalesLinePrice, PriceCalculation);
    end;
 
    procedure ApplyDiscount(var PriceCalculation: Interface "Price Calculation")
    begin
        PriceCalculation.ApplyDiscount();
        GetLineWithPrice(PriceCalculation);
    end;
 
    procedure ApplyPrice(CalledByFieldNo: Integer; var PriceCalculation: Interface "Price Calculation")
    begin
        PriceCalculation.ApplyPrice(CalledByFieldNo);
        GetLineWithPrice(PriceCalculation);
    end;
```
### Price Source
The Price Source interface defines methods for a generic price source. The list of supported sources is defined by the Price Source Type enum. The interface is used in the Price Source table to validate the primary key fields and look up respective tables, as shown in the following table.

:::image type="content" source="../media/best-pricing-diagram6-price-source-type.png" alt-text="Diagram showing methods for a generic price source.":::

## Examples of Extended Price Calculations
You can extend price calculations if you want them to include other sources or use different calculations. The following sections provide some examples.

### Example: Change an Item Price When Combined with Another Item 
Scenario: Let's say want to make the price of one item depend on whether it's sold individually or bundled with one or more other items. In this example we'll use licenses for Business Central.

> [!NOTE]
> The prices, names, and combinations are fictional and intended only for use in this example. They do not reflect anything in the real-world.

We have the following licenses in our price list.

|Asset Number|Name  |Monthly Base Price Per User|
|---------|---------|---------|
|70061|BC Premium|$100|
|70062|BC Essentials|$75|
|70063|BC Team Member|$8|
|70064|Sales Professional|$65|
|70065|Customer Service Pro|$50|

If you buy 70061 or 70062 alone their prices do not change. However, let's say that we want to offer discounts when one license is purchased along with another. For example, we want to sell 70064 at a reduced monthly rate when it's purchased in combination with 70061 or 70062. Our list could then look like this.

|Asset Number  |Name  |Monthly Base Price Per User|Bundle Price|
|---------|---------|---------|---------|
|70061|BC Premium|$100|N/A|
|70062|BC Essentials|$75|N/A|
|70063|BC Team Member|$8|N/A|
|70064|Sales Professional|$65|$20 when bundled with 70061 or 70062.|
|70065|Customer Service Pro|$50|$21 when bundled with 70061 or 70062.|

Let's look at some sample extensions that will implement this for us. 

The first extension adds a new field named Attach to Line No. to the Sales Line table and recalculates pricing when we make a change. This field will let us create the combinations that determine our discounts. It also copies the GetPriceCalculationHandler() function from the Sales Line table.

```
tableextension 50001 "Attach Price" extends "Sales Line"
{
    fields
    {
        field(50001; "Attach To Line No."; Integer)
        {
            trigger OnValidate()
            var
                PriceCalculation: Interface "Price Calculation";
            begin
                GetPriceCalculationHandler(PriceCalculation);
                ApplyPrice(FieldNo("Attach To Line No."), PriceCalculation);
            end;
        }
    }

    local procedure GetPriceCalculationHandler(var PriceCalculation: Interface "Price Calculation")
    var
        SalesHeader: Record "Sales Header";
        PriceCalculationMgt: codeunit "Price Calculation Mgt.";
        SalesLinePrice: Codeunit "Sales Line - Price";
        PriceType: Enum "Price Type";
    begin
        SalesHeader.Get("Document Type", "Document No.");
        SalesLinePrice.SetLine(PriceType::Sale, SalesHeader, Rec);
        PriceCalculationMgt.GetHandler(SalesLinePrice, PriceCalculation);
    end;
}

```

The next extension adds the Attach Line No field to the Sales order page (subform).

```
pageextension 50001 "Attach Price" extends "Sales Order Subform"
{
    layout
    {
        addAfter(Quantity)
        {
            field("Attach To Line No."; "Attach To Line No.")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}

```
The following table extension adds the Attach to Item No. field to the "Price List line" table.
```
tableextension 50002 "Attach To Price - Line" extends "Price List Line"
{
    fields
    {
        field(50001; "Attach To Item No."; Code[20])
        {
        }
    }
}
```
The following table extension adds the Attach to Item No. field to the "Price Calculation Buffer" table.

```
tableextension 50003 "Attach To Price - Buffer" extends "Price Calculation Buffer"
{
    fields
    {
        field(50001; "Attach To Item No."; Code[20])
        {
        }
    }
}

```
The calculation that links these three new fields is based on the following events: 

- OnAfterSetFilters() – Sets the filter on the price list line when the best price is being searched; 
- OnAfterFillBuffer() – Copies the value from the sales line to the buffer. 
- FindItemToAttachToInLine() - Defines the value of the item number stored in the sales line that we attach to.

```
codeunit 50004 "Attached Price Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation Buffer Mgt.", 'OnAfterSetFilters', '', false, false)]
    procedure OnAfterSetFilters(var PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var PriceCalculationBuffer: Record "Price Calculation Buffer"; ShowAll: Boolean);
    begin
        PriceListLine.SetRange("Attach To Item No.", PriceCalculationBuffer."Attach To Item No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterFillBuffer', '', false, false)]
    procedure OnAfterFillBuffer(var PriceCalculationBuffer: Record "Price Calculation Buffer"; SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line");
    begin
        PriceCalculationBuffer."Attach To Item No." := FindItemToAttachToInLine(SalesLine);
    end;

    local procedure FindItemToAttachToInLine(CurrSalesLine: Record "Sales Line"): Code[20]
    var
        SalesLine: Record "Sales Line";
    begin
        if SalesLine.Get(CurrSalesLine."Document Type", CurrSalesLine."Document No.", CurrSalesLine."Attach To Line No.") then
            exit(SalesLine."No.");
    end;
}
```
As stated earlier, the new price calculation capabilities are not available in the user interface. When a page does become available, either, from Microsoft or one that you develop yourself, you can use the following code to extend the page with the new control.

```
   field("Attach To Item No."; "Attach To Item No.")
   { }
```
<!--### Calculate Prices Based on a Price Hierarchy

Add example-->

## See Also
[Extending Application Areas](devenv-extending-application-areas.md)