---
title: Working with labels
description: Learn how to work with translatable string constants displayed in the Business Central client.
ms.reviewer: solsen
ms.date: 01/30/2025
ms.topic: conceptual
ms.author: brobledodiaz
author: blrobl
ms.collection: get-started
ms.custom: evergreen
---

# Working with labels

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

Labels are string constants displayed in the [!INCLUDE[prod_short](includes/prod_short.md)] client that can be translated into multiple languages, such as captions, descriptions, or messages. This way, the user interface can be displayed in different languages.

Learn more about how translation works in [!INCLUDE[prod_short](includes/prod_short.md)] in [Multilanguage development](devenv-work-with-translation-files.md).

## Label syntax

Labels have a specific syntax defined by a text constant followed by three optional parameters. They must be comma-separated, but the order of the parameters isn't enforced. The parameters that you can set are; `Comment`, `Locked`, and `MaxLength` and described in the following table.

| Parameter   | Type  | Description|
|-------------|-------|--------------|
|`Comment`  |Text   | Used for general comments about the label, specifically about the placeholders in that label.|
|`Locked`   |Boolean| When `Locked` is set to `true`, the label shouldn't be translated. The default value is `false`.|
|`MaxLength`|Integer| Determines long the label can be. If no maximum length is specified, the string can be any length.|

## Using labels

A label can take be defined in four different AL structures. It can be:

- The **property value** of certain page and report properties
- The **label data type** variable
- A **report** label
- A **page** label

The different possibilities are explained in more detail in the following section.

### Property value

The label syntax is used in properties that are set to display text on the user interface. You can use the label syntax for the following properties:

- [Caption property](properties/devenv-caption-property.md)  
- [ToolTip property](properties/devenv-tooltip-property.md)  
- [OptionCaption property](properties/devenv-optioncaption-property.md)  
- [AdditionalSearchTerms property](properties/devenv-additionalsearchterms-property.md)  
- [InstructionalText property](properties/devenv-instructionaltext-property.md)  
- [PromotedActionCategories property](properties/devenv-promotedactioncategories-property.md)  
- [RequestFilterHeading property](properties/devenv-requestfilterheading-property.md)  


The following example shows the label syntax when it's used as property value for the **Caption** property. The syntax is similar for the other properties mentioned above.

```AL
Caption = 'Developer translation for %1',  Comment = '%1 is extension name', locked = false, MaxLength=999;
```

### Label data type

The [Label data type](methods-auto/label/label-data-type.md) denotes a string variable used to define error messages, questions, captions, tokens, or other text constants displayed to the user.

The following code sample illustrates how to use the `Label` data type. The `Comment`, `MaxLength`, and `Locked` parameters are optional, but they can be used to provide additional information about the label. Learn more in [Label syntax](#label-syntax). In the following example the label text is locked for translation and has a maximum length of 999 characters.

```AL
var
    a : Label 'Label Text', Comment='This label shouldn't be translated.', MaxLength=999, Locked=true;
```

> [!TIP]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, you can hover over any variable of the `Label` data type to see the text string value of the label.

There's a guideline for naming `Label` variables. `Label` variable names should have an approved suffix. Learn more in [CodeCop Rule AA0074](analyzers/codecop-aa0074.md).

### Report labels

Report labels are used by report layouts as, for example, the caption for a field, the title for a chart, or the title for the report itself. 

Learn more about labels on reports in [Report labels](./devenv-report-object.md#report-labels).

### Page labels

Page labels are used to display plain text on a page, such as instructions or informative texts. You can find several examples of page labels in the RapidStart Services Wizard in page `"Config. Wizard"`.

Page labels are defined by a `label(Name)` control inside the `area(Content)` part of a page. The following code shows how to define a page label.

```AL
label(BeforeSetupCloseMessage)
{
    ApplicationArea = Basic, Suite;
    Caption = 'If you still need to change setup data, don''t change the profile.'
}
```

## Related information

[Working with labels](devenv-using-labels.md)    
[Working with translation files](devenv-work-with-translation-files.md)  
[Label data type](methods-auto/label/label-data-type.md)   
[Report layouts](devenv-report-design-overview.md#report-layouts)
