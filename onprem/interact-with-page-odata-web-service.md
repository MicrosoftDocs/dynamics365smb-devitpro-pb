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
author: jswymer
---
# Interacting with a Page Web Service (OData)

This article illustrates how you can publish a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as an OData web service, use it in a Visual Studio console application, and change data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] through the web service.  
  
## About this article

This article provides an overview of how to expose a page as a web service and how to use the web service in a C\# console application. It illustrates the following tasks:  
  
- Publishing a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as a web service.  
  
- Verifying web service availability from a browser.  
  
- Adding the published web service as a service reference in a console application that you create in Visual Studio.  
  
- Changing the data in the console application.  
  
### Prerequisites
  
 To complete the tasks in the article, you will need:  
  
- [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installed with a developer license.  
  
- [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  

- ODate Services and V4 Endpoint enabled on the [!INCLUDE[server](../developer/includes/server.md.md)]. 
  
- Visual Studio.

    You can use any edition of Visual Studio that supports adding web references. In this article, you will use Visual Studio 2017. <!-- You also have the option to use service references instead of web references, or use the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.-->  

- OData Connected Service installed in Visual Studio.

    This tool generates code to facilitate the consumption of OData services. To install OData Connected Service you can either download it from [OData Connected Service](https://marketplace.visualstudio.com/items?itemName=laylaliu.ODataConnectedService) and follow the instructions, or do the following in Visual Studio:

    1. On the **Tools** menu, select **Extensions and Updates** > **Online**
    2. Search for **OData Connected Service**, select it in the results, and choose **Download**.
    3. Close Visual Studio to start the installation.

## Publishing a page as a web service
  
You publish a web service by using the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
1.  Open the client and connect to the [!INCLUDE[demoname](../developer/includes/demoname_md.md)] company.  
  
2.  In the **Search** box, enter **Web Services**, and then choose the related link.  
  
3.  In the **Web Services** page, choose **New**.  
  
4.  In the **Object Type** column, select **Page**. In the **Object ID** column, enter **21**, and in the **Service Name** column, enter **Customer**.  
  
5.  Select the check box in the **Published** column.  
  
6.  Choose the **OK** button.  
  
## Verifying Web Service Availability  
  
After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for OData web services is 7048. You can configure this value by using the [Business Central Administration Tool](../administration/administration-tool.md). 
  
1. Start Internet Explorer.  
  
2. In the **Address** field, enter a URI in this format: 

    ```    
    https://<Server>:<WebServicePort>/ServerInstance/ODataV4
    ```  

    For example:

    ```  
    https://localhost:7048/BC/ODataV4
    ```  
  
   - `Server`is the name of the computer that is running [!INCLUDE[server](../developer/includes/server.md.md)].  
  
   - `WebServicePort` is the port that OData is running on. The default port is 7048.  
  
   - `ServiceInstance` is the name of the [!INCLUDE[server](../developer/includes/server.md.md)] instance for your solution. The default name is [!INCLUDE[server_instance](../developer/includes/serverinstance.md)].  
  
      For example, if the [!INCLUDE[server](../developer/includes/server.md.md)] is running on the computer that you are working on, then you can use: **https://localhost:7048/DynamicsNAV/ODataV4/**  
  
      The browser should now show the web service that you have published, in the following format <!-- of an AtomPub document.-->: 

    {"@odata.context":"https://localhost:7048/BC150/ODataV4/$metadata","value":[{"name":"CustomerPriceAndLineDisc","kind":"EntitySet","url":"CustomerPriceAndLineDisc"}, 
  <!--
      ![Basic AtomPub document for a page.](media/BasAtomPub.JPG "BasAtomPub")  -->
  
##  <a name="BKMK_CreateConsoleApp"></a> Creating the console application for the web service
 
Next, you create a C\# console application in Visual Studio.  
  
### Create the C\# project  
  
1. In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
2. In the pane on the left, select **Installed** > **Visual C\#** > **Windows Classic Desktop** > **Console App (.NET Framework)**.
3. Set the **Name** and **Solution Name** for the application to **BCCustomers**, and choose  **OK** to exit the **New Project** page.

### Add a connected service reference for your OData web service

1. In the Solution Explorer pane, right-click the project (**BCCustomers**), and then choose **Add** > **Connected Service**.  

2. On the **Configure Endpoint** page, you can either keep the **Service name** of **OData Service** or change it if you like. 
2. In the **Address** field, enter the URI for your OData web service.

    The endpoint has the format `https://<servercomputer>:<odataport>/<serverinstance>/ODataV4`, for example:

    `https://localhost:7048/BC/ODataV4`
  
   > [!IMPORTANT]  
   > In this example, we use the HTTP protocol to illustrate the use of OData web services. We recommend that you use the more secure HTTPS protocol when you consume web services.
  
3. Choose **Next**.
4. On the **Settings** page, you can keep the file name **Reference** or change it if you like.
  
   The project is created, and your OData web service is added as a connected service reference. Next, you add the code that will show a list of existing customers, add a customer and then rename the new customer.

5. From Solution Explorer, open the C\# reference file (Reference.cs) under **Connected Services** > **OData Service**.

    - Replace all references to `Microsoft.OData.Edm.Library.Date` with `Microsoft.OData.Edm.Date`.
    - Replace all references to `Microsoft.OData.Edm.Csdl.EdmxReader` with `Microsoft.OData.Edm.Csdl.CsdlReader`.
  
### Add code to your console application  

1.  Add the following `using` statement after the namespaces that are automatically added to your project:  
  
    ```  
    using NAV;  
    ```   
2.  After the `Main` method, add the following method:  
  
    ```  
    private static void PrintCustomersCalledCust(NAV.NAV nav)  
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
  
     The `PrintCustomersCalledCust` method reads the OData web service that you created, Customer, and creates a list of customers where the customer name begins with the letters **Cust**. Next, you add code to the Main method that uses the web service to write to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  
  
3.  In the `Main` method, add the following code to establish the connection to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] through the web service:  
  
    ```  
    NAV.NAV nav = new NAV.NAV(new Uri("https://localhost:7048/DynamicsNAV/ODataV4/Company('CRONUS%20International%20Ltd.')"));
    nav.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials; 
    ```  
  
    In the example, the name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that you modify data for is [!INCLUDE[demoname](../developer/includes/demoname_md.md)]. You must replace this with the name of the company that you have access to. To find the correct URI, you can paste the following URI into your browser and then see the exact URI that you must use: `https://localhost:7048/DynamicsNAV/OData/Company`.  
  
4.  Add the following code to the `Main` method:  
  
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

7.  Build and run the project.  
  
#### To verify the inserted and modified data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  
  
1.  Open the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
2.  Open the list of customers, filter for a customer with the name **Customer NameChanged**.  
  
     This is the customer that the console application created and modified.  
  
## Next Steps  
 You have built a console application that uses an OData web service to modify [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data. You can use similar OData web services in other applications when you want to allow users to modify data outside [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  
  
## See Also
 
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)   
 [Using OData Web Services to Modify Data](Using-OData-Web-Services-to-Modify-Data.md)   
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)   
 [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP-.md)   
 [Web Service Alternatives: SOAP and OData](Web-Service-Alternatives:-SOAP-and-OData.md)