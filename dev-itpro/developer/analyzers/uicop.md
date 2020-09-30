---
title: "UICop Analyzer"
description: "The UICop analyzer enforces rules that must be respected by extensions that customize the Web client for Business Central."
ms.author: solsen
ms.custom: na
ms.date: 08/25/2020
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
# UICop Analyzer Rules
UICop is an analyzer that enforces rules that must be respected by extensions meant to customize the Web Client.

## Rules

|Id|Title|Description|MessageFormat|Category|Default Severity|IsEnabledbyDefault|
|--|-----|-----------|-------------|--------|----------------|------------------|
|[AW0001](uicop-aw0001-requestpageofxmlportscannotbedisplayed.md)|The Web client does not support displaying the Request page of XMLPorts.|The Web client does not support displaying the Request page of XMLPorts.|The Web client does not support displaying the Request page of the XMLPort '{0}'.|WebClient|Warning|true|
|[AW0002](uicop-aw0002-cuegroupscannotcontainbothactionsandfields.md)|The Web client does not support displaying both Actions and Fields in Cue Groups. Only Fields will be displayed.|The Web client does not support displaying both Actions and Fields in Cue Groups. Only Fields will be displayed.|The Web client does not support displaying both Actions and Fields in the Cue Group '{0}'. Only Fields will be displayed.|WebClient|Warning|true|
|[AW0003](uicop-aw0003-repeaterwithpartscannotbedisplayed.md)|The Web client does not support displaying Repeater controls containing Parts.|The Web client does not support displaying Repeater controls containing Parts.|The Web client does not support displaying Repeater controls containing Parts.|WebClient|Warning|true|
|[AW0004](uicop-aw0004-blobcannotbeusedonpagefield.md)|A Blob cannot be used as a source expression for a page field.|A Blob cannot be used as a source expression for a page field.|A Blob cannot be used as a source expression for a page field.|WebClient|Warning|true|
|[AW0005](uicop-aw0005-useimageproperty.md)|Actions should use the Image property.|Actions should use the Image property.|Action with name '{0}' should have a value for the Image property.|WebClient|Info|true|
|[AW0006](uicop-aw0006-useusagecategoryproperty.md)|Pages and reports should use the UsageCategory and ApplicationArea properties to be searchable.|Pages and reports should use the UsageCategory and ApplicationArea properties to be searchable.|The {0} '{1}' should use the UsageCategory and ApplicationArea properties to be searchable.|WebClient|Info|true|
|[AW0007](uicop-aw0007-repeaterwithflowfiltercannotbedisplayed.md)|The Web client does not support displaying Repeater controls that contain FlowFilter fields.|The Web client does not support displaying Repeater controls that contain FlowFilter fields.|The FlowFiter field '{0}' in the Repeater control '{1}' cannot be displayed by the Web client.|WebClient|Error|true|
|[AW0008](uicop-aw0008-repeatersisnotsupportedincardpages.md)|The Web client does not support displaying Repeater controls in pages of type Card, Document, and ListPlus.|The Web client does not support displaying Repeater controls in pages of type Card, Document, and ListPlus.|The repeater '{0}' in page '{1}' is not supported by the Web client. The Web client does not support displaying repeater controls in pages of type '{2}'.|WebClient|Warning|true|
|[AW0009](uicop-aw0009-blobbitmapusageonpagefielddeprecated.md)|Using a Blob with subtype Bitmap on a page field is deprecated. Instead use the Media/MediaSet data types.|Using a Blob with subtype Bitmap on a page field is deprecated. Instead use the Media/MediaSet data types.|Using a Blob with subtype Bitmap on a page field is deprecated. Instead use the Media/MediaSet data types.|WebClient|Warning|true|
|[AW0011](uicop-aw0011-addpromotedonlyifallactionsmarkedpromoted.md)|Add PromotedOnly="true" to some or all promoted actions to avoid identical actions from appearing in both the promoted and default sections of the command bar.|Add PromotedOnly="true" to some or all promoted actions to avoid identical actions from appearing in both the promoted and default sections of the command bar.|Group "{0}" only contains promoted actions that are not set to PromotedOnly="true".|WebClient|Info|true|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Using the Code Analysis Tool](../devenv-using-code-analysis-tool.md)  
[Ruleset for the Code Analysis Tool](../devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools with the Ruleset](../devenv-using-code-analysis-tool-with-rule-set.md)