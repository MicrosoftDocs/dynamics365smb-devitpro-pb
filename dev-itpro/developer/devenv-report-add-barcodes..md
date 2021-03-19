----
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

## Adding barcodes to reports

This article explains how to add barcodes to a report. There are things to think about

- Prepare the data that you want to encode
- Add a barcode font to the report layout.

## Overview

The barcode functionality for reports is provided by the **Barcode** module of the System Application. The module includes the objects and tools that developers need to add barcodes to reports. It exposes functionality for encoding barcodes from font provider for generating barcodes on reports.

By default, the module is designed to use fonts from IDAutomation, which is defined as the barcode provider. Business Central online comes fully equipped the IDAutomation fonts. For on-premises, you have two options:

- License the fonts from IDAutomation

    You'll then have to install the fonts on the machine where Business Central server is running.

- Obtain barcode fonts from other manufactures

    In this case, you'll have to extend the barcode encoder library to provide encoding functions that work with these fonts. Be sure to adhere to the interface in the module. Consider contributing to the open-source project if you do.

For more information about this module, see the [ALExtensions on GitHub](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Barcode).

## Supported barcode font and symbologies 

Business Central supports the following one-dimensional barcode fonts and symbologies. These fonts are available with Business Central online. For Business Central on-premises,   
A barcode symbology is the mapping between data and the barcode image. It defines how to encode the data, including computation of a checksum and required start and stop marker symbols.

|Font|Symbologies|Specifications|
|----|-----------|--------------
|Code39|Code39|https://www.idautomation.com/barcode-fonts/code-39/fontnames/
|Codabar|Codabar|
|Code 128|Code 128|
|Interleaved 2 of 5|Interleaved 2 of 5|
|MSI Plessey|MSI Plessey|
|UPC/EAN|<ul><li> UPC-A</li><li>UPC-E</li><li>EAN-8</li><li>EAN-13</li></ul>|
|USPS|<ul><li> IMB</li><li>Postnet</li><li>Planet</li></ul>|

> [!NOTE]
> These fonts are available with Business Central online.


## Encoding a string in AL

To represent a string as a barcode in a report, it must be encoded according to the wanted symbology. The Barcode module has encoder functions in codeunit **9215 "IDAutomation 1D Provider" that can be used with barcode fonts from IDAutomation (which are available in BC online). 
You use the procedure ValidateInput to validate if a string can be encoded in a given symbology, and then the EncodeFont procedure to do the actual encoding.
In the table 9203 "Barcode Encode Settings" you can configure smaller variations in how different symbologies work, such as enabling extended character set or checksums in Code39, or setting the code set (A, B, or C) used in Code128. 
Adding the encoded string to the report dataset
To show the barcode in a report, you must add the encoded string to the report dataset. 
Using a barcode font in the report layout
Each of the supported symbologies have corresponding fonts installed in BC Online. To use a barcode font in the report layout, simply mark the encoded string from the dataset with the font.
For develeopers, it's possible to use a font in a layout without having it installed on the machine you use to develop the layout. Without the font, the report won't show the barcode, but when you then test the report in a BC online sandbox, then it will be shown on the report.
If you want to use the IDAutomation barcode fonts from in an on-premises installation, you need to license them from IDAutomation and install them on the VM that runs the BC server (NST).

See also
Available barcode fonts


## See Also
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
