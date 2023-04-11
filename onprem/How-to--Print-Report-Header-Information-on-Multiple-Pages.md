---
title: "How to: Print Report Header Information on Multiple Pages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 119fad1b-5f0a-42a4-8071-02f5f55b50b3
caps.latest.revision: 18
---
# How to: Print Report Header Information on Multiple Pages
If the table data region in a report layout spans more than one page, then you must use the **SetData** and **GetData** functions on reports that have dynamic headers so that the header information is displayed on subsequent pages, not only on the first page.  
  
 For reports, such as document reports, that have table data regions that span more than one page and require dynamic header information on each page, you must do the following:  
  
-   Create one or more hidden text boxes in the body of the report to get the data.  
  
-   Add code for the **SetData** function, which saves the data, and which you call from the **Hidden** property of a visible text box in the header section.  
  
-   Add code for the **GetData** function, which retrieves the data, and which you call from the text box in the header section where you want to display the data.  
  
 An example of a report that has multiple table data regions and uses functions to save and get header data is report 206, **Sales - Invoice**, in the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
### To print report header information on multiple pages  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select a report that you want to modify, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Microsoft Visual Studio, on the **Report** menu, choose **Report Properties**.  
  
5.  In the **Report Properties** window, on the **Code** tab, add the following code to the **Custom code** text box.  
  
    > [!NOTE]  
    >  This example groups the data into four groups. You can modify the code if you need a different number of groups.  
  
    > [!NOTE]  
    >  To view this code in a report in the [!INCLUDE[demolong](includes/demolong_md.md)], see report 206, **Sales - Invoice**.  
  
    ```vb  
    Shared Data1 as Object  
    Shared Data2 as Object  
    Shared Data3 as Object  
    Shared Data4 as Object  
  
    Public Function GetData(Num as Integer, Group as integer) as Object  
    if Group = 1 then  
       Return Cstr(Choose(Num, Split(Cstr(Data1),Chr(177))))  
    End If  
  
    if Group = 2 then  
       Return Cstr(Choose(Num, Split(Cstr(Data2),Chr(177))))  
    End If  
  
    if Group = 3 then  
       Return Cstr(Choose(Num, Split(Cstr(Data3),Chr(177))))  
    End If  
  
    if Group = 4 then  
       Return Cstr(Choose(Num, Split(Cstr(Data4),Chr(177))))  
    End If  
    End Function  
  
    Public Function SetData(NewData as Object,Group as integer)  
      If Group = 1 and NewData > "" Then  
          Data1 = NewData  
      End If  
  
      If Group = 2 and NewData > "" Then  
          Data2 = NewData  
      End If  
  
      If Group = 3 and NewData > "" Then  
          Data3 = NewData  
      End If  
  
      If Group = 4 and NewData > "" Then  
          Data4 = NewData  
      End If  
  
      Return True  
    End Function  
  
    ```  
  
6.  In the body of the report.rdlc file, create one or more hidden text boxes to get the header data. For example, in report 206, a hidden text box starts with the following:  
  
     `=Cstr(Fields!CustAddr1.Value) + Chr(177) + Cstr(Fields!CustAddr2.Value) + Chr(177) + Cstr(Fields!CustAddr3.Value) + Chr(177) + Cstr(Fields!CustAddr4.Value) + Chr(177) + Cstr(Fields!CustAddr5.Value) + Chr(177) + Cstr(Fields!CustAddr6.Value) + Chr(177) + Cstr(Fields!CustAddr7.Value) + Chr(177) + Cstr(Fields!CustAddr8.Value) + Chr(177) + Cstr(Fields!BilltoCustNo_SalesInvHdr.Value) + Chr(177) + Cstr(Fields!VATRegNo_SalesInvHdr.Value) + Chr(177) + …`  
  
    > [!NOTE]  
    >  Chr\(177\) is used in this example to separate the data. When you call the **GetData** function, it splits the data by using Chr\(177\) as a separator.  
  
     For more information about how to create hidden fields, see [How to: Add and Identify Hidden Fields](How-to--Add-and-Identify-Hidden-Fields.md).  
  
7.  In the header of the report.rdlc file, create one or more text boxes to save the data from the hidden text box in the body section. For example, in report 206, a blank text box is in the header section. It has the following expression as the value of its **Hidden** property:  
  
     `=Code.SetData(ReportItems!CustAddr.Value,1)`  
  
     The first parameter in the **SetData** function call corresponds to the name of the text box in the body section. The second parameter corresponds to the group number.  
  
8.  In the header section of the report.rdlc file, create the text boxes for displaying data. The source expression for each text box must call the **GetData** function with the following two parameters:  
  
    -   The number of the variable in the group.  
  
    -   The number of the group.  
  
     For example, `Code.GetData(2,1)` gets the second piece of data from group 1, which is CustAddr2.Value in group 1.  
  
9. Save and compile the report.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
