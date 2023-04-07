---
title: "How to: Reset Report Page Numbers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2b216c40-4293-4dd9-b076-0bfb6ee701a6
caps.latest.revision: 17
---
# How to: Reset Report Page Numbers
On some reports, you may want to group sets of data together and reset the page number after each group. For example, in the [!INCLUDE[demolong](includes/demolong_md.md)], report 206, Sales Invoice, displays sales invoices that are grouped by sales invoice number. To reset the page number to 1 for each group of data, you must modify code on the client report definition \(RDLC\) report layout.  
  
### To reset page numbers  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select a report that you want to modify, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Microsoft Visual Studio, in the Report.rdlc file, on the **Report** menu, select **Report Properties**.  
  
5.  In the **Report Properties** window, select the **Code** tab.  
  
6.  Add the following code in the **Custom code** text box:  
  
    ```vb  
    REM Reset Page Number:  
  
        Shared offset As Integer  
        Shared newPage As Object  
        Shared currentgroup1 As Object  
        Shared currentgroup2 As Object  
        Shared currentgroup3 As Object  
  
        Public Function GetGroupPageNumber(ByVal NewPage As Boolean, ByVal pagenumber As Integer) As Object  
            If NewPage Then  
                offset = pagenumber - 1  
            End If  
            Return pagenumber - offset  
        End Function  
  
        Public Function IsNewPage(ByVal group1 As Object, ByVal group2 As Object, ByVal group3 As Object) As Boolean  
            newPage = False  
            If Not (group1 = currentgroup1) Then  
                newPage = True  
                currentgroup1 = group1  
                currentgroup2 = group2  
                currentgroup3 = group3  
            Else  
                If Not (group2 = currentgroup2) Then  
                    newPage = True  
                    currentgroup2 = group2  
                    currentgroup3 = group3  
                Else  
                    If Not (group3 = currentgroup3) Then  
                        newPage = True  
                        currentgroup3 = group3  
                    End If  
                End If  
            End If  
            Return newPage  
        End Function  
    ```  
  
    > [!NOTE]  
    >  This code is also available in report 206, Sales Invoice.  
  
7.  Choose the **OK** button.  
  
8.  In Visual Studio, in the Report.rdlc file, create a hidden text box in the data region that contains the data on which you have a group. For example, create a hidden text box on the table or list that contains the sales invoice number. For more information, see [How to: Add and Identify Hidden Fields](How-to--Add-and-Identify-Hidden-Fields.md).  
  
9. Right-click the text box, and then choose **Text Box Properties**. In the **Properties** window, on the **General** tab, set the name of the text box to **NewPage**.  
  
10. In the **Properties** window, on the **General** tab, enter the following code in the **Value** field.  
  
    ```  
    =Code.IsNewPage(Fields!<grouping field1>[,<grouping field2>,<grouping field3>])  
    ```  
  
     For example, if you are grouping by document type, then *grouping field1* is Fields\!Document\_Type.Value.  
  
    > [!NOTE]  
    >  If you want to use more than three groupings, you can modify the code in the **IsNewPage** function. If you want to use fewer than three groupings, you can either modify the code in the **IsNewPage** function or use a static value for one or more of the parameters when you call the **IsNewPage** function.  
  
11. In the **Text Box Properties** window, choose the **OK** button.  
  
12. In Visual Studio, in the Report.rdlc file, right-click the text box in the header that displays the page number, and then select **Expression**.  
  
13. In the **Expression** window, enter the following expression.  
  
    ```  
    =Code.GetGroupPageNumber(ReportItems!NewPage.Value,Globals!PageNumber)  
    ```  
  
     The *ReportItems\!NewPage.Value* parameter is the value of the **NewPage** text box, which you created in step 8.  
  
14. In the **Expression** window, choose the **OK** button.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
