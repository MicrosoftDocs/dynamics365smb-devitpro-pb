---
title: "Adding barcodes to reports"
description: "Learn how you can add barcodes to a report."
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Adding Barcodes to Reports

This article explains how to add barcodes to reports using the barcode functionality in [!INCLUDE[prod_short](includes/prod_short.md)].

## Overview

The barcode functionality lets you convert an alphanumeric value in a report dataset into a barcode on a generated report. The functionality is provided by the **Barcode** module of the System Application. The module includes the objects and tools that you need to add barcodes to reports. Using the API, you create barcode font providers for generating data strings as barcodes. A barcode provider includes a library of different barcode fonts and symbologies. As part of the provider, you add barcode font encoders that convert data strings to the specific font specification and symbology. For more information about this module, see the [AL Extensions on GitHub](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Barcode).

Business Central online comes equipped with a barcode provider and fonts from [IDAutomation](https://www.idautomation.com). So, you can start adding barcodes to reports right away. For a description of the available fonts, see [Barcode Fonts with Business Central Online](devenv-report-barcode-fonts.md).

To start adding barcodes to reports, follow the instructions in the next sections. 

### Setting up Business Central on-premises

With [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, there are couple tasks you'll need to do before you can start adding barcodes to your reports.  

1. Get the barcode fonts that you want to use on reports.

    You can get barcode fonts from any font provider. If you use the IDAutomation fonts, you can skip the next step and use the built-in IDAutomation barcode font provider.

2. Create your own barcode font provider with encoders for the fonts.

   Adhere to the interface in the Barcode module. Consider contributing to the open-source project if you do.
3. Install the fonts on the [!INCLUDE[server](includes/server.md)] computer or machine.

    Install the fonts in the [!INCLUDE[server](includes/server.md)] instance installation folder. By default, the folder is C:\Program Files\Microsoft Dynamics 365 Business Central\XXX\Service

## Encoding a string in AL

To represent a string as a barcode in a report, encode it according to the symbology you want. The **Barcode** module has encoder methods in codeunit 9215 **IDAutomation 1D Provider**. You can use these encoders with barcode fonts from IDAutomation.

Use the `ValidateInput` procedure to validate whether a string can be encoded in a given symbology, and then the `EncodeFont` procedure to do the actual encoding.

Use table 9203 **Barcode Encode Settings** to configure smaller variations in how different symbologies work. For example, you can enable an extended character set or checksums in Code39, or change the code set used in Code128. 

## Adding the encoded string to the report dataset

To show the barcode in a report, add the encoded string to the report dataset. The following code shows an example report that displays the **GTIN** field of the **Item** table as a barcode. The barcode uses the EAN-13 font from the built-in IDautomation barcode font provider.

```al
report 50100 ItemBarcodeReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = Word;
    Caption = 'Item Barcodes';
    WordLayout = 'ItemBarcodes.docx';

    dataset
    {
        dataitem(Items; Item)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Items';

            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }

            column(Unit_Price; "Unit Price")
            {
            }

            column(Barcode; EncodedText)
            {
            }

            trigger OnAfterGetRecord()
            var

                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";

            begin
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::"EAN-13";
                EncodedText := BarcodeFontProvider.EncodeFont(GTIN, BarcodeSymbology);
            end;
        }
    }

    var
        EncodedText: Text;
}
```

## Using a barcode font in the report layout

Each supported symbology has a corresponding font installed in Business Central online. To use a barcode font in the report layout, mark the encoded string from the dataset with the font.

It's possible as a developer to use a font in a layout without having it installed on the machine that you use to develop the layout. Without the font, the report won't show the barcode. But if you then test the report in an online sandbox, it will be shown on the report.

## See Also
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
