---
title: "Walkthrough: Transferring a File from Microsoft Dynamics NAV Server to the Client"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 93eb2594-bbb5-4f0a-b529-aa011029ad50
caps.latest.revision: 17
---
# Walkthrough: Transferring a File from Microsoft Dynamics NAV Server to the Client
This walkthrough demonstrates how to develop a codeunit that creates a file on [!INCLUDE[nav_server](includes/nav_server_md.md)], opens the file, writes some data to it, and then downloads that file to a RoleTailored client.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating a codeunit that creates a text file, opens the file, writes some text to the file, and then downloads that file to the client.  
  
-   Testing the codeunit.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license  
  
## Creating the Codeunit  
 The first step is to create the codeunit. In the codeunit, the `toFile` variable is initially assigned a value of **samplefile.txt**. If the user specifies another file name, then this new value and the file path are returned in `toFile`.  
  
#### To create the codeunit  
  
1.  In **Object Designer**, choose **Codeunit** and then choose **New**.  
  
     C/AL Editor opens.  
  
2.  Choose the OnRun\(\) function in C/AL Editor.  
  
3.  Choose **View** and then choose **C/AL Locals**.  
  
     The **OnRun -C/AL Locals** window opens.  
  
4.  Choose the **Variables** tab.  
  
5.  Enter the following local variables.  
  
    |Name|DataType|Length|  
    |----------|--------------|------------|  
    |Name|Text|200|  
    |ReturnValue|Boolean||  
    |TempFile|File||  
    |ToFile|Variant||  
    |NewSteam|InStream||  
  
6.  Choose the next empty line to ensure that the local variables are saved.  
  
7.  Close the **C/AL Locals** window.  
  
8.  Enter the following code in the C/AL Editor for the OnRun\(\) method.  
  
    ```  
    // Create a temporary file on NAV server, write the content   
    // to the tempoary file, and then create an instream for the  
    // temporary file.  
  
    TempFile.CREATETEMPFILE();  
    TempFile.WRITE('abc');  
    TempFile.CREATEINSTREAM(NewStream);  
    ToFile:='SampleFile.txt';  
  
    // Transfer the content from the temporary file on the NAV server to a  
    // file on the RoleTailored client.  
  
    ReturnValue:=DOWNLOADFROMSTREAM(  
      NewStream,  
      'Save File to RoleTailored Client',  
      '',  
      'Text File *.txt| *.txt',  
      ToFile);  
  
    // Close the temporary file and delete it from NAV server.  
    TempFile.CLOSE();  
  
    // Post a message indicating that the file is saved on the client.  
    MESSAGE(FORMAT(ToFile));  
    ```  
  
9. Save the codeunit, giving it a name of **FileTransfer** and an ID of **50011**.  
  
10. Close the code editor.  
  
## Testing the Codeunit  
 The final step is to test the codeunit.  
  
#### To test the codeunit  
  
1.  In Object Designer, select the codeunit that you created, and then choose the **Run** button.  
  
     The **Export File** dialog box appears.  
  
2.  Choose **Save** and save to the default location, noting what that location is.  
  
3.  Choose **OK**.  
  
4.  A message box opens specifying the location of the saved file. Choose **OK**.  
  
5.  Browse to the specified file location on your client computer.  
  
6.  Open the file.  
  
7.  Note that the file contains the text 'abc'.  
  
## See Also  
 [Walkthrough: Uploading a File from a Client to Microsoft Dynamics NAV Server](Walkthrough--Uploading-a-File-from-a-Client-to-Microsoft-Dynamics-NAV-Server.md)
