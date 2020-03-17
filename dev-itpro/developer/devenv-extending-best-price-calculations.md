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
This topic describes how best price calculations are implemented, and provides some examples of how you can extend them. 

If you record special prices and line discounts for sales and purchases, [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] can optimize your profit by automatically calculating the best price on sales and purchase documents, and on job and item journal lines.

The best price is the lowest permissible price with the highest permissible line discount on a given date. Business Central automatically calculates this when it inserts the unit price and the line discount percentage for items on new document and journal lines. For more information, see [Best Price Calculation](/dynamics365/business-central/sales-how-record-sales-price-discount-payment-agreements.md#best-price-calculation).

## Price Calculation Extensibility
Price calculation is based on an extensible data structure. The **Price Calculation Page** lets you choose one of the existing implementations of price calculation, as shown in the following image.

Insert diagram

The combination of a price type (sales or purchase) and asset type (item, resource, G/L account, and so on) determines the method (all three are extendable enums) and the handler. There can be multiple handlers for the same method that will implement a certain calculation. 

The codeunits that implement specific calculations subscribe to the OnFindImplementation() event of codeunit 7001 "Price Calculation Mgt." and return the combinations of setup records that can be handled by the current codeunit. The **Price Calculation Setup** page collects these combinations and you can choose one of the existing concurrent handlers.

For example, the calculation of sale prices for all asset types can be handled by the "Business Central (Version 16.0)" codeunit, but calculation of purchase prices – by "Business Central (Version 15.0)" codeunit.

Insert image? Is this UI available?

If you want to add concurrent handlers and new methods you can add detailed setup lines that define combinations of assets and sources that use a method that you specify.

Insert image

The detailed setup lines shown in the following image mean that all sales prices for Customer 10000 and job GUILFORD, 10 CR are calculated by the Business Central (version 16.0) handler.

Insert image

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

* table 7000 "Price List" 
* table 7001 "Price List Line" 

The table 7001 "Price List Line" is compatible with all tables used by the Business Central (Version 15.0)" calculation. It contains the set of CopyFrom() methods that convert them in the price list line. 

The Price Calculation Method field is added to all tables that need calculation of prices/discounts: 

* table 37 "Sales Line" 
* table 5902 "Service Line" 
* table 39 "Purchase Line" 
* table 246 "Requisition Line"  
* table 83 "Item Journal Line" 
* table 753 "Standard Item Journal Line" 
* table 210 "Job Journal Line" 
* table 1003 "Job Planning Line" 

The following image shows the schema of how the methods called in sales line get price/discount amounts from either the Sales Price or Price List Line tables.

Insert image

## Interface Objects
Best price calculation uses the following AL interface objects:

* Price Calculation
* Line With Price
* Price Source

### Price Calculation
The Price Calculation interface defines methods that calculate amounts and discount percentages in journal and document lines. The Price Calculation - Native codeunit implements the interface, as shown in the following image.

Insert image

To add another implementation codeunit you must also extend the Price Calculation Handler enum that implements the Price Calculation and is used in the Price Calculation Setup table.

### Line With Price
The Line With Price interface defines methods for a generic line that requires the calculation of a price, cost, and line discount. There are eight codeunits that implement this interface, as shown in the following image.

Insert image

The following example shows a typical use of these codeunits in the Sales Line table.

Insert example

### Price Source
The Price Source interface defines methods for a generic price source. The list of supported sources is defined by the Price Source Type enum. The interface is used in the Price Source table to validate the primary key fields and look up respective tables.

Insert image

## Examples of Extended Best Price Calculations
You can extend best price calculations if you want them to include other sources or use different calculations. The following sections provide some examples.

### Calculate Best Price Based on a Price Hierarchy

Add example

### Include a New Source in a Best Price Calculation

Add example

## See Also
[Extending Application Areas](devenv-extending-application-areas.md)