---
title: "How to: Verify the Paper Size"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c2608bdc-0684-400a-8dc7-bdf2a19428a3
caps.latest.revision: 10
---
# How to: Verify the Paper Size
Before you print or preview a report, the client checks the page width and page height to verify that the paper size is supported by the printer. After you create an RDLC report layout, to ensure that you can print and preview the report, you must verify that the page width and page height properties are valid.  
  
### To verify the page height and page width properties  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select a report that you want to modify, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Microsoft Visual Studio, in the Report.rdlc file, on the **Report** menu, choose **Report Properties**.  
  
5.  In the **Report Properties** window, on the **Page Setup** tab, verify that the values in the **Width** and **Height** fields are valid.  
  
     The following table shows valid paper size dimensions.  
  
    |Paper size|Width|Height|  
    |----------------|-----------|------------|  
    |A4|21 cm|29.7 cm|  
    |Letter|8.5 inches|11 inches|  
  
## See Also  
 [Printing Reports](Printing-Reports.md)   
 [Designing Reports](Designing-Reports.md)
