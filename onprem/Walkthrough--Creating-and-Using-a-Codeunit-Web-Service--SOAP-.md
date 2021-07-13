---
title: "Creating and Using a Codeunit Web Service (SOAP)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Creating and Using a Codeunit Web Service (SOAP)

Web services provide easy communication and data exchange in a secured environment. In [!INCLUDE[prodshort](../developer/includes/prodshort.md)] , you can create, publish, and use web services. For example, you can publish a web service that lists all your customers and have that web service be immediately available for authorized requests over the network.  
  
## Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with a developer license.  
  
-   [!INCLUDE[demolong](../developer/includes/demolong_md.md)].  
  
-   Visual Studio. You can use any edition of Visual Studio that supports adding web references. You also have the option of using service references instead of web references, or of using the web service proxy generating tools svcutil.exe and wsdl.exe, which are included in the Microsoft .NET Framework SDK.  
  
## Create a Codeunit  
 In the developement environment, create a codeunit, which has the ID **50110** and the name **Letters**`, that takes a lowercase input string and returns an uppercase string. The codeunit should include the following:

```
codeunit 50110 Letters
{
    trigger OnRun()
    begin

    end;

    procedure Capitilize(inputstring: Text[250]) outputstring: Text[250];
    var
        myInt: Integer;
    begin
        outputstring := UPPERCASE(inputstring);
    end;

    var
        myInt: Integer;
}

```

  
## Publish the Web Service  
After the codeunit is created and saved, you publish it using the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].  
  
  
1.  Open the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)], and then connect to the [!INCLUDE[demoname](../developer/includes/demoname_md.md)] company.  
  
2.  Choose the ![Search for Page or Report.](../media/search_small.png "Search for Page or Report icon") icon, enter **Web Services**, and then choose the related link.  
  3.  In the **Web Services** page, choose **New**.  
  
4.  In the **Object Type** column, select **Codeunit**, then in the **Object ID** column enter **50110**, and then enter **Letters** in the **Service Name** column.  
  
5.  Mark the check box in the **Published** column, and choose **OK** to close the **New - Web Services** page.  
  
## Verifying Web Service Availability  
  
> [!NOTE] 
>  After publishing a web service, verify that the port that web service applications will use to connect to your web service is open. The default port for SOAP-based web services is set to 7047. You can configure this value by using the [Server Administration Tool](../administration/administration-tool.md).  
  
#### To verify availability of the web service  
  
1.  Start Windows Internet Explorer.  
  
2.  In the **Address** field, enter an address in the following format: **https://\<Server>:\<WebServicePort>/\<ServerInstance>/WS/\<CompanyName>/services**.  
  
     For example:  
  
     **https://localhost:7047/BC130/WS/CRONUS%20International%20Ltd./services**  
  
    > [!NOTE] 
    >  The company name is case-sensitive.  
  
     The page should list the web service that you just published \(`Codeunit/Letters`\):

    ```
    <contractRef xmlns="https://schemas.xmlsoap.org/disco/scl/" ref="https://localhost:7047/BC130/WS/CRONUS International Ltd./Codeunit/Letters"/>
    ```

  
## Using the Web Service  
In this walkthrough we use Visual Studio to call and use the web service.  
  
#### To call the web service  
  
1.  In Visual Studio, on the **File** menu, select **New**, and then choose **Project**.  
  
2.  Under **Installed Templates**, expand the **Visual C\#** node, select **Windows**, and then, select **Console Application**.  
  
3.  Enter the name **UsingLettersService** for the application and choose **OK** to close the **New Project** page.The sample code in this walkthrough expects this exact application name, so do not change it.  
  
4.  In Solution Explorer, right-click the **References** node in the project, and then choose **Add Service Reference**.  
  
5.  In the **Add Service Reference** window, choose the **Advanced** button.  
  
6.  In the **Service Reference Settings** window, choose the **Add Web Reference** button, type or paste the URL that you used when you checked the WSDL, such as **https://localhost:7047/BC130/WS/Services**, and then choose **Go** \(the green button with the arrow\).  
  
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
                // with Business Central.  
                ws.UseDefaultCredentials = true;  
                ws.Url = "https://localhost:7047/<server instance>/WS/CRONUS%20International%20Ltd./Codeunit/Letters";      
  
                // Declares variables to work with.  
                string inputstring, outputstring;     
                inputstring = "business central web services!";  
  
                // Calls the Business Central codeunit web service.  
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
 This walkthrough illustrated how you can publish a codeunit as a web service from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and write a program that uses the web service. The next step is to expose a page as a web service and then interact with data from that page. For details, see [Walkthrough: Registering and Using a Page Web Service \(SOAP\)](Walkthrough--Registering-and-Using-a-Page-Web-Service--SOAP.md).  
  
## See Also  
 [Web Services](Web-Services.md)   
 [SOAP Web Services](SOAP-Web-Services.md)   
 [Web Services Overview](web-services.md)   
 [Publish a Web Service](publish-web-service.md)   
 [Walkthrough: Configuring Web Services to Use SSL \(SOAP and OData\)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData.md)   
 [Web Services Overview](web-services.md)