---
title: "Compiler Warning AL0917"
description: "The Excel layout '{0}' was automatically upgraded to multi-sheet format."
ms.author: solsen
ms.date: 04/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0917

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The Excel layout '{0}' was automatically upgraded to multi-sheet format. The original sheet '{1}' was not removed. Consider regenerating the layout by deleting '{0}'.


## Description
When an existing single-sheet Excel layout is used with a report that has ExcelLayoutMultipleDataSheets set to true, the compiler automatically adds the required data item sheets. The original template sheet (typically 'Data') is retained but is no longer needed and may confuse users. Delete the layout file to regenerate it cleanly.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  