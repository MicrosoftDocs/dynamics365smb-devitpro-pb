---
title: "Extending Price Calculations"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Extending Price Calculations
If you record special prices and line discounts for sales and purchases, [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] can automatically calculate prices on sales and purchase documents, and on job and item journal lines. The price is the lowest permissible price with the highest permissible line discount on a given date. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] automatically calculates the price when it inserts the unit price and the line discount percentage for items on new document and journal lines. For more information, see [Price Calculation](/dynamics365/business-central/sales-how-record-sales-price-discount-payment-agreements#best-price-calculation).


2020 release wave 1 introduces a second implementation of price calculations that will be available as an alternative to the calculations that were available in 2019 release wave 2 and earlier versions. This new implementation has the advantage that it is much easier to extend, for example, with new calculations.

Price calculations that were available in 2019 release wave 2 are unchanged. The new calculations in 2020 release wave 1 are an alternative implementation that you can extend. 

> [!NOTE]
> The new price calculation capabilities in 2020 release wave 1 exist in code only, and do not include any user experience. We will provide that in an upcoming release. For now, to use the new capability you must create your own page.

This topic describes how price calculations are implemented in 2020 release wave 1 (referred to as "Business Central Version 16" in the illustrations), and provides comparisons with 2019 release wave 2 (referred to as "Business Central Version 15" in the illustrations) to show what we have changed. It also provides some examples of how you can extend price calculations in 2020 release wave 1. 

## Price Calculation Setup
Price calculation are based on the **Price Calculation Setup** table, where you can choose an existing implementation, as shown in the following image.

:::image type="content" source="../media/best-pricing-diagram1-setup.png" alt-text="Diagram showing a price calculation implementation.":::

The Price Calculation Setup table has the Code field as its primary key. The value of the field is calculated by combining the values in the Method, Type, Asset Type, and Implementation fields. For example, it is '[1-1-0]-7003' for the setup line when the following fields contain the following values: 

- Method contains Lowest Price
- Type contains Sale
- Asset Type contains All
- Implementation is Business Central (Version 15.0)"

You can have multiple setups with the same combination of method, type, and asset type. The implementation value should always be different though, because each implementation provides different calculations. The default implementation is defined by the Default field. For example, in 2020 release wave 1 the following setups are available:

|Method  |Type  |Asset Type  |Implementation  |Default  |
|---------|---------|---------|---------|---------|
|Lowest Price|Sale|All|Business Central (Version 15.0)|X|
|Lowest Price|Sale|All|Business Central (Version 16.0)| |

By default, all sales lines use the "Business Central (Version 15.0)" implementation to calculate prices, unless the second line has detailed setup lines that define exceptions. 

The Price Calculation method on the document line searches for a setup that that has a matching combination of the method, the price type, and asset type on the document line. The method then searches for detailed lines that contain exceptions for the combination of a source group (Customer, Vendor, and Job) and an asset (Item, Resource, and so on) on the document line. If we find a matching setup we use its implementation for price calculation. If there is no matching setup exception, we use the default implementation. 

For example, let's say we have a line on a sales order for Customer 20000 contains item 1000. The default implementation for the sale of any asset is "Business Central (Version 15.0)," but "Business Central (Version 16.0)" implementation contains a detailed setup line for Item 1000. That means that the "Business Central (Version 16.0)" implementation will calculate the price. 
Detailed setup records are to be entered by users and only make sense for the non-default setup records. The following image shows the relation between the setup line and the detailed setup.

:::image type="content" source="../media/best-pricing-diagram2-detailed-setup.png" alt-text="Diagram showing an example of a default setup.":::

For the Business Central (Version 15.0) implementation, you can only edit the Default field. The records are inserted by the codeunits that subscribe to the OnFindSupportedSetup() event in the Price Calculation Mgt. codeunit. The two price calculation implementation codeunits add pairs of such records, one for the sale of assets and another for purchases. 
Because the Price Calculation Setup table is extensible, you can add new fields to the key by subscribing to the OnAfterDefineCode() event.

### Price Type
The Type field is an extensible Price Type enum that contains the following values:

* Any (0)
* Sale (1)
* Purchase (2)

The values are part of the composite key in the Price Calculation Setup table. Sales and service lines use the Sale type, purchase lines use the Purchase type, and job or item journal lines use both for calculating price and cost. The Any value is the default value, and is used when a line contains both a price and a cost.

### Asset Type
The "Asset Type" field is an extensible "Price Asset Type" enum that contains the following values:

* All (0)
* Item (10)
* Item Discount Group (20)
* Resource (30)
* Resource Group (40)
* Service Cost (50)
* G/L Account (60)

The Asset Type is part of the composite key in the Price Calculation Setup table. If the only setup record contains "Asset Type" - All it means that there is no need in special price calculation implementations per asset type. The default implementation will be used regardless of an asset type in the document line. If you need different implementations you must add a setup lines with another asset type. For example, the following table shows a Resource Pricing implementation with a Resource asset type. 

|Method  |Type  |Asset Type  |Implementation  |Default  |
|---------|---------|---------|---------|---------|
|Lowest Price |Sale |All|Business Central (Version 15.0)|X|
|Lowest Price |Sale |Resource|Resource Pricing |X|

Because only one record has the combination of Lowest Price, Sale, and Resource it will be the default. If a sales line sells a resource, its price will be calculated by Resource Pricing implementation. All other assets will use the "Business Central (Version 15.0)" implementation.

### Price Calculation Method
The Method field is an extensible Price Calculation Method enum that contains the following values: 

* Not defined (0)
* Lowest Price (1)

The method value is part of the composite key in the Price Calculation Setup table. A sales document line inherits the method value from the sales header, which in turn inherits it from one of the following, depending on where it's defined:

* Customer
* Customer price group
* Sales & Receivable Setup table 

The Sales & Receivable Setup table defines the default method, Lowest Price, for all sales prices. If you want to use a different method, you can specify it on a customer price group or a customer. You cannot edit the method on sales document headers or lines.

:::image type="content" source="../media/best-pricing-method-sales-setup.png" alt-text="Diagram showing the setup for sale.":::

The Purchase & Payables Setup table also defines the default method for all purchase prices. You can redefine it for a certain vendor. You cannot edit the method on purchase document headers or lines. 

:::image type="content" source="../media/best-pricing-method-purchase-setup.png" alt-text="Diagram showing the setup for purchase.":::

## Data Structure Comparison
The Business Central (Version 15.0) calculation uses the following tables that store information about prices, costs, and discounts: 

* table 7002 "Sales Price" 
* table 7004 "Sales Line Discount" 
* table 7012 "Purchase Price" 
* table 7014 "Purchase Line Discount" 
* table 201 "Resource Price" 
* table 1014 "Job G/L Account Price" 
* table 1013 "Job Item Price" 
* table 1012 "Job Resource Price" 

The Business Central (Version 16.0) calculation uses the following table: 

<!--* table 7000 "Price List" -->
* table 7001 "Price List Line" 

Table 7001 "Price List Line" is compatible with all tables used by the Business Central (Version 15.0) calculation. It contains the set of CopyFrom() methods that convert the data from the tables to the Price List Line table. 

If you extended the Business Central (Version 15.0) tables you must also extend the Price List Line table and the CopyFrom() methods by subscribing to special events. Here's are examples that extend the Sales Price table with a Document No. field.

```
tableextension 50010 "Document No in Sales Price" extends "Sales Price"
{
    fields
    {
        field(50000; "Document No."; Code[20])
        { }
    }
}
```
Now we'll extend the Price List Line table with the same field.

```
tableextension 50011 "Doc. No in Price List Line" extends "Price List Line"
{
    fields
    {
        field(50000; "Document No."; Code[20])
        { }
    }
}
```
Now we'll subscribe to the 'OnCopyFromSalesPrice' event to copy data from "Sales Price" to "Price List Line" table.

```
codeunit 50012 "Copy DocumentNo to Price List"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::CopyFromToPriceListLine, 'OnCopyFromSalesPrice', '', false, false)]
    procedure CopyFromSalesPriceHandler(var SalesPrice: Record "Sales Price"; var PriceListLine: Record "Price List Line");
    begin
        PriceListLine."Document No." := SalesPrice."Document No.";
    end;
}
```
The Price Calculation Method field is added to all tables that need calculated prices and discounts: 

* table 37 "Sales Line" 
* table 5902 "Service Line" 
* table 39 "Purchase Line" 
* table 246 "Requisition Line"  
* table 83 "Item Journal Line" 
* table 753 "Standard Item Journal Line" 
* table 210 "Job Journal Line" 
* table 1003 "Job Planning Line" 

The following image shows the schema of how the methods called in the Sales Line table get the price and discount amounts from either the Sales Price or Price List Line tables.

:::image type="content" source="../media/best-pricing-diagram3-data-sources.png" alt-text="Diagram showing an price calculation for a sales line.":::

## Interface Objects
AL interface objects are important for extensibility. They define the capabilities that are available to an object, and allow implementations to differ as long as they comply with the interface requirements. For more information, see [Interfaces in AL](devenv-interfaces-in-al.md).

Price calculation uses the following AL interface objects:

* Price Calculation
* Line With Price
* Price Source Group
* Price Source

### Price Calculation
The Price Calculation interface defines methods that calculate amounts and discount percentages on journal and document lines.

In Business Central (Version 15.0) and earlier, the Price Calculation – V15 interface implementation calls the Sales Price Calc. Mgt. and Purch. Price Calc. Mgt. codeunits to calculate prices. In Business Central (Version 15.0), the implementation codeunit is Price Calculation – V16. This codeunit works the same as "Price Calculation – V15" but is based on a different price line table and makes it easier to extend price calculations. 

The Price Calculation - Undefined implementation is used when the setup line does not contain a match for the document line. This implementation will display a message that states the combination that is missing. 

:::image type="content" source="../media/best-pricing-diagram4-price-calculation.png" alt-text="Best price setup":::

You can add a new implementation codeunit or reuse one as a starting point and rewrite it as needed. For the new codeunit, you must extend the Price Calculation Handler enum that implements Price Calculation interface and is used in the Price Calculation Setup table.

```
enumextension 50000 "SpecialPriceHandler" extends "Price Calculation Handler"
{
    value(50000; "Special Price")
    {
        Implementation = "Price Calculation" = "Price Calc. - Special Price";
    }
}
```
Afterword you can insert a record in the Price Calculation Setup table and set the new implementation as the default.

The following code in codeunit 7001 "Price Calculation Mgt." returns a Price Calculation interface that initialized with the instance of the Line With Price interface that depends on the setup record:

```
procedure GetHandler(
    LineWithPrice: Interface "Line With Price"; 
    var PriceCalculation: Interface "Price Calculation") Result: Boolean;
    var
        PriceCalculationSetup: Record "Price Calculation Setup";
    begin
        Result := FindSetup(LineWithPrice, PriceCalculationSetup);
        PriceCalculation := PriceCalculationSetup.Implementation;
        PriceCalculation.Init(LineWithPrice, PriceCalculationSetup);
    end;

```
After the price calculation implementation is defined the document line typically calls the methods in the interfrace that calculate the price and discount. The following code is used in the Sales Line table:

```
    var
        Line: Variant;
    begin
        PriceCalculation.ApplyDiscount();
        PriceCalculation.ApplyPrice(CalledByFieldNo);
        PriceCalculation.GetLine(Line);
        Rec := Line;
    end;
```

### Line With Price
The Line With Price interface defines methods for lines that require the calculation of a price, cost, and line discount. The following image shows the codeunits that implement this interface.

:::image type="content" source="../media/best-pricing-diagram5-line-with-price.png" alt-text="Diagram showing an implementation of the Line With Price interface.":::

The following example shows a typical use of the codeunits in the Sales Line table.

```
     var
        PriceCalculationMgt: codeunit "Price Calculation Mgt.";
        PriceCalculation: Interface "Price Calculation";                 
        SalesLinePrice: Codeunit "Sales Line - Price";
        PriceType: Enum "Price Type";
    begin
        SalesLinePrice.SetLine(PriceType::Sale, SalesHeader, Rec);
        PriceCalculationMgt.GetHandler(SalesLinePrice, PriceCalculation);
    end;
```
The SalesLinePrice codeunit is declared directly because this is the sales line context. The instance is initialized by the interface's SetLine() method, and then passed to the GetHandler() method for PriceCalculation initialization because all Price Calculation implementation codeunits include an instance of the Line With Price interface, which stores data about document and journal lines. The following example shows how to declare the interface variable.

```
    var
        CurrLineWithPrice: Interface "Line With Price";
```
### Price Source Group
The Price Source Group interface defines methods for a generic price source group. The Price Source Group enum defines the list of supported source groups, as follows:

* All (0)
* Customer (11)
* Vendor (21)
* Job (31)

This enum is the subset of the Price Source Type enum. Both enums implement the Price Source Group interface. The interface helps to link the Price Source Type enum with the Sale Price Source Type, Purchase Price Source Type, and Job Price Source Type enums.

:::image type="content" source="../media/best-pricing-price-sources-group.png" alt-text="Diagram showing a price sources group.":::

### Price Source
The Price Source interface defines methods for price sources, such as vendors or customers. The list of supported sources is defined by the Price Source Type enum. The interface is used in the Price Source table to validate the primary key fields and look up respective tables, as shown in the following table.

:::image type="content" source="../media/best-pricing-diagram6-price-source-type.png" alt-text="Diagram showing methods for a generic price source.":::

#### Example
The Price Source enum implements the Price Source interface and defines Price Source -  Customer as the implementation for the value Customer.

```
enum 7003 "Price Source Type" implements "Price Source", "Price Source Group"
    value(11; Customer)
    {
        Implementation = "Price Source" = "Price Source - Customer",
                   "Price Source Group" = "Price Source Group - Customer";
    }
```
The Price Source table has a public method LookupNo() that opens a different page depending on the Source Type value. The PriceSourceInterface variable gets the implementation value from the Source Type enum value and then calls the interface's IsLookupOK(Rec) method.

```
table 7005 "Price Source"
    var
        PriceSourceInterface: Interface "Price Source";

    procedure LookupNo() Result: Boolean;
    begin
        PriceSourceInterface := "Source Type";
        Result := PriceSourceInterface.IsLookupOK(Rec);
    end;
```

Because the source type Customer implementation is the "Price Source - Customer" codeunit, the interface calls its IsLookupOK() method and then opens the Customer List page.

```
codeunit 7032 "Price Source - Customer" implements "Price Source"

    procedure IsLookupOK(var PriceSource: Record "Price Source"): Boolean
    begin
        if Customer.Get(PriceSource."Source No.") then;
        if Page.RunModal(Page::"Customer List", Customer) = ACTION::LookupOK then begin
            PriceSource.Validate("Source No.", Customer."No.");
            exit(true);
        end;
    end;
```
## Example of Extended Price Calculations
You can extend price calculations, for example, to include other sources or use calculations that allow for combinations and dependencies. The following sections provide an example.

### Example: Change an Item Price When Combined with Another Item 
Let's say we want to make the price of one item depend on whether it's sold individually or bundled with one or more other items. We'll use software licenses in this example, but the same principles apply in other scenarios.

> [!NOTE]
> The prices, names, and combinations in this example are completely fictional and intended only to support the scenario described here. They do not reflect anything in the real-world.

We have the following licenses in our price list. If you buy 70061 or 70062 alone their prices do not change. However, let's say that we want to offer discounts when one license is purchased along with another. For example, we want to sell 70064 at a reduced monthly rate when it's purchased in combination with 70061 or 70062. Our list would then look like this.

|Asset Number  |Name  |Monthly Base Price Per User|Bundle Price|
|---------|---------|---------|---------|
|70061|BC Premium|$100|N/A|
|70062|BC Essentials|$75|N/A|
|70063|BC Team Member|$8|N/A|
|70064|Sales Professional|$65|$15 and $16 when bundled with 70061 or 70062.|
|70065|Customer Service Pro|$50|$20 and $21 when bundled with 70061 or 70062.|

The following image shows an example of a Sales Line page that is extended with the Attached to Line No. field. Notice that the prices are changed based on the combinations of licenses.

:::image type="content" source="../media/best-pricing-sales-lines.png" alt-text="Image that shows an example of an extended Price List page.":::

Let's look at some sample extensions that will implement this for us. 

The first table extension adds a new field named Attach to Line No. to the Sales Line table and recalculates pricing when we make a change. This field will let us create the combinations that determine our discounts. It also copies the GetPriceCalculationHandler() function from the Sales Line table.

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

The following page extension adds the Attach Line No. field to the Sales order page (subform). 

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

- OnAfterSetFilters() – Sets the filter on the price list line when searching for the price. 
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
The new price calculation capabilities are not available in the user interface. When a page does become available, either, from Microsoft or one that you develop yourself, you can use the following sample code to extend the page with a new control.

```
   field("Attach To Item No."; "Attach To Item No.")
   { }
```

## See Also
[Extending Application Areas](devenv-extending-application-areas.md)
