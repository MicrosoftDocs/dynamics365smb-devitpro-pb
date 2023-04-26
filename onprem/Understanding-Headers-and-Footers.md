---
title: Header and Footer Report Layout
description: This article explains the limitations of headers and footers in client report definition RDLC report layouts in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b129d096-1826-4e6a-9350-5efa307df9b0
caps.latest.revision: 16
---
# Report Header and Footer Limitations in Dynamics NAV
Headers and footers in client report definition \(RDLC\) report layouts have the following limitations:  
  
-   From the header, you cannot refer to group-specific information in the body.  
  
-   You can have only one report header, one body, and one report footer in a report.  
  
    > [!NOTE]  
    >  You can have group headers and footers and table headers and footers.  
  
    > [!NOTE]  
    >  Report Viewer 2015 does not render hidden expressions in headers or footers.  
  
 The following topic describes modifications that require creating a new hidden text box so that the data can be used in a header or footer:  
  
-   [How to: Print Report Header Information on Multiple Pages](How-to--Print-Report-Header-Information-on-Multiple-Pages.md)  
  
 For more information about Visual Studio report layouts, see [Defining a Report Layout](https://go.microsoft.com/fwlink/?linkid=126035).
