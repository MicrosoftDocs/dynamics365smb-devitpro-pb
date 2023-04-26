---
title: "How to: Format Decimal Values"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e5b86d34-289a-4301-8ede-4dd326071a83
caps.latest.revision: 10
---
# How to: Format Decimal Values
When you create a client report definition \(RDLC\) layout for a report, a format variable is created for each decimal variable. The format information from the Column properties in Report Dataset Designer is stored in the format variable. Decimal values are formatted in the RDLC layout by using the format variable. If you create controls that use decimal values in an RDLC report layout, then you must manually specify in Visual Studio Report Designer to use the format variable for the formatting.  
  
### To format decimal values  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select a report that you want to modify, and then choose **Design**.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Visual Studio, in the report.rdlc file, right-click the text box that displays a decimal value, and then choose **Text Box Properties**.  
  
5.  In the **Text Box Properties** window, choose the **Number** tab.  
  
6.  In the **Category** list, choose **Custom**, and then choose the **Function** button \(fx\) next to the **Custom format** field.  
  
7.  In the Expression window, select **Fields \(DataSet\_Result\)**, select the format variable from the list, and then choose **OK**. For example, if the **Value** field on the **General** tab is **=Fields\!Customer\_\_Sales\_\_LCY\_\_.Value**, then the expressions for the format on the **Number** tab should be **=Fields\!Customer\_\_Sales\_\_LCY\_\_Format.Value**.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
