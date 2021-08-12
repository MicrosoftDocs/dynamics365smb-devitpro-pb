---
title: "Walkthrough: Registering and Using a Page Web Service (SOAP)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Walkthrough: Registering and Using a Page Web Service (SOAP)

This walkthrough focuses on publishing a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as a SOAP web service and then using it in a Visual Studio console application. When you publish a page as a web service, you expose a default set of operations for managing common record-handling tasks to developers. The walkthrough shows how to use some of these operations. Compare this walkthrough with [Walkthrough: Creating and Interacting with a Page Web Service \(OData\)](Walkthrough--Creating-and-Interacting-with-a-Page-Web-Service--OData.md).  

## About This Walkthrough  
 This walkthrough provides an overview of how to publish a page as a web service and then interact with data from that page in a Visual Studio console application. This walkthrough uses a SOAP web service, although you can also create an OData web service to interact with page data. The walkthrough illustrates the following tasks:  

-   Publishing an existing page as a web service.  

-   Verifying the web service availability from a browser.  

-   Using the web service in a Visual Studio console application.  

-   Making calls to the Create, Read, Update, and Delete functions on a page web service.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with a developer license.  

-   [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  

-   Visual Studio. You can use any edition of Visual Studio that supports adding web references. You also have the option of using service references instead of web references, or of using the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  

## Publish a Page as a Web Service  
 You publish a web service using the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].  

1.  Open the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)], and then connect to the [!INCLUDE[demoname](../developer/includes/demoname_md.md)] company.  
  
2.  Choose the ![Search for Page or Report.](../media/search_small.png "Search for Page or Report icon") icon, enter **Web Services**, and then choose the related link.  

3.  In the **Web Services** page, choose **New**.  

4.  In the **Object Type** column, select **Page**, and then enter **21** in the **Object ID** column and **Customer** in the **Service Name** column.  

5.  Mark the check box in the **Published** column.  

6.  Choose **OK** to close the **New - Web Services** page.  

## Verify Web Services Availability  

> [!NOTE] 
>  After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for SOAP-based web services is set to 7047. You can configure this value by using the [Server Administration Tool](../administration/administration-tool.md).  


1.  Open a browser.  

2.  In the **Address** field, enter an address of the following type: 

    ```
    https://\<Server>:\<WebServicePort>/\<ServerInstance>/WS/\<CompanyName>/services
    ```
    For example:

    ```     
    https://localhost:7047/BC130/WS/CRONUS%20International%20Ltd./services
    ```  

    > [!NOTE] 
    >  The company name is case-sensitive.  

     The browser should now show the web service that you have published:  

    ```  
    <contractRef xmlns="https://schemas.xmlsoap.org/disco/scl/" ref="https://localhost:7047/BC130/WS/CRONUS International Ltd/Page/Customer"/>  
    ```  

## Calling the Web Service  
 In this walkthrough we use Visual Studio to call and use the web service.  

#### To call the web service  

1.  In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  

2.  Expand the **Visual C\#** node, select **Windows**, and then, under **Visual Studio installed templates**, select **Console Application**. Enter the name **PrintCustomerList** for the application.  

    > [!IMPORTANT] 
    >  The sample code in this walkthrough expects this exact application name, so you should not change it.  

3.  Choose **OK** to close the **New Project** page.  

4.  In Solution Explorer, right-click **References** in the project, and then choose **Add Service Reference**.  

5.  Choose the **Advanced** button, choose the **Add Web Reference** button, type or paste the URL that you used when you checked the WSDL, such as **https://localhost:7047/[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]/WS/Services**, and then choose **Go**.  

6.  When the **Customer** service is displayed, choose **View Service**, rename **localhost** to **WebService**, and then choose **Add Reference**.  

7.  On the **Program.cs** tab, replace the existing code with the following code:  

    ```c#  
    using System;  
    using System.Collections.Generic;  
    using System.Text;  

    namespace PrintCustomerList  
    {  
        // Import newly generated web service proxy.  
        using WebService;   

        class Program  
        {  
            static void Main(string[] args)  
            {  
                // Creates instance of service and sets credentials.  
                Customer_Service service = new Customer_Service();  
                service.UseDefaultCredentials = true;  
                // Creates instance of customer.  
                Customer cust = new Customer();  
                cust.Name = "Customer Name";  
                Msg("Pre Create");  
                PrintCustomer(cust);  

                // Inserts customer.  
                service.Create(ref cust);  
                Msg("Post Create");  
                PrintCustomer(cust);  

                // Creates filter for searching for customers.  
                List<Customer_Filter> filterArray = new List<Customer_Filter>();  
                Customer_Filter nameFilter = new Customer_Filter();  
                nameFilter.Field = Customer_Fields.Name;  
                nameFilter.Criteria = "C*";  
                filterArray.Add(nameFilter);  

                Msg("List before modification");  
                PrintCustomerList(service, filterArray);  

                cust.Name = cust.Name + "Updated";  
                service.Update(ref cust);  

                Msg("Post Update");  
                PrintCustomer(cust);  

                Msg("List after modification");  
                PrintCustomerList(service, filterArray);  
                service.Delete(cust.Key);  

                Msg("List after deletion");  
                PrintCustomerList(service, filterArray);  

                Msg("Press [ENTER] to exit program!");  
                Console.ReadLine();  
            }  

            // Prints list of filtered customers.  
            static void PrintCustomerList(Customer_Service service, List<Customer_Filter> filter)  
            {  
                Msg("Printing Customer List");  

                // Runs the actual search.  
                Customer[] list = service.ReadMultiple(filter.ToArray(), null, 100);  
                foreach (Customer c in list)  
                {  
                    PrintCustomer(c);  
                }  
                Msg("End of List");  
            }  

            static void PrintCustomer(Customer c)  
            {  
                Console.WriteLine("No: {0} Name: {1}", c.No,c.Name);  
            }  

            static void Msg(string msg)  
            {  
                Console.WriteLine(msg);  
            }  
        }  
    }  
    ```  

8.  On the **Build** menu, select **Build Solution** to build your project and then, from the Debug menu, choose **Start Debugging** to run the application in debug mode. You should now see a console window that prints a list of customers from the [!INCLUDE[demoname](../developer/includes/demoname_md.md)] company. One customer in the list is created, then is modified, and is finally deleted.  

## See Also  
 [Walkthrough: Creating and Interacting with a Page Web Service \(OData\)](Walkthrough--Creating-and-Interacting-with-a-Page-Web-Service--OData.md)
