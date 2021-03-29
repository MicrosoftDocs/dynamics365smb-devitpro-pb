---
title: "RequestPage Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RequestPage Data Type
> **Version**: _Available or changed with runtime version 1.0._

Is a page that is run before the report starts to execute. Request pages enable end-users to specify options and filters for a report.



The following methods are available on instances of the RequestPage data type.

|Method name|Description|
|-----------|-----------|
|[Activate([Boolean])](requestpage-activate-method.md)|Activates the current page on the client if possible. The data on the page will not be refreshed.|
|[Caption([String])](requestpage-caption-method.md)|Shows the caption in the title bar. For example, the default value in English (United States) is the same as the name of the page.|
|[Close()](requestpage-close-method.md)|Closes the current page.|
|[Editable([Boolean])](requestpage-editable-method.md)|Gets or sets the default editability of the page.|
|[LookupMode([Boolean])](requestpage-lookupmode-method.md)|Gets or sets the default lookup mode for the page.|
|[ObjectId([Boolean])](requestpage-objectid-method.md)|Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.|
|[SaveRecord()](requestpage-saverecord-method.md)|Saves the current record as if performed by the client. If the record does not exist, it is inserted, otherwise it is modified.|
|[SetSelectionFilter(var Record)](requestpage-setselectionfilter-method.md)||
|[Update([Boolean])](requestpage-update-method.md)|Saves the current record and then updates the controls on the page. If you set the SaveRecord parameter to false, this method will not save the record before the page is updated.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  