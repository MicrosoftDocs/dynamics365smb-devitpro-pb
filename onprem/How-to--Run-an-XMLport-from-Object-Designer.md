---
title: "How to: Run an XMLport from Object Designer"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d1ae3fd3-daa9-43c2-bc26-1aa6c33e6386
caps.latest.revision: 11
---
# How to: Run an XMLport from Object Designer
After designing an XMLport, you can either create a codeunit to run the XMLport or run it from Object Designer. XMLports can be designed to export or import data. XMLports can also be designed for both export and import. This topic shows you how to run XMLports from Object Designer. For information about how to design an XMLport, see [How to: Create XMLports](How-to--Create-XMLports.md). For information about how to run an XMLport from codeunit, see [How to: Create Codeunits to Run XMLports](How-to--Create-Codeunits-to-Run-XMLports.md).  
  
### To run an XMLport from Object Designer  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **XMLport**, choose the XMLport you want to run, and then choose the **Run** button. The **Edit-\<XMLport Name>** request page opens in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
3.  If the XMLport you want to run is designed to both import and export data, then do the following:  
  
    1.  On the **Edit-\<XMLport Name>** request page, in the **Direction** drop-down list, select the direction you want and then choose the **OK** button. The direction drop-down list box is located at the bottom of the page. You can specify how you want to sort the data and the filtering criteria on the **Edit-\<XMLport Name>** request page.  
  
         For information about the XMLport request page, see [Request Pages \(XMLPorts\)](Request-Pages--XMLPorts-.md).  
  
    2.  If you select **Export**, then do the following:  
  
        1.  In the **Export File** dialog box, choose the **Save** button to open the **Export** window.  
  
        2.  In the **Export** window, browse to the location on your computer where you want to save the file that you are exporting.  
  
        3.  In the **File name** text box, enter a name for the file. By default, the name of the XMLport is used as the name of the file.  
  
        4.  In the **Save as type** drop-down list box, choose the file format you want, and then choose the **Save** button to export the data from the database. Instead of saving the file, you can choose the **Open** button from the **Export File** dialog box to view the file.  
  
            > [!NOTE]  
            >  If you save the file and you do not specify a name, the file will be saved in the format that is specified in the [Format Property \(XMLports\)](Format-Property--XMLports-.md).  
  
    3.  If you select **Import**, then do the following:  
  
        1.  In the **Import** window, browse to the location on your computer where the file that you want to import is located.  
  
        2.  Choose the file and then choose the **Open** button to import the file to the database.  
  
    > [!NOTE]  
    >  For XMLports that are designed to both import and export data, the **Edit-\<XMLport Name>** page that is displayed differs from the **Edit-\<XMLport Name>** page that is displayed for either import or export.  
  
4.  If the XMLport only exports data, do the following:  
  
    1.  On the **Edit-\<XMLport Name>** page, choose the **OK** button. The **Export File** dialog box is displayed.  
  
    2.  In the **Export File** dialog box, choose the **Save** button to open the **Export** window.  
  
    3.  In the **Export** window, browse to the location on your computer where you want to save the file that you are exporting.  
  
    4.  In the **File name** text box, enter a name for the file. By default, the name of the XMLport is used as the name of the file.  
  
    5.  In the **Save as type** drop-down list box, choose the file format you want, and then choose the **Save** button to export the data from the database. Instead of saving the file, you can choose the **Open** button from the **Export File** dialog box to view the file.  
  
        > [!NOTE]  
        >  If you save the file and you do not specify a name, the file will be saved in the format that is specified in the [Format Property \(XMLports\)](Format-Property--XMLports-.md).  
  
5.  If the XMLport only imports data, do the following:  
  
    1.  On the **Edit–XMLport Name** page, choose the **OK** button. The **Import** window is displayed.  
  
    2.  In the **Import** window, browse to the location on your computer where the file that you want to import is located.  
  
    3.  Choose the file and then choose the **Open** button to import the file to the database.  
  
## See Also  
 [Designing XMLports](Designing-XMLports.md)   
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)
