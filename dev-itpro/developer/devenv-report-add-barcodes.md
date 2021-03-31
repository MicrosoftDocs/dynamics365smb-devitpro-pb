---
title: "Adding barcodes to reports"
description: "Learn how you can add barcodes to a report."
author: jswymer
ms.custom: na
ms.date: 03/19/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Adding Barcodes to Reports

This article explains how to add barcodes to reports using the barcode functionality in [!INCLUDE[prod_short](includes/prod_short.md)].

## Overview and setup

The barcode functionality lets you convert an alphanumeric value in a report dataset into a barcode on a generated report. The functionality is provided by the **Barcode** module of the System Application. The module includes the objects and tools that you need to add barcodes to reports. Using the API, you create barcode font providers for generating data strings as barcodes. A barcode provider includes a library of different barcode fonts and symbologies. Barcode font encoders are included in the provider to convert data strings to the specific font specification and symbology. 

Business Central online comes fully equipped with a barcode provider and fonts from IDAutomation, so you can start adding barcodes to reports right away. For a description of the available fonts, see [](devenv-report-barcode-fonts.md).

For more information about this module, see the [AL Extensions on GitHub](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Barcode).

### Setting up Business Central on-premises

With [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, there a couple tasks you'll need to do before you can start adding barcodes to your reports.  

1. Get the barcode fonts that you want to use on reports.

    You can get barcode fonts from any font provider. If you use the IDAutomation fonts, you can skip the next step and use the built-in IDAutomation barcode font provider.

2. Create your own barcode font provider with encoders for the fonts.

   Adhere to the interface in the Barcode module. Consider contributing to the open-source project if you do.
3. Install the fonts on the [!INCLUDE[server](includes/server.md)] computer or machine.

    Install the fonts in the [!INCLUDE[server](includes/server.md)] instance installation folder. By default, the folder is C:\Program Files\Microsoft Dynamics 365 Business Central\XXX\Service
<!--

- License the fonts from IDAutomation

    You'll then have to install the fonts on the machine where Business Central server is running.

- Obtain barcode fonts from other manufactures

    In this case, you'll have to extend the barcode encoder library to provide encoding functions that work with these fonts. Be sure to adhere to the interface in the module.

## Barcode font and symbologies with Business Central online

Business Central online includes the following one-dimensional barcode fonts and symbologies from IDAutomation. The fonts have different specifications for characteristics like encode numbers, symbols, uppercase, and lowercase text. Knowing the specifications is useful for calibrating fonts used on report layouts.

|Font|Symbologies|Description|
|----|-----------|--------------
|Code39|Code39|<ul><li>Variable length</li><li>43 characters, uppercase letters (A through Z), numeric digits (0 through 9), and special characters (-, ., $, /, +, %, and space)</li><li>* is used for both start and stop delimiters. </li><li>Nine elements per character (five bars and four spaces).</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/code-39/fontnames/). |
|Code_93|Code_39|<ul><li>Primarily by Canada Post to encode delivery information.</li><li>Alphanumeric</li><li>Variable length</li><li>Every symbol includes two check characters.</li><li>Each character is nine modules wide, with three bars and three spaces.</li><li> Each bar and space is from 1 to 4 modules wide.</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/code-39/fontnames/). |
|Codabar|Codabar|<ul><li>Characters 0-9, letters A to D and the following symbols: - $ / +. </li><li>Self-checking, no checksum characters requirement.</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Parentheses ( ) can be used as the start and stop code so letters don't appear readable version of the fonts.</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/codabar/user-manual/)|
|Code 128|Code 128|<ul><li> High-density linear barcode symbology for alphanumeric or numeric-only barcodes </li><li>Encodes 128 ASCII characters</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Compact barcodes compared to other fonts like Code 39, especially when text is mostly digits</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/code-128/user-manual/)|
|Interleaved 2 of 5|Interleaved 2 of 5|<ul><li>Continuous two-width barcode symbology encoding digits</li><li>Encodes pairs of digits. The first digit is encoded in the five bars (black lines). The second digit is encoded in the five interleaved spaces (or white lines). </li><li>Two out of five bars or spaces are wide</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/interleaved-2of5/)|
|MSI Plessey|MSI Plessey|<ul><li>Continuous symbology</li><li>Not self-checking.</li><li>Primarily for inventory control, marking storage containers and shelves in warehouse environments</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/msi/).|
|UPC|<ul><li> UPC-A</li><li>UPC-E</li></ul>|Characters are all contained in a single font represented in several different heights. IDAutomation's UPC / EAN barcode fonts were created according to the latest GS1, UCC, EAN, and ISO/IEC 15420 standards so that the nominal size is achieved when printed at 16 points (or 18 points for 203 DPI printers). Because the standards allow a magnification factor of .8 to 2.0, the fonts may be printed as small as 12 points and as large as 32 points. For best results, these fonts should be printed at the largest point size and height possible in this range. When using a printer with less than 600 DPI, only certain font sizes may be used as defined. See [Specs](https://www.idautomation.com/barcode-fonts/upc-ean/user-manual/).|
|EAN|<ul><li>EAN-8</li><li>EAN-13</li></ul>|Characters are all contained in a single font represented in several different heights. IDAutomation's UPC / EAN barcode fonts were created according to the latest GS1, UCC, EAN, and ISO/IEC 15420 standards so that the nominal size is achieved when printed at 16 points (or 18 points for 203 DPI printers). Because the standards allow a magnification factor of .8 to 2.0, the fonts may be printed as small as 12 points and as large as 32 points. For best results, these fonts should be printed at the largest point size and height possible in this range. When using a printer with less than 600 DPI, only certain font sizes may be used as defined. See [Specs](https://www.idautomation.com/barcode-fonts/upc-ean/user-manual/).|
|USPS|Postnet</li></ul>|<ul><li>Postal Numeric Encoding Technique used by the United States Postal Service to assist direct mail.</li><li>ZIP code encoded in half and full height bars.</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/usps-intelligent-mail/).|

 -->
<!--

|Font|Symbologies|Description|
|----|-----------|--------------
|Code39|Code39|<ul><li>Variable length</li><li>43 characters, uppercase letters (A through Z), numeric digits (0 through 9) and special characters (-, ., $, /, +, %, and space)</li><li>* is used for both start and stop delimiters. </li><li>Nine elements per character (five bars and four spaces).</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/code-39/fontnames/). |
|Codabar|Codabar|<ul><li>Characters 0-9, letters A to D and the following symbols: - $ / +. </li><li>Self-checking, no checksum characters requirement.</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Parentheses ( ) can be used as the start and stop code so letters don't appear readable version of the fonts.</li></ul>See [Specs]((https://www.idautomation.com/barcode-fonts/codabar/user-manual/)|
|Code 128|Code 128|<ul><li> High-density linear barcode symbology for alphanumeric or numeric-only barcodes </li><li>Encodes 128 ASCII characters</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Compact barcodes compared to other fonts like Code 39, especially when text is mostly digits</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/code-128/user-manual/)|
|Interleaved 2 of 5|Interleaved 2 of 5|<ul><li>Continuous two-width barcode symbology encoding digits</li><li>Encodes pairs of digits. The first digit is encoded in the five bars (black lines). The second digit is encoded in the five interleaved spaces (or white lines). </li><li>Two out of five bars or spaces are wide</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/interleaved-2of5/)|
|MSI Plessey|MSI Plessey|<ul><li>Continuous symbology</li><li>Not self-checking.</li><li>Primarily for inventory control, marking storage containers and shelves in warehouse environments</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/msi/).|
|UPC/EAN|<ul><li> UPC-A</li><li>UPC-E</li><li>EAN-8</li><li>EAN-13</li></ul>|characters are all contained in a single font represented in several different heights. IDAutomation's UPC / EAN barcode fonts were created according to the latest GS1, UCC, EAN , and ISO/IEC 15420 standards so that the nominal size is achieved when printed at 16 points (or 18 points for 203 DPI printers). Because the standards allow a magnification factor of .8 to 2.0, the fonts may be printed as small as 12 points and as large as 32 points. For best results, these fonts should be printed at the largest point size and height possible in this range. When using a printer with less than 600 DPI, only certain font sizes may be used as definedSee [Specs](https://www.idautomation.com/barcode-fonts/upc-ean/user-manual/).
|USPS|<ul><li> IMB</li><li>Postnet</li><li>Planet</li></ul>|POSTNET (Postal Numeric Encoding Technique) is a barcode symbology used by the United States Postal Service to assist in directing mail. 
    /// The ZIP Code or ZIP+4 code is encoded in half- and full-height bars.This single Barcode Font Package generates all USPS Intelligent Mail barcodes including IMb Tracing, IMpb, IM Tray Labels, OneCode Confirm, and ACS, Postnet and the IM Container Barcode.
Over 30 font encoders are provided to format data to the fonts.
Native font encoder source code is available for IMb in Visual Basic VBA, SSRS, JavaScript, C++, C#, VB.NET, Oracle and Java.
Includes a code-128 font that is used to generate the IMpb Packing Barcode, Intelligent Mail Container Barcode, and the GS1-128 Delivery Confirmation Barcode.See [Specs](https://www.idautomation.com/barcode-fonts/usps-intelligent-mail/).|
-->

<!--
> [!NOTE]
> Fonts have different specifications for characteristics like encode numbers, symbols, uppercase and lowercase text. Knowing the specifications is useful for calibrating fonts used on report layouts. Refer to the material provided by the font provider for details.

A barcode symbology is the mapping between data and the barcode image. It defines how to encode the data, including computation of a checksum and required start and stop marker symbols.
-->
## Encoding a string in AL

To represent a string as a barcode in a report, it must be encoded according to the symbology you want. The **Barcode** module has encoder methods in codeunit 9215 **IDAutomation 1D Provider** that can be used with barcode fonts from IDAutomation.

Use the `ValidateInput` procedure to validate whether a string can be encoded in a given symbology, and then the `EncodeFont` procedure to do the actual encoding.

Use table 9203 **Barcode Encode Settings** to configure smaller variations in how different symbologies work. For example, you can enable an extended character set or checksums in Code39, or change the code set used in Code128. 

## Adding the encoded string to the report dataset

To show the barcode in a report, you must add the encoded string to the report dataset. The following code shows an example report that displays the **GTIN** field of the **Item** table as a barcode. The barcode uses the EAN-13 font from the built-in IDautomation  barcode font provider.

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

Each supported symbologies has corresponding fonts installed in Business Central online. To use a barcode font in the report layout,  mark the encoded string from the dataset with the font.

For developers, it's possible to use a font in a layout without having it installed on the machine you use to develop the layout. Without the font, the report won't show the barcode, but when you then test the report in a Business Central online sandbox, then it will be shown on the report.

If you want to use the IDAutomation barcode fonts from in an on-premises installation, you need to license them from IDAutomation and install them on the machine that runs the Business Central server.

## See Also
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
