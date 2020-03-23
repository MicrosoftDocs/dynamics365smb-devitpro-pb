---
title: "Extend Best Price Calculations"
ms.custom: na
ms.date: 03/17/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Extending Best Price Calculations
If you record special prices and line discounts for sales and purchases, [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] can optimize your profit by automatically calculating the best price on sales and purchase documents, and on job and item journal lines.

The price is the lowest permissible price with the highest permissible line discount on a given date. Business Central automatically calculates this when it inserts the unit price and the line discount percentage for items on new document and journal lines. For more information, see [Best Price Calculation](/dynamics365/business-central/sales-how-record-sales-price-discount-payment-agreements.md#best-price-calculation).

This topic describes how price calculations are implemented in 2020 release wave 1 (16), and provides comparisons with 2019 release wave 2 (15) to show what we have changed. It also provides some examples of how you can extend price calculations in 2020 release wave 1. 

Version 15 will continue to work as it always has. The changes for version 16 are an alternative implementation. The calculations work the same, but are structured differently so that they are extensible. 

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
The Line With Price interface defines methods for a generic line that requires the calculation of a price, cost, and line discount. There are eight codeunits that implement this interface, as shown in the following image.

:::image type="content" source="../media/best-pricing-diagram5-line-with-price.png" alt-text="Diagram showing an impementation of the LIne WIth Price interface.":::

The following example shows a typical use of these codeunits in the Sales Line table.

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

## Examples of Extended Best Price Calculations
You can extend best price calculations if you want them to include other sources or use different calculations. The following sections provide some examples.

### Make the Price of an Item Dependent on Another 

Add example

<!--### Calculate Best Price Based on a Price Hierarchy

Add example-->

## See Also
[Extending Application Areas](devenv-extending-application-areas.md)