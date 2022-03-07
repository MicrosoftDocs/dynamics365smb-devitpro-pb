---
title: "Walkthrough: Creating a Web Service using Extension Codeunits (SOAP)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
---
# Walkthrough: Creating a Web Service using Extension Codeunits (SOAP)
This walkthrough shows how to publish and consume a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page as a web service and how you can extend the [Basic Page Operations](Basic-Page-Operations.md).  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Registering and publishing a page as a web service.  
  
-   Creating an extension codeunit.  
  
-   Connecting the extension codeunit to the published page.  
  
-   Verifying the service's availability.  
  
-   Calling the web service from a console application that you create in Visual Studio.  
  
### Prerequisites  
 To complete this walkthrough, you need:  
  
-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with a developer license.  
  
-   [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
-   Visual Studio. You can use any edition of Visual Studio that supports adding web references. In this walkthrough, you will use Visual Studio. You also have the option of using service references instead of web references, or of using the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  
  
## Publishing a Page as a Web Service  
 You publish a web service using the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].  
  
#### To register and publish a page as a web service  
  
1.  Open the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)], and then connect to the [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
2.  In the **Search** box, enter **Web Services**, and then press Return.  
  
3.  In the **Web Services** page, choose **New**.  
  
4.  In the **Object Type** column, select **Page**, then enter **21** in the **Object ID** column and then enter **PageWithCapitalization** in the **Service Name** column.  
  
5.  Choose to select the field in the **Published** column.  
  
6.  Choose **OK** to close the **New - Web Services** page.  
  
     Do not close the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] or navigate away from the **Web Services** page.  
  
## Creating an Extension Codeunit  
 After you publish the page, you create a codeunit that extends its functionality. Follow the steps in this procedure to create a codeunit called **CapitalizeName**, which takes a customer name as input and outputs the same customer name capitalized. The codeunit must take the record type of the page as the first parameter.  
  
#### To create an extension codeunit  
  
1.  Open the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] development environment, and then connect to the [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
2.  On the **Tools** menu, choose **Object Designer**.  
  
3.  In Object Designer, choose **Codeunit**, and then choose **New**.  
  
4.  On the **View** menu, choose **AL Globals**.  
  
5.  In the **AL Globals** window, choose the **Functions** tab, and then enter **CapitalizeName** in the name column.  
  
6.  Select the **CapitalizeName** method, in the **View** menu, choose **Properties**, and then set the **Local** property to **No**.  
  
     Setting this property makes the method accessible from the other objects. For more information about this property, see [Local Property](../developer/properties/devenv-Local-Property.md).  
  
7.  In the **AL Globals** window, choose the **Locals** button.  
  
8.  On the **Parameters** tab, enter **Cust** in the **Name** field, and then select **Record** in the **DataType** field.  
  
9. In the **SubType** field, choose the arrow to open the **Table list** window and select **Customer**.  
  
10. Choose **OK** to close the **Table list** window.  
  
11. Close the **AL Locals** window, and then close the **AL Globals** window.  
  
12. In the `CapitalizeName` method, insert the following lines of code:  
  
    ```  
    Cust.Name := UPPERCASE(Cust.Name);   
    Cust.MODIFY(TRUE);  
    ```  
  
13. Close the **AL Editor**.  
  
14. When prompted, enter **50012** in the **ID** text box, enter **CapitalizeName** in the **Name** text box then select the **Compile** check box and then choose **OK**.  
  
## Connecting the Codeunit to the Exposed Page  
 After the codeunit is created and saved, register it under the published page so that the codeunit extends the published page. The codeunit itself should not be marked as **Published**.  
  
#### To connect the codeunit to the exposed page  
  
1.  Navigate to the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] again, and on the **Web Services** page, choose **New**.  
  
2.  In the **Object Type** field, select **Codeunit**, and then select object ID **50012**. In the **Service Name** field, enter **PageWithCapitalization**, which is the same name that you gave the page web service.  
  
3.  Clear the **Published** check box.  
  
4.  Choose **OK** to close the **New - Web Services** page.  
  
## Verifying Web Services Availability  
  
> [!NOTE] 
>  When exposing a web service, you must open the port for other consumers of your web service to access it. You can have your system administrator add the port through Windows Firewall on the computer running [!INCLUDE[server](../developer/includes/server.md)]. The default port for SOAP web services is 7047. Use the [Server Administration Tool](../administration/administration-tool.md) to configure the port for the [!INCLUDE[server](../developer/includes/server.md)] instance; the option is on the SOAP Web Services tab.  
  
#### To verify availability of the web service  
  
1.  Start Windows Internet Explorer.  
  
2.  In the **Address** field, enter the following address where the keys are replaced with the values that are specified in the CustomSettings.config file: **https://\<Server>:\<WebServicePort>/\<ServerInstance>/WS/\<CompanyName>/services**.  
  
     For example:  
  
     **https://localhost:7047/BC130/WS/CRONUS-International-Ltd./services**  
  
    > [!NOTE] 
    >  The company name is case-sensitive.  
  
     The page should list the page web service that you have published: `Page/PageWithCapitalization`.  
  
3.  Close the browser.  
  
## Calling the Web Services  
 Now you can create an application that uses both the page and the codeunit web services. When you add a reference in Visual Studio, methods from both the page and the extension codeunit are available.  
  
#### To call the web services  
  
1.  In Visual Studio, on the **File** menu, select **New**, and then choose **Project**.  
  
2.  Under **Installed Templates**, expand the **Visual C\#** node, select **Windows**, and then, select **Console Application**.  
  
3.  Enter the name **UsingExtensionCodeunit** for the application.  
  
    > [!NOTE] 
    >  The sample code in this walkthrough expects this exact application name, so do not change it.  
  
4.  Choose **OK** to close the **New Project** page.  
  
5.  In Solution Explorer, right-click the **References** node in the project, and then choose **Add Service Reference**.  
  
6.  In the **Add Service Reference** dialog box, choose the **Advanced** button, choose the **Add Web Reference** button, in the URL text box, type or paste the URL that you used when checking the WSDL, such as **https://localhost:7047/BC130/WS/Services**, and then choose **Go**.  
  
7.  When the services are displayed, select the Page service \(`Page/PageWithCapitalization`. Then choose **View Service**.  
  
     Note the first service listed: **CapitalizeName**. This is the codeunit you have created to enhance the basic functionality available with a page web service.  
  
8.  In the Web reference name text box, rename **localhost** to **WebService**, and then choose **Add Reference**.  
  
9. If the program.cs file is not already open, choose the **Program.cs** tab, to open the code editor and replace the existing code with the following code:  
  
    ```c#  
    using System;  
    using System.Collections.Generic;  
    using System.Text;  
  
    namespace UsingExtensionCodeunit  
    {  
        using WebService;  
  
        class Program  
        {  
            static void Main(string[] args)  
            {  
                // Creates instance of service and set credentials.  
                PageWithCapitalization_Service service = new PageWithCapitalization_Service();  
                service.UseDefaultCredentials = true;  
  
                // Creates instance of customer.   
                PageWithCapitalization cust = new PageWithCapitalization();  
                cust.Name = "Louis Taylor";  
  
                // Inserts customer using the default operation.  
                service.Create(ref cust);  
                Console.WriteLine(cust.Name);  
  
                // Calls extension codeunit to capitalize customer name.  
                service.CapitalizeName(cust.Key);  
  
                // Refreshes customer.  
                cust = service.Read(cust.No);          
                Console.WriteLine(cust.Name);  
                Console.ReadLine();  
                service.Delete(cust.Key);  
            }  
        }  
    }  
    ```  
  
10. On the **Build** menu, select **Build Solution** to build your project and then, from the Debug menu, choose **Start Debugging** to run the application in debug mode. You should now see a console window that creates a new customer using a default page operation and then capitalizes the customer name using the extension codeunit.  
  
## See Also  
 [Web Services Overview](web-services.md)