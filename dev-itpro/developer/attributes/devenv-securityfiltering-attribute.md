---
title: "SecurityFiltering attribute"
description: "Specifies how security filters are applied to the record."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# SecurityFiltering attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies how security filters are applied to the record.


## Applies to

- Variable


## Syntax

```AL
[SecurityFiltering(Kind: SecurityFilter)]
```

### Arguments
*Kind*  
&emsp;Type: [SecurityFilter](../methods-auto/securityfilter/securityfilter-option.md)  
The security filters applied to the record.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 

You can use the [SecurityFiltering (Record) Method](../methods-auto/record/record-securityfiltering-method.md) to get or change the security filters applied to the record.

For more information, see [Using Security Filters in Business Central](../../security/security-filters.md).


## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  