---
title: "FilterPageBuilder Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FilterPageBuilder Data Type
Stores filter configurations for a filter page. A filter page is a dynamic page type that contains one or more filter controls that enables users to set filters on fields of the underlying tables.



The following methods are available on instances of the FilterPageBuilder data type.

|Method name|Description|
|-----------|-----------|
|[AddTable(String, Integer)](filterpagebuilder-addtable-method.md)|Adds filter control for a table to a filter page.|
|[AddRecord(String, Record)](filterpagebuilder-addrecord-method.md)|Adds a filter control for a table to a filter page. The table is specified by a record data type variable that is passed to the method.|
|[AddRecordRef(String, RecordRef)](filterpagebuilder-addrecordref-method.md)|Adds a filter control for a table to a filter page. The table is specified by a RecordRef variable that is passed to the method. This creates a filter control on the filter page, where users can set filter table data.|
|[AddField(String, Any [, String])](filterpagebuilder-addfield-string-joker-string-method.md)|Adds a table field to the filter control for a table on filter page.|
|[AddField(String, FieldRef [, String])](filterpagebuilder-addfield-string-fieldref-string-method.md)|Adds a table field to the filter control for a table on filter page.|
|[AddFieldNo(String, Integer [, String])](filterpagebuilder-addfieldno-method.md)|Adds a table field to the filter control for a table on the filter page.|
|[SetView(String, String)](filterpagebuilder-setview-method.md)|Sets the current filter view, which defines the sort order, key, and filters, for a record in a filter control on a filter page. The view contains all fields that have default filters, but does not contain fields without filters.|
|[GetView(String [, Boolean])](filterpagebuilder-getview-method.md)|Gets the filter view (which defines the sort order, key, and filters) for the record in the specified filter control of a filter page. The view contains all fields in the filter control that have a default filter value.|
|[RunModal()](filterpagebuilder-runmodal-method.md)|Builds and runs the filter page that includes the filter controls that are stored in FilterPageBuilder object instance.|
|[Count()](filterpagebuilder-count-method.md)|Gets the number of filter controls that are specified in the FilterPageBuilder object instance.|
|[Name(Integer)](filterpagebuilder-name-method.md)|Gets the name of a table filter control that is included on a filter page based on an index number that is assigned to the filter control.|
|[PageCaption([String])](filterpagebuilder-pagecaption-method.md)| Gets or sets the FilterPageBuilder UI caption. Defaults to the resource text if not explicitly set.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Creating Filter Pages for Tables](../../devenv-filter-pages-for-filtering-tables.md)  
[Developing Extensions](../../devenv-dev-overview.md)  