---
title: "Use SystemService to Find Companies"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Using SystemService to Find Companies
You can use the SystemService service in a SOAP web service application to retrieve a list of companies available in a specific database. A company name is typically part of the URI when you access a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web service, and the system service lets you retrieve names of available companies. If you do not specify a company name in a URI, then the default company is used.  
  
 In this procedure, you use the SystemService service to retrieve and print a list of companies in Visual Studio.  
  
### Use the SystemService service to find companies  
  
1.  In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
  
2.  Expand the **Visual C\#** node, select **Windows**, and then select **Console Application**.  
  
    > [!CAUTION]  
    >  Do not double-click or otherwise dismiss the **New Project** dialog box.  
  
3.  Enter **FindingCompanies** as the **Name** for the application, and then choose **OK**.  
  
4.  In Solution Explorer, right-click the **References** node in the project, and then choose **Add Service Reference**.  
  
5.  In the **Add Service Reference** dialog box, choose the **Advanced** button, choose the **Add Web Reference** button, type or paste the URL that you used when checking the WSDL, such as `https://localhost:7047/BC130/WS/Services`, and then choose the green arrow to visit the URL.  
  
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
        using BCSOAPService;  
  
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
   
 [SOAP Web Services](SOAP-Web-Services.md)