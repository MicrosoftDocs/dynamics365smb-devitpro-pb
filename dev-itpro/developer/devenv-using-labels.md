---
title: "Using labels"
description: ""
ms.custom: na
ms.date: 04/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# Using labels

Labels are string constants displayed in the UI that can be translated into multiple languages, such as captions, descriptions or messages. This way, the UI can be displayed in different languages. For more information on how to enable translation and how it is performed, see [Multilanguage developement](devenv-work-with-translation-files.md).

## Label syntax

The label syntax is defined by a text constant followed by three optional attributes. The attributes must be comma-separated but the order is not enforced. These are described below.


| Attribute   | Type  | Description|
|-------------|-------|--------------|
|**Comment**  |Text   | It is used for general comments about the label, specifically about the placeholders in that label.|
|**Locked**   |Boolean|  When Locked is set to **true**, the label should not be translated. Default value is **false**.|
|**MaxLength**|Integer|It determines how much of the label is used. If no maximum length is specified, the string can be any length.|


## Label types

Labels can take the form of certain properties, a label data type or a report label. The different options are explained in more detail below.

### Properties

The label syntax applies to the following properties:

- [Caption Property](properties/devenv-caption-property.md)
- [ToolTip Property](properties/devenv-tooltip-property.md)
- [OptionCaption Property](properties/devenv-optioncaption-property.md)
- [AdditionalSearchTerms Property](properties/devenv-additionalsearchterms-property.md)
- [InstructionalText Property](properties/devenv-instructionaltext-property.md)
- [PromotedActionCategories Property](properties/devenv-promotedactioncategories-property.md)
- [RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)

The label syntax is given by the property value and optionally by the `Comment`, `Locked` or `MaxLength`parameters. This is shown in the example below for the **Caption** property.

```
Caption = 'Developer translation for %1',  Comment = '%1 is extension name', locked = false, MaxLength=999;
```

### Report labels
### Label Data Type

- CodeCop rule for sufix and prefix



## See Also