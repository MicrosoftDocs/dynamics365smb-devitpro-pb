---
title: "How to: Use SystemService to Find Companies"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 317e9a6d-581d-453a-b69b-70eba225df75
caps.latest.revision: 30
---
# How to: Use SystemService to Find Companies
You can use the SystemService service in a SOAP web service application to retrieve a list of companies available in a specific database. A company name is typically part of the URI when you access a [!INCLUDE[navnow](includes/navnow_md.md)] web service, and the system service lets you retrieve names of available companies. If you do not specify a company name in a URI, then the default company is used.  
  
 In this procedure, you use the SystemService service to retrieve and print a list of companies. You must use Visual Studio 2012 or Visual Studio 2010.  
  
### To use the SystemService service to find companies  
  
1.  In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
  
2.  Expand the **Visual C\#** node, select **Windows**, and then select **Console Application**.  
  
    > [!CAUTION]  
    >  Do not double-click or otherwise dismiss the **New Project** dialog box.  
  
3.  Enter **FindingCompanies** as the **Name** for the application, and then choose **OK**.  
  
4.  In Solution Explorer, right-click the **References** node in the project, and then choose **Add Service Reference**.  
  
5.  In the **Add Service Reference** dialog box, choose the **Advanced** button, choose the **Add Web Reference** button, type or paste the URL that you used when checking the WSDL, such as **http://localhost:7047/DynamicsNAV/WS/Services**, and then choose the green arrow to visit the URL.  
  
6.  When the **SystemService** service is displayed, choose **View Service**, wait for the service to be displayed, and then choose **Add Reference**. Rename the Web reference name from **localhost** to **NavSOAPService**.  
  
7.  On the **Program.cs** tab, replace the stub code with the following.  
  
    ```c#  
    using System;  
    using System.Collections.Generic;  
    using System.Linq;  
    using System.Text;  
  
    namespace FindingCompanies  
    {  
        using System;  
        using NavSOAPService;  
  
        public class Program  
        {  
            static void Main(string[] args)  
            {  
                // Creates instance of service and set credentials.  
                var systemService = new SystemService  
                {  
                    UseDefaultCredentials = true  
                };  
  
                // Loads all companies into an array.  
                var companies = systemService.Companies();  
  
                // Runs through and print all companies.  
                // Also prints company name in encoded form.  
                foreach (string company in companies)  
                {  
                    Console.WriteLine(company);  
                    Console.WriteLine((Uri.EscapeDataString(company)));  
                }  
                Console.ReadLine();  
            }  
        }  
    }  
  
    ```  
  
8.  Save \(press Ctrl+F6\) and compile \(press F6\) the **FindingCompanies** application.  
  
9. Press F5 to run the application in debug mode.  
  
     A list of all companies in the current database is presented in a command session.  
  
## See Also  
 [Walkthrough: Creating a Web Service using Extension Codeunits \(SOAP\)](Walkthrough--Creating-a-Web-Service-using-Extension-Codeunits--SOAP-.md)   
 [Walkthrough: Creating and Using a Codeunit Web Service \(SOAP\)](Walkthrough--Creating-and-Using-a-Codeunit-Web-Service--SOAP-.md)   
 [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP-.md)   
 [SOAP Web Services](SOAP-Web-Services.md)