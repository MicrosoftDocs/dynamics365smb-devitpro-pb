---
title: "How to: Implement Location in C/AL"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f3419eac-58f5-45f7-a679-5f0c6960953b
caps.latest.revision: 13
manager: edupont
---
# How to: Implement Location in C/AL
This example illustrates how you can retrieve location information. The example implements a **GetLocation** action on the Customer Card \(page 21\) that returns the GPS coordinates of the current customers address. It does not save this information to the database. Scenarios in which this functionality could be useful would be displaying a map that shows where your customer is located based on the GPS coordinates. Or, functionality to plan the next round of customer visits based on the addresses of your customers.  

> [!IMPORTANT]  
>  The location information is only available on devices that run the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] and have GPS capabilities. This means that location information is not available from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or from a browser.  

### To implement location in C/AL  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer** to open the Object Designer window.  

2.  In **Object Designer**, choose **Pages**, select the **Customer Card** \(page 21\) and then choose the **Design** button.  

3.  From the Page Designer window, on the **View** menu, choose **C/AL Globals**.  

4.  Create the following variable:  

    |Variable name|DataType|SubType|  
    |-------------------|--------------|-------------|  
    |Location|DotNet|Microsoft.Dynamics.Nav.Client.Capabilities.LocationProvider **Important:**  Choose the Microsoft.Dynamics.Nav.ClientExtensions dll on the **Server** tab, and then choose Microsoft.Dynamics.Nav.Client.Capabilities.LocationProvider Make sure to set the properties **RunOnClient** and **WithEvents** to **Yes**.|  
    |LocationAvailable|Boolean|-|  

5.  On the **View** menu, select **C/AL Code** and in the **C/AL Editor** locate the `OnOpenPage` trigger.  

6.  Instantiate the `Location` variable by adding the following code to the `OnOpenPage` trigger.  

    ```  

    IF Location.IsAvailable THEN  
    BEGIN  
      Location := Location.Create;  
      LocationAvailable := TRUE;  
    END;  
    ```  

7.  Next, create the page action. Choose the **View** menu, and then select **Page Actions**.  

8.  Locate the **ActionGroup** named **Customer** and create a new action; `GetLocation` with the following properties.  

    |Property|Value|  
    |--------------|-----------|  
    |Name|GetLocation|  
    |Visible|LocationAvailable|  
    |Promoted|Yes|  
    |PromotedCategory|Process|  
    |PromotedIsBig|Yes|  

9. Now, in the C/AL Editor, on the `GetLocation – OnAction` trigger, insert the following line of code.  

    ```  
    Location.RequestLocationAsync;  
    ```  

10. While still in the C/AL Editor, on the `LocationChanged` trigger add the following code to handle the GPS coordinates. `LocationChanged` is called when the device has obtained a status.  

    ```  

    Location::LocationChanged(Location : DotNet "Microsoft.Dynamics.Nav.Client.Capabilities.Location")  
    IF(Location.Status = 0) THEN  
    MESSAGE('Your position: %1 %2', Location.Coordinate.Latitude, Location.Coordinate.Longitude)  
    ELSE  
    MESSAGE('Position not available');  
    ```  

    > [!IMPORTANT]  
    >  `Location.Status` can be `0 = Available`, `1 = NoData` \(no data could be obtained\), `2 = TimedOut` \(location information not obtained in due time\), or `3 = NotAvailable` \(for example user denied app access to location\).  

11. Close the C/AL Editor, and then save and compile the page.  

12. You can now test the modified Customer Card page in the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] from either a tablet or a phone with GPS capabilities.  

## See Also  
 [LocationOptions Overview](LocationOptions-Overview.md)   
 [How to: Implement the Camera in C/AL](How-to--Implement-the-Camera-in-C-AL.md)   
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)
