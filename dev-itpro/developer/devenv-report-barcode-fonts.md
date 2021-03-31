---
title: "Barcode Fonts with Business Central Online"
description: "Describes the barcode fonts available with Business Central Online."
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

# Barcode Fonts with Business Central Online

Business Central online includes the following one-dimensional barcode fonts and symbologies from [IDAutomation](https://www.idautomation.com). The fonts have different specifications for characteristics like encode numbers, symbols, uppercase, and lowercase text. Knowing the specifications is useful for calibrating fonts used on report layouts.

> [!TIP]
> A barcode symbology is the mapping between data and the barcode image. It defines how to encode the data, including computation of a checksum and required start and stop marker symbol

|Font|Symbology|Description|
|----|-----------|--------------
|Code39|Code39|<ul><li>Variable length</li><li>43 characters, uppercase letters (A through Z), numeric digits (0 through 9), and special characters (-, ., $, /, +, %, and space)</li><li>* is used for both start and stop delimiters. </li><li>Nine elements per character (five bars and four spaces).</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/code-39/fontnames/). |
|Code_93|Code_39|<ul><li>Primarily by Canada Post to encode delivery information.</li><li>Alphanumeric</li><li>Variable length</li><li>Every symbol includes two check characters.</li><li>Each character is nine modules wide, with three bars and three spaces.</li><li> Each bar and space is from 1 to 4 modules wide.</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/code-39/fontnames/). |
|Codabar|Codabar|<ul><li>Characters 0-9, letters A to D and the following symbols: - $ / +. </li><li>Self-checking, no checksum characters requirement.</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Parentheses ( ) can be used as the start and stop code so letters don't appear readable version of the fonts.</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/codabar/user-manual/)|
|Code 128|Code 128|<ul><li> High-density linear barcode symbology for alphanumeric or numeric-only barcodes </li><li>Encodes 128 ASCII characters</li><li>Uppercase letters A, B, C, and D are used for start and stop codes.</li><li>Compact barcodes compared to other fonts like Code 39, especially when text is mostly digits</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/code-128/user-manual/)|
|Interleaved 2 of 5|Interleaved 2 of 5|<ul><li>Continuous two-width barcode symbology encoding digits</li><li>Encodes pairs of digits. The first digit is encoded in the five bars (black lines). The second digit is encoded in the five interleaved spaces (or white lines). </li><li>Two out of five bars or spaces are wide</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/interleaved-2of5/)|
|MSI Plessey|MSI Plessey|<ul><li>Continuous symbology</li><li>Not self-checking.</li><li>Primarily for inventory control, marking storage containers and shelves in warehouse environments</li></ul>See [Specs](https://www.idautomation.com/barcode-fonts/msi/).|
|USPS|Postnet</li></ul>|<ul><li>Postal Numeric Encoding Technique used by the United States Postal Service to assist direct mail.</li><li>ZIP code encoded in half and full height bars.</li></ul> See [Specs](https://www.idautomation.com/barcode-fonts/usps-intelligent-mail/).|
|UPC/EAN|---- |UPC and EAN barcode font characters are contained in a single font represented in several different heights. The fonts can be printed in sizes from 12 points up to 32 points.<br><br>See [Specs](https://www.idautomation.com/barcode-fonts/upc-ean/user-manual/).|
||UPC-A|<ul><li>Common and well-known 12-digit barcode</li><li> Subset of EAN-13</li><li> Encodes GTIN-12 numbers</li></ul> |
||UPC-E|<ul><li>6-digit variation of UPC-A that suppresses trailing zeros. </li><li>Commonly used where space is a factor. </li></ul>.|
||EAN-8|<ul><li>Linear, 12-digit barcode</li><li> Derived from EAN-13, but smaller</li><li> Encodes GTIN-8 numbers</li></ul> |
||EAN-13|<ul><li>12-digit barcode</li><li>Superset of UPC-A, with an extra digit added to every UPC-A number <li> Encodes GTIN-13 numbers</li></ul>|

## See Also

[Adding Barcodes to Reports](devenv-report-add-barcodes.md)  
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
