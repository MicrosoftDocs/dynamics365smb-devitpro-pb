---
title: "Feature Limitations of the Microsoft Dynamics NAV Web Client"
description: "Listing non-supported and partically supported features of the Web client."
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Feature Limitations of the Microsoft Dynamics NAV Web Client

**Applies to:** [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. [See [!INCLUDE[nav2017](includes/nav2017.md)] version](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client-2017.md).

[!INCLUDE[nav_web](includes/nav_web_md.md)] supports most of the same [!INCLUDE[navnow](includes/navnow_md.md)] objects and features as [!INCLUDE[nav_windows](includes/nav_windows_md.md)], but there are some small differences. This topic lists the features that are not supported or are partially supported by [!INCLUDE[nav_web](includes/nav_web_md.md)]. These features are listed compared with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The topic is divided into the following sections:  

-   [General Features](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#General)  

-   [Objects](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#Objects)  

-   [Pages Features](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#Page)  

-   [Report Features](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#Report)  

-   [C/AL Functions](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#Functions)  

-   [User Interface Features](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md#User)  

> [!NOTE]  
>  In this topic, *partially supported* means that the feature does not have all the capabilities as it does in [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or it works differently than in [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

##  <a name="General"></a> General Features  
 The following table lists general features that are not fully supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Feature|Level of support|Remarks|  
|-------------|----------------------|-------------|  
|COM and Automation|Not supported.|If a [!INCLUDE[navnow](includes/navnow_md.md)] object implements Automation \(objects and servers\), then an error occurs when the object is run in [!INCLUDE[nav_web](includes/nav_web_md.md)].|  
|Departments and MenuSuite|Not supported.|The **Departments** button does not appear in the navigation pane of Role Center in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Instead Page Search is available from an action in the navigation pane of the Role Center and on the top right corner of a page. MenuSuite is used to build the Departments page in [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|  
|System Indicator|Not supported.|The [!INCLUDE[nav_web](includes/nav_web_md.md)] always shows the name of the company that it connects to.|  
|Microsoft .NET Framework Interoperability|Partially supported.|Microsoft .NET Framework interoperability objects that are configured to run on the client are not supported; objects that run on [!INCLUDE[nav_server](includes/nav_server_md.md)] are supported. For more information, see [How to: Set .NET Framework Types to Run on the Microsoft Dynamics NAV Windows Client or Microsoft Dynamics NAV Server Computers](How-to--Set-.NET-Framework-Types-to-Run-on-the-Microsoft-Dynamics-NAV-Windows-Client-or-Microsoft-Dynamics-NAV-Server-Computers.md).|  
|Configuring the user interface for a profile|Partially supported.|You cannot perform configuration using the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Instead, you use the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information, see [Configuring the User Interface (UI) for Users](/dynamics-nav-app/admin-configure-user-interface).|  

##  <a name="Objects"></a> Objects  
 The following object types are not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Feature|Level of support|Remarks|  
|-------------|----------------------|-------------|  
|XMLport|Partially supported.|Request pages are not supported. If you try to run an XMLport with a request page from the [!INCLUDE[nav_web](includes/nav_web_md.md)], then you receive an error that the XMLport page type is not supported.<br /><br /> To run an XMLport without using a request page, you can set the [UseRequestPage Property](UseRequestPage-Property.md) of the XMLport in XML Designer to **No**. Or, if the XMLport is run from C/AL code by calling the [RUN Function \(XMLport\)](RUN-Function--XMLport-.md), then you can set the *ReqWindow* parameter to **false**.|  

##  <a name="Page"></a> Pages Features  
 This section includes page features that are not fully supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

### General Page Features  
 The following page features are not fully supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Feature|Level of support|Remarks|  
|-------------|----------------------|-------------|  
|GridLayout control for arranging page fields|Partially supported.|The **RowSpan** and **ColumnSpan** properties on fields in the grid layout are not supported.|  

### Page Properties  
 The following page properties are not supported or are partially supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

> [!NOTE]  
>  Properties that are not supported are ignored by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Control|Property|Level of support|Remarks|  
|-------------|--------------|----------------------|-------------|  
|Group|ShowAsTree|Partially supported.|Columns will be indented but they will not be expandable or collapsible.|  
||IndentationControls|Partially supported.|Only supports indentation on one column. If you specify more than one column in the **IndentationControls** property, only the first column is used.|  
|Field|ColumnSpan|Not supported.||  
||RowSpan|Not supported.||  
||AssistEdit|Partially supported.|The **AssistEdit** on a field when the page is in the view mode or if the field has the data type of Option appears as hyperlink instead of a button.|  
||DrillDown|Partially supported.|The drill-down on a field when the page is in the view mode or if the field has the data type of Option appears as hyperlink instead of a button.|  
||Lookup|Partially supported.|The Lookup property is not supported on a Repeater control when the page is in the view mode or if the field has the data type of Option. You can use the OnDrillDown trigger instead.|  
|Part|ChartPartID|Not supported.|If a page contains a Chart part, then the part is ignored and nothing appears for the part in the [!INCLUDE[nav_web](includes/nav_web_md.md)].|  
||SystemPartID|Partially supported.|[!INCLUDE[nav_web](includes/nav_web_md.md)] supports Notes and RecordLinks system parts, but not Outlook and MyNotes system parts. RecordLinks only supports access to URLs and resources on file shares; files that are stored locally on the user's computer cannot be accessed. |  
||PartType|Partially supported.|The **Chart** option is not supported. If a page contains a Chart part or an unsupported System part, then the part is ignored and nothing appears for the part in the [!INCLUDE[nav_web](includes/nav_web_md.md)].|  

##  <a name="Report"></a> Report Features  
 The following table includes reports features that are not supported or are partially supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Feature|Level of support|Remarks|  
|-------------|----------------------|-------------|  
|Printing a report without using a request page by calling the Report.Run function|Partially supported.|If a report is run by calling the [REPORT.RUN Function](REPORT-RUN-Function.md) and the function call does not use a request page, then you must set up reports to print from [!INCLUDE[nav_server](includes/nav_server_md.md)], otherwise you will get an error at runtime. Client-side printing is not supported in this scenario. For more information, see the following topics.<br /><br /> -   [How to: Specify Printer Selection for Reports](How-to--Specify-Printer-Selection-for-Reports.md)<br />-   [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md)<br />-   [Printing Reports from a Background Session](Printing-Reports-from-a-Background-Session.md)<br />|  
|Filtering on request page of a report|Partially supported.|The only filters that are shown are filter fields that are set by the **ReqFilterFields** property or the **SETRECFILTER** function in C/AL code.<br /><br /> If you rerun a report, any filter values must be reentered. Filter values are not saved when a report has been run in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. There is a limit on the number of filters a user can set. The user can only specify one filter in addition to the number of filter fields that are set by the **ReqFilterFields** property.|  
|Filter strings in a report URL|Not supported.|Unlike pages, you cannot filter a report by adding filter strings to the Internet address.|  
|Document map in the report preview|Partially supported.|You can experience differences in the behavior between the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].|  

##  <a name="Triggers"></a> C/AL Triggers  
 This section lists the C/AL triggers that are not fully supported by [!INCLUDE[nav_web](includes/nav_web_md.md)]. Triggers that are not supported are not invoked on an object at runtime.  

### Page Triggers  
 The following page triggers are not fully supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Triggers|Level of support|Remarks|  
|--------------|----------------------|-------------|  
|OnClosePage|Partially supported.|The **OnClosePage** trigger is invoked only when the [!INCLUDE[navnow](includes/navnow_md.md)] page is hosted in a modal popup dialog \(MPO\).|  
|OnLookup|Partially supported.|On non-editable fields, the OnLookup trigger is not invoked. This means, the lookup will not render in a Repeater control in the view mode. In this case, you can use the [OnDrillDown Trigger](OnDrillDown-Trigger.md) instead|  
|OnQueryClosePage|Partially supported.|The **OnQueryClosePage** trigger is invoked only when the [!INCLUDE[navnow](includes/navnow_md.md)] page is hosted in a modal popup dialog \(MPO\).|  

##  <a name="Functions"></a> C/AL Functions  
 This section lists the C/AL functions that are not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)]. Except when indicated otherwise, if you use a function that is not supported, you will receive an error at runtime.  

|Data type|Function|Level of support|Remarks|  
|---------------|--------------|----------------------|-------------|  
|Debugger|ACTIVATE|Not supported.|An error occurs at runtime.|  
|Dialog|UPDATE|Not supported.|The function is ignored.|  
|Report|REPORT.RUN and REPORT.RUNMODAL|Partially supported.|If the *ReqWindow* parameter of the function is set to **false**, then you must set up reports to print from [!INCLUDE[nav_server](includes/nav_server_md.md)], otherwise you will get an error at runtime. Client-side printing is not supported in this scenario. For more information, see [How to: Specify Printer Selection for Reports](How-to--Specify-Printer-Selection-for-Reports.md) and [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md).|  
|File|DOWNLOAD and DOWNLOADFROMSTREAM|Partially supported.|-   The *DialogTitle*, *ToFolder*, and *ToFilter* parameters are not supported.|  
||UPLOAD and UPLOADINTOSTREAM|Partially supported.|-   The *DialogTitle*, *FromFolder*, and *FromFile* parameters are not supported.<br />-   Not supported on devices that run on Apple iOS, such as iPad. When you try upload a file, the dialog box for uploading a file appears in the [!INCLUDE[nav_web](includes/nav_web_md.md)], but it is disabled and you cannot select a file.|  

##  <a name="User"></a> User Interface Features  
 The following end-user interface features are not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)].  

|Feature|Level of support|Remarks|  
|-------------|----------------------|-------------|  
|Buffering of keyboard input for heads-down data entry|Not supported.||  
|System actions are default actions in the **Application** menu and ribbon on pages and reports. System actions include the following:<br /><br /> -   Copy Link to Page<br />-   Recipient as Attachment<br />-   Microsoft Word<br />-   Print Page<br />-   Show as List<br />-   OneNote|Not supported.|The actions are not available in the user interface. **Note:**  You can use the action Open in Excel on list places and transfer all data in the list to an Excel spreadsheet. You can use Internet Explorer functions to print a page and to create links on a page.|  
|Actions related to a subpage in a part when the subpage is dynamically shown or hidden based on a user interaction|Partially supported.|The actions related to the subpage will always be present and active in the ribbon, even when the page is not shown. For an example, see page 5855.|  
|FlowFilters on pages|Not supported.|Using **Limit totals to** is not supported. Use **Filter** on column instead.|  
|Vertical resizing of controls|Not supported.|Vertical resizing of controls is not supported on the [!INCLUDE[nav_web](includes/nav_web_md.md)]. A multiline textbox, for example, will not increase in vertical size when the user drags to increase the size of the page. This applies to all controls that can take advantage of vertical or horizontal resizing, such as charts, grids, multiline, textboxes, and control add-ins.|  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md)
