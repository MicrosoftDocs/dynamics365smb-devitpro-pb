---
title: "Walkthrough: Uploading a File from a Client to Microsoft Dynamics NAV Server"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 83e91e6d-6fe7-44f8-b695-2a13b058d21c
caps.latest.revision: 19
---
# Walkthrough: Uploading a File from a Client to Microsoft Dynamics NAV Server
This walkthrough demonstrates how to use file functions to send a file from a client to the server, use stream functions to read the file, and use an XMLport to load values into the database. Business logic in [!INCLUDE[navnow](includes/navnow_md.md)] runs on [!INCLUDE[nav_server](includes/nav_server_md.md)] instead of on the client. As a result, any business logic that reads data from a file needs to first move a copy of that file from the client to the server.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating an XML file that contains two elements with values.  
  
-   Creating a table in [!INCLUDE[navnow](includes/navnow_md.md)] to hold the data from the XML file.  
  
-   Creating a codeunit that does the following:  
  
    -   Sends the file from a user-specified location to a location on the server  
  
    -   Reads the data  
  
    -   Writes the data to the table  
  
    -   Deletes the file from the server  
  
-   Associating the codeunit with an action on a Role Center page.  
  
-   Testing the codeunit.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnow](includes/navnow_md.md)] installed with a developer license  
  
## Creating an XML File  
 The first step is to create a simple XML file that contains the data that the codeunit will read into the table. This represents the file on a client computer.  
  
#### To create the XML file  
  
1.  Open Notepad.  
  
2.  Enter the following code.  
  
    ```  
    <?xml version="1.0" encoding="UTF-8"?><head><valueI>10</valueI><valueII>11</valueII></head>  
    ```  
  
3.  Save the file in the root of the My Documents directory. Name the file **simple.xml**.  
  
4.  Open the file in Internet Explorer to ensure that the XML is well formed.  
  
## Creating a Table  
 The next step is to create the table that will hold the data that is read from the XML file.  
  
#### To create the table  
  
1.  In **Object Designer**, choose **Table**, and then choose **New**.  
  
     Table Designer opens.  
  
2.  Choose **Field Name** in the first row and then enter **IntA**. Set **Data Type** to **Integer**.  
  
3.  Choose **Field Name** in the second row and then enter **IntB**. Set **Data Type** to **Integer**.  
  
4.  Save the table, giving it a name of **TestTable** and an ID of **50010**.  
  
5.  Close Table Designer.  
  
## Creating the Codeunit  
 The next step is to create a codeunit that will prompt the user to specify the location of the XML file, load the XML file into a stream, and then write the values of those variables to the table using an XMLport.  
  
#### To create the codeunit  
  
1.  In **Object Designer**, choose **Codeunit**, and then choose **New**.  
  
     C/AL Editor opens.  
  
2.  Choose the **OnRun\(\)** function in the C/AL Editor.  
  
3.  Choose **View** and then choose **C/AL Locals**.  
  
     The **C/AL Locals** window opens.  
  
4.  Choose the **Variables** tab.  
  
5.  Enter the following local variables.  
  
    |Name|DataType|Length|  
    |----------|--------------|------------|  
    |TestFile|File||  
    |TestStream|InStream||  
    |NVOutStream|OutStream||  
    |ClientFileName|Text|1024|  
  
6.  Choose the next empty line to ensure that the local variables are saved.  
  
7.  Close the **C/AL Locals** window.  
  
8.  Enter the following code in the C/AL Editor for the **OnRun** function.  
  
    ```  
    BEGIN  
            IF UPLOADINTOSTREAM(  
                           'Select the simple.xml file',  
                            'c:\temp',  
                            'XML File *.xml| *.xml',  
                             ClientFileName,  
                             TestStream)  
            THEN MESSAGE('File Successfully Uploaded')  
            ELSE  
                EXIT;  
        XMLPORT.IMPORT(50010,TestStream);  
    END;  
    ```  
  
9. Save the codeunit, giving it a name of **UploadFile** and an ID of **50010**.  
  
10. Close the code editor.  
  
## Creating the XMLport  
 The next step is to create an XMLport.  
  
#### To create the XMLport  
  
1.  In **Object Designer**, choose **XMLport**, and then choose **New**.  
  
     **XMLport Designer** opens.  
  
2.  Enter the following information.  
  
    |Node Name|Node Type|Source Type|Data Source|  
    |---------------|---------------|-----------------|-----------------|  
    |head|Element|Table|\<TestTable>\(TestTable\)|  
    |valueI|Element|Field|TestTable::IntA|  
    |valueII|Element|Field|TestTable::IntB|  
  
3.  Indent the  valueI and valueII elements one level by choosing the right arrow.  
  
4.  Save the XMLport, giving it a name of **UploadFile** and an ID of **50010**.  
  
5.  Close XMLport Designer.  
  
## Testing the Codeunit  
 The final step is to test the codeunit to ensure that it correctly adds the values from the **simple.xml** file to the TestTable. To test the codeunit, you will run it from Object Designer.  
  
#### To test the codeunit  
  
1.  In Object Designer, choose **Codeunit**, select **codeunit 50010 UploadFile**, and then choose the **Run** button.  
  
     The **Select the simple.xml file** window opens.  
  
2.  Browse to the location of **simple.xml** and then choose **Open**.  
  
     The message **File Successfully Uploaded** appears.  
  
3.  Choose **OK**.  
  
4.  Open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
5.  In Object Designer, choose **Table**, choose **50010 Test Table**, and then choose **Run**.  
  
     The **TestTable-Table** window opens with the values of 10 and 11 in the IntA and IntB columns, respectively.  
  
## See Also  
 [UPLOADINTOSTREAM Function \(File\)](UPLOADINTOSTREAM-Function--File-.md)   
 [Walkthrough: Transferring a File from Microsoft Dynamics NAV Server to the Client](Walkthrough--Transferring-a-File-from-Microsoft-Dynamics-NAV-Server-to-the-Client.md)
