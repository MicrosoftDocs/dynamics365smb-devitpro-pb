---
title: "Walkthrough: Creating and Interacting with a Page Web Service (OData)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Walkthrough: Creating and Interacting with a Page Web Service (OData)
This walkthrough illustrates how you can publish a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as an OData web service, use it in a Visual Studio console application, and change data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] through the web service.  
  
## About This Walkthrough  
 This walkthrough provides an overview of how to expose a page as a web service and how to use the web service in a C\# console application. The walkthrough illustrates the following tasks:  
  
-   Publishing a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as a web service.  
  
-   Verifying web service availability from a browser.  
  
-   Adding the published web service as a service reference in a console application that you create in Visual Studio.  
  
-   Changing the data in the console application.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with a developer license.  
  
-   [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
-   Visual Studio. You can use any edition of Visual Studio that supports adding web references. You also have the option to use service references instead of web references, or use the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  
  
## Publishing a Page as a Web Service  
 You publish a web service by using the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
#### To register and publish a page as a web service  
  
1.  Open the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] and connect to the [!INCLUDE[demoname](../developer/includes/demoname_md.md)] company.  
  
2.  In the **Search** box, enter **Web services**, and then choose the related link.  
  
3.  In the **Web Services** page, on the **Home** tab, choose **New**.  
  
4.  In the **Object Type** column, select **Page**. In the **Object ID** column, enter **21**, and in the **Service Name** column, enter **Customer**.  
  
5.  Select the check box in the **Published** column.  
  
6.  Choose the **OK** button.  
  
## Verifying Web Service Availability  
  
> [!NOTE] 
>  After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for OData web services is 7048. You can configure this value by using the [Server Administration Tool](../administration/administration-tool.md).  
  
#### To verify availability of a [!INCLUDE[dyn_nav](../developer/includes/dyn_nav_md.md)] web service  
  
1.  Start Internet Explorer.  
  
2.  In the **Address** field, enter a URI in this format: **https://\<Server>:\<WebServicePort>/\<ServerInstance>/OData**. For example:  
  
     **https://localhost:7048/BC130/OData**  
  
    1.  **Server** is the name of the computer that is running [!INCLUDE[server](../developer/includes/server.md)].  
  
    2.  **WebServicePort** is the port that OData is running on. The default port is 7048.  
  
     **ServiceInstance** is the name of the [!INCLUDE[server](../developer/includes/server.md)] instance for your solution. The default name is [!INCLUDE[serverinstance](../developer/includes/serverinstance.md)].  
  
     For example, if the [!INCLUDE[server](../developer/includes/server.md)] is running on the computer that you are working on, then you can use: **https://localhost:7048/BC130/OData/**  
  
     The browser should now show the web service that you have published, in the format of an AtomPub document.  
  
     ![Basic AtomPub document for a page.](../media/BasAtomPub.JPG "BasAtomPub")  
  
##  <a name="BKMK_CreateConsoleApp"></a> Creating the Console Application  
 Next, you create a C\# console application in Visual Studio.  
  
#### To create the C\# project  
  
1.  In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
  
2.  Expand the **Installed** node, expand the **Templates** node, expand the **Visual C\#** node, chose **Windows**, and then choose **Console Application**. Enter the name **NAVCustomers** for the application.  
  
3.  Choose the **OK** button to exit the **New Project** page.  
  
4.  In the Solution Explorer pane, right-click **References**, and then choose **Add Service Reference**.  
  
5.  In the **Address** field, enter the URI for your OData web service, such as **https://localhost:7048/BC130/OData/**.  
  
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
  
     The `PrintCustomersCalledCust` method reads the OData web service that you created, Customer, and creates a list of customers where the customer name begins with the letters **Cust**. Next, you add code to the Main method that uses the web service to write to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] .  
  
3.  In the `Main` method, add the following code to establish the connection to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] through the web service:  
  
    ```  
    NAV nav = new NAV(new Uri("https://localhost:7048/BC130/OData/Company('CRONUS-International-Ltd.')"));  
    nav.Credentials = CredentialCache.DefaultNetworkCredentials;  
    ```  
  
     In the example, the name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that you modify data for is [!INCLUDE[demoname](../developer/includes/demoname_md.md)]. You must replace this with the name of the company that you have access to. To find the correct URI, you can paste the following URI into your browser and then see the exact URI that you must use: `https://localhost:7048/BC130/OData/Company`.  
  
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
  
#### To verify the inserted and modified data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  
  
1.  Open the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
2.  Open the list of customers, filter for a customer with the name **Customer NameChanged**.  
  
     This is the customer that the console application created and modified.  
  
## Next Steps  
 You have built a console application that uses an OData web service to modify [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data. You can use similar OData web services in other applications when you want to allow users to modify data outside [!INCLUDE[prodshort](../developer/includes/prodshort.md)] .  
  
## See Also  
 [Web Services Overview](web-services.md)   
 [Using OData Web Services to Modify Data](use-odata-to-modify-data.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)   
 [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP.md)   
 [Web Services Overview](web-services.md)