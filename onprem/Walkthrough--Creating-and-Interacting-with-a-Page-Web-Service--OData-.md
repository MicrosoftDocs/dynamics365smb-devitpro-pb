---
title: "Walkthrough: Creating and Interacting with a Page Web Service (OData)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 72563698-e7ea-44d1-b351-6f2984b70409
caps.latest.revision: 19
manager: edupont
---
# Walkthrough: Creating and Interacting with a Page Web Service (OData)
This walkthrough illustrates how you can publish a [!INCLUDE[navnow](includes/navnow_md.md)] page as an OData web service, use it in a Visual Studio console application, and change data in [!INCLUDE[navnow](includes/navnow_md.md)] through the web service.  
  
## About This Walkthrough  
 This walkthrough provides an overview of how to expose a page as a web service and how to use the web service in a C\# console application. The walkthrough illustrates the following tasks:  
  
-   Publishing a [!INCLUDE[navnow](includes/navnow_md.md)] page as a web service.  
  
-   Verifying web service availability from a browser.  
  
-   Adding the published web service as a service reference in a console application that you create in Visual Studio.  
  
-   Changing the data in the console application.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   [!INCLUDE[demolong](includes/demolong_md.md)].  
  
-   Visual Studio 2012 or Visual Studio 2010. You can use any edition of Visual Studio that supports adding web references. In this walkthrough, you will use Visual Studio 2012. You also have the option to use service references instead of web references, or use the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  
  
## Publishing a Page as a Web Service  
 You publish a web service by using the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
#### To register and publish a page as a web service  
  
1.  Open the [!INCLUDE[rtc](includes/rtc_md.md)] and connect to the [!INCLUDE[demoname](includes/demoname_md.md)] company.  
  
2.  In the **Search** box, enter **Web services**, and then choose the related link.  
  
3.  In the **Web Services** page, on the **Home** tab, choose **New**.  
  
4.  In the **Object Type** column, select **Page**. In the **Object ID** column, enter **21**, and in the **Service Name** column, enter **Customer**.  
  
5.  Select the check box in the **Published** column.  
  
6.  Choose the **OK** button.  
  
## Verifying Web Service Availability  
  
> [!NOTE]  
>  After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for OData web services is 7048. You can configure this value by using the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
#### To verify availability of a [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)] web service  
  
1.  Start Internet Explorer.  
  
2.  In the **Address** field, enter a URI in this format: **http://\<Server>:\<WebServicePort>/\<ServerInstance>/OData**. For example:  
  
     **http://localhost:7048/DynamicsNAV/OData**  
  
    1.  **Server** is the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
    2.  **WebServicePort** is the port that OData is running on. The default port is 7048.  
  
     **ServiceInstance** is the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for your solution. The default name is [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].  
  
     For example, if the [!INCLUDE[nav_server](includes/nav_server_md.md)] is running on the computer that you are working on, then you can use: **http://localhost:7048/DynamicsNAV/OData/**  
  
     The browser should now show the web service that you have published, in the format of an AtomPub document.  
  
     ![Basic AtomPub document for a page](media/BasAtomPub.JPG "BasAtomPub")  
  
##  <a name="BKMK_CreateConsoleApp"></a> Creating the Console Application  
 Next, you create a C\# console application in Visual Studio 2012.  
  
#### To create the C\# project  
  
1.  In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
  
2.  Expand the **Installed** node, expand the **Templates** node, expand the **Visual C\#** node, chose **Windows**, and then choose **Console Application**. Enter the name **NAVCustomers** for the application.  
  
3.  Choose the **OK** button to exit the **New Project** page.  
  
4.  In the Solution Explorer pane, right-click **References**, and then choose **Add Service Reference**.  
  
5.  In the **Address** field, enter the URI for your OData web service, such as **http://localhost:7048/DynamicsNAV/OData/**.  
  
    > [!IMPORTANT]  
    >  In this example, we use the HTTP protocol to illustrate the use of OData web services. We recommend that you use the more secure HTTPS protocol when you consume web services.  
  
6.  Choose **Go**, and then, in the **Services** field, choose **NAV**, and then choose the **OK** button.  
  
 The project is created, and your OData web service is added as a service reference. Next, you add the code that will show a list of existing customers, add a customer and then rename the new customer.  
  
#### To add code to your console application  
  
1.  Add the following `using` statement after the namespaces that are automatically added to your project:  
  
    ```  
    using NAVCustomers.ServiceReference1;  
    ```  
  
2.  After the `Main` method, add the following method:  
  
    ```  
    private static void PrintCustomersCalledCust(NAV nav)  
      {  
        var customers = from c in nav.Customer  
                        where c.Name.StartsWith("Cust")  
                        select c;  
  
        Boolean customerFound = false;  
        foreach (Customer customer in customers)  
        {  
          customerFound = true;  
          Console.WriteLine("No.: {0} Name: {1}", customer.No, customer.Name);  
        }  
  
        if (!customerFound)  
        {  
          Console.WriteLine("There are no customers that start with 'Cust'.");  
        }  
      }  
  
    ```  
  
     The `PrintCustomersCalledCust` method reads the OData web service that you created, Customer, and creates a list of customers where the customer name begins with the letters **Cust**. Next, you add code to the Main method that uses the web service to write to [!INCLUDE[navnow](includes/navnow_md.md)].  
  
3.  In the `Main` method, add the following code to establish the connection to [!INCLUDE[navnow](includes/navnow_md.md)] through the web service:  
  
    ```  
    NAV nav = new NAV(new Uri("http://localhost:7048/DynamicsNAV/OData/Company('CRONUS-International-Ltd.')"));  
    nav.Credentials = CredentialCache.DefaultNetworkCredentials;  
    ```  
  
     In the example, the name of the [!INCLUDE[navnow](includes/navnow_md.md)] company that you modify data for is [!INCLUDE[demoname](includes/demoname_md.md)]. You must replace this with the name of the company that you have access to. To find the correct URI, you can paste the following URI into your browser and then see the exact URI that you must use: `http://localhost:7048/DynamicsNAV/OData/Company`.  
  
4.  Add the following code to the method:  
  
    ```  
    Console.WriteLine("Printing list of current customers:");  
    PrintCustomersCalledCust(nav);  
  
    Console.WriteLine("Adding new customer.");  
    Customer newCustomer = new Customer();  
    newCustomer.Name = "Customer Name";  
    nav.AddToCustomer(newCustomer);  
    nav.SaveChanges();  
  
    Console.WriteLine("Printing list of current customers:");  
    PrintCustomersCalledCust(nav);  
  
    newCustomer.Name += "Changed";  
    nav.UpdateObject(newCustomer);  
    nav.SaveChanges();  
  
    Console.WriteLine("Printing list of current customers:");  
    PrintCustomersCalledCust(nav);  
  
    ```  
  
     In this code, a customer is created and then renamed. The code prints a list of the customers that currently exist in the **Customer** table when each change has been made.  
  
5.  Build and run the project.  
  
#### To verify the inserted and modified data in [!INCLUDE[navnow](includes/navnow_md.md)]  
  
1.  Open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
2.  Open the list of customers, filter for a customer with the name **Customer NameChanged**.  
  
     This is the customer that the console application created and modified.  
  
## Next Steps  
 You have built a console application that uses an OData web service to modify [!INCLUDE[navnow](includes/navnow_md.md)] data. You can use similar OData web services in other applications when you want to allow users to modify data outside [!INCLUDE[navnow](includes/navnow_md.md)].  
  
## See Also  
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)   
 [Using OData Web Services to Modify Data](Using-OData-Web-Services-to-Modify-Data.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)   
 [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP-.md)   
 [Web Service Alternatives: SOAP and OData](Web-Service-Alternatives:-SOAP-and-OData.md)