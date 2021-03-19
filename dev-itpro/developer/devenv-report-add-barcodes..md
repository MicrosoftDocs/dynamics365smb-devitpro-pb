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

## Supported barcode font and symbologies 

Business Central supports the following one-dimensional barcode fonts and symbologies. These fonts are available with Business Central online. For Business Central on-premises,  

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
> These fonts are available with Business Central online.  For Business Central on-premises, you'll have get these fonts from Ida manufacturer.

Extending the barcode encoder library (on-premises)
If you would like to use a different set of barcode fonts for your on-premises installation, you need to extend the barcode encoder library (adhering to the interface in the module) to supply encoding functions that work with those fonts. Consider contributing to the open source project if you do that

### Overview

The barcode functionality for reports is provided by the **Barcode** module of the System Application. The module provides the objects and tools that developers need to add barcodes to reports. exposes functionality for encoding barcodes, and uses to define a barcode font provider for generating barcodes. By default, the module is designed to use IDAutomation 1D as the barcode provider. The module requires that barcode fonts used by the provider are included barcode encode library. With Business Central online, the required fonts are already available in this library. For on-premises, you have to obtain the barcode fonts. You can either use the  are e module is ready to use

The Barcode Encoder module in the system application provides the objects and tools that developers need to add barcodes to reports. The module also provides the barcode fonts that you can use out-of-the-box in Business Central online. However, if you are using Business Central on-premises, you must license the fonts from IDAutomation and install them on the virtual machine where the Business Central server (NST) is running.
Extending the barcode encoder library (on-premises)
If you would like to use a different set of barcode fonts for your on-premises installation, you need to extend the barcode encoder library (adhering to the interface in the module) to supply encoding functions that work with those fonts. Consider contributing to the open source project if you do that.

 
A barcode symbology is the mapping between data and the barcode image. It defines how to encode the data, including computation of a checksum and required start and stop marker symbols.

## Encoding a string in AL

To represent a string as a barcode in a report, it must be encoded according to the symbology needed. The Barcode system module has encoder functions in codeunit 9215 "IDAutomation 1D Provider" that can be used with barcode fonts from IDAutomation (which are available in BC online). 
You use the procedure ValidateInput to validate if a string can be encoded in a given symbology, and then the EncodeFont procedure to do the actual encoding.
In the table 9203 "Barcode Encode Settings" you can configure smaller variations in how different symbologies work, such as enabling extended character set or checksums in Code39, or setting the code set (A, B, or C) used in Code128. 
Adding the encoded string to the report dataset
To show the barcode in a report, you must add the encoded string to the report dataset. 
Using a barcode font in the report layout
Each of the supported symbologies have corresponding fonts installed in BC Online. To use a barcode font in the report layout, simply mark the encoded string from the dataset with the font.
For develeopers, it is possible to use a font in a layout without having it installed on the machine you use to develop the layout. Without the font, the report will not show the barcode, but when you then test the report in a BC online sandbox, then it will be shown on the report.
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
