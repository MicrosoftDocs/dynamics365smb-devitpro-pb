---
title: "TableConnectionType system option"
description: "Use variables of this data type to specify the type of connection to an external database."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TableConnectionType Option Type
> **Version**: _Available or changed with runtime version 1.0._

Use variables of this data type to specify the type of connection to an external database.

## Members
|  Member  |  Description  |
|----------------|---------------|
|CRM|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Dynamics 365 for Sales. The table is typically based on an entity in Dynamics 365 for Sales, such as the Accounts entity.|
|ExternalSQL|Specifies the table as a table or view in SQL Server that is not in the Dynamics 365 Business Central database.|
|Exchange|This is for internal use only.|
|MicrosoftGraph|This is for internal use only.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  