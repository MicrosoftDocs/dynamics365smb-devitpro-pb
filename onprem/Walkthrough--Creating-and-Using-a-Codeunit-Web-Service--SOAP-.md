---
title: "Walkthrough: Creating and Using a Codeunit Web Service (SOAP)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: efcf5eaf-b129-469d-b4f7-b8681574483e
caps.latest.revision: 90
manager: edupont
---
# Walkthrough: Creating and Using a Codeunit Web Service (SOAP)
Web services provide easy communication and data exchange in a secured environment. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can create, publish, and use web services. For example, you can publish a web service that lists all your customers and have that web service be immediately available for authorized requests over the network.  
  
## About This Walkthrough  
 This walkthrough provides an overview of how to create and use a simple SOAP web service. The walkthrough illustrates to the following tasks:  
  
-   Creating a codeunit in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
-   Publishing the codeunit as a web service.  
  
-   Verifying web service availability.  
  
-   Using the web service from a console application that you create in Visual Studio.  
  
> [!NOTE]  
>  You can publish codeunits only as SOAP services, not as OData web services.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   [!INCLUDE[demolong](includes/demolong_md.md)].  
  
-   Visual Studio 2012 or Visual Studio 2010. You can use any edition of Visual Studio that supports adding web references. In this walkthrough, you will use Visual Studio 2012. You also have the option of using service references instead of web references, or of using the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  
  
## Creating a Codeunit  
 In this procedure, you create a codeunit called `Letters` that takes a lowercase input string and returns an uppercase string.  
  
#### To create a codeunit  
  
1.  Open the [!INCLUDE[navnow](includes/navnow_md.md)] development environment and then connect to the [!INCLUDE[demoname](includes/demoname_md.md)] company.  
  
     Object Designer opens automatically in the development environment.  
  
2.  In Object Designer, choose **Codeunit**, and then choose **New**  
  
     The **C/AL Editor** opens.  
  
3.  On the **View** menu, choose **C/AL Globals**.  
  
4.  In the **C/AL Globals** window, choose the **Functions** tab, and then enter **Capitalize** as the function name.  
  
5.  Select the **Capitalize** function, in the **View** menu, choose **Properties**, and then set the **Local** property to **No**.  
  
     Setting this property makes the function accessible from the other objects. For more information about this property, see [Local Property](Local-Property.md).  
  
6.  In the **C/AL Globals** window, choose the **Locals** button.  
  
7.  On the **Parameters** tab, type **inputstring** in the **Name** field, and then select **Text** in the **DataType** field. Set the length to **250**.  
  
8.  On the **Return Value** tab, enter **outputstring** in the **Name** field, and then select **Text** in the **Return Type** field. Set the length to **250**.  
  
9. Close the **C/AL Locals** window, and then close the **C/AL Globals** window.  
  
10. In the **C/AL Editor**, under `Capitalize`, add the following line of code:  
  
    ```  
    outputstring := UPPERCASE(inputstring);  
    ```  
  
11. Choose **Save** from the File menu.  
  
12. When you are prompted, enter **50000** for the codeunit ID, then enter **Letters** for the name, make sure the compile check box is checked, and then choose **OK**.  
  
## Publishing the Web Service  
 After the codeunit is created and saved, you publish it using the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
#### To publish the web service  
  
1.  Open the [!INCLUDE[rtc](includes/rtc_md.md)], and then connect to the [!INCLUDE[demoname](includes/demoname_md.md)] company.  
  
2.  In the **Search** box, enter **Web Services**, and then press Return.  
  
3.  In the **Web Services** page, choose **New**.  
  
4.  In the **Object Type** column, select **Codeunit**, then in the **Object ID** column enter **50000**, and then enter **Letters** in the **Service Name** column.  
  
5.  Mark the check box in the **Published** column and choose **OK** to close the **New - Web Services** page.  
  
## Verifying Web Service Availability  
  
> [!NOTE]  
>  After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for SOAP-based web services is set to 7047. You can configure this value by using the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
#### To verify availability of the web service  
  
1.  Start Windows Internet Explorer.  
  
2.  In the **Address** field, enter an address in the following format: **http://\<Server>:\<WebServicePort>/\<ServerInstance>/WS/\<CompanyName>/services**.  
  
     For example:  
  
     **http://localhost:7047/DynamicsNAV/WS/CRONUS%20International%20Ltd./services**  
  
    > [!NOTE]  
    >  The company name is case-sensitive.  
  
     The page should list the web service that you just published \(`Codeunit/Letters`\).  
  
## Using the Web Service  
 In this walkthrough we use Visual Studio 2012 to call and use the web service.  
  
#### To call the web service  
  
1.  In Visual Studio, on the **File** menu, select **New**, and then choose **Project**.  
  
2.  Under **Installed Templates**, expand the **Visual C\#** node, select **Windows**, and then, select **Console Application**.  
  
3.  Enter the name **UsingLettersService** for the application and choose **OK** to close the **New Project** page.The sample code in this walkthrough expects this exact application name, so do not change it.  
  
4.  In Solution Explorer, right-click the **References** node in the project, and then choose **Add Service Reference**.  
  
5.  In the **Add Service Reference** window, choose the **Advanced** button.  
  
6.  In the **Service Reference Settings** window, choose the **Add Web Reference** button, type or paste the URL that you used when you checked the WSDL, such as **http://localhost:7047/DynamicsNAV/WS/Services**, and then choose **Go** \(the green button with the arrow\).  
  
7.  When the **Letters** service is displayed on the discovery Page, choose **View Service**, then in the **Web reference name** text box, rename **localhost** to **WebService**, and then choose **Add Reference**.  
  
8.  In Solution Explorer, choose **Program.cs** and replace the existing code with the following code:  
  
    ```c#  
    using System;  
    using System.Collections.Generic;  
    using System.Text;  
  
    namespace UsingLettersService  
    {  
        // Imports newly generated web service proxy.  
        using WebService;  
  
        class Program  
        {  
            static void Main(string[] args)  
            {  
                // Creates a new instance of the service.  
                Letters ws = new Letters();             
  
                // Uses default credentials for authenticating   
                // with Microsoft Dynamics NAV.  
                ws.UseDefaultCredentials = true;  
                ws.Url = "http://localhost:7047/nav_server_instance/WS/CRONUS%20International%20Ltd./Codeunit/Letters";      
  
                // Declares variables to work with.  
                string inputstring, outputstring;     
                inputstring = "microsoft dynamics nav web services!";  
  
                // Calls the Microsoft Dynamics NAV codeunit web service.  
                outputstring = ws.Capitalize(inputstring);    
  
                // Writes output to the screen.  
                Console.WriteLine("Result: {0}", outputstring);    
  
                // Keeps the console window open until you press ENTER.  
                Console.ReadLine();       
            }  
        }  
    }  
    ```  
  
9. On the **Build** menu, select **Build Solution** to build your project and then, from the Debug menu, choose **Start Debugging** to run the application in debug mode. You should see a console window that prints the text **MICROSOFT DYNAMICS NAV WEB SERVICES\!** in uppercase letters.  
  
10. Press Enter to close the application.  
  
## Next Steps  
 This walkthrough illustrated how you can publish a codeunit as a web service from [!INCLUDE[navnow](includes/navnow_md.md)] and write a program that uses the web service. The next step is to expose a page as a web service and then interact with data from that page. For details, see [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP-.md).  
  
## See Also  
 [Web Services](Web-Services.md)   
 [SOAP Web Services](SOAP-Web-Services.md)   
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)   
 [How to: Publish a Web Service](How-to--Publish-a-Web-Service.md)   
 [Walkthrough: Configuring Web Services to Use SSL \(SOAP and OData\)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md)   
 [Web Service Alternatives: SOAP and OData](Web-Service-Alternatives:-SOAP-and-OData.md)