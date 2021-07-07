---
title: "Working with labels"
description: "Labels syntax and usage in Business Central."
ms.custom: na
ms.reviewer: solsen
ms.date: 04/01/2021
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# Working with Labels

Labels are string constants displayed in the [!INCLUDE[prod_short](includes/prod_short.md)] client that can be translated into multiple languages, such as captions, descriptions, or messages. This way, the user interface can be displayed in different languages. For more information on how translation is carried out in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], see [Multilanguage development](devenv-work-with-translation-files.md).

## Label syntax

Labels have a specific syntax defined by a text constant followed by three optional parameters. They must be comma-separated, but the order of the parameters is not enforced. The parameters that you can set are described in the following table.

| Parameter   | Type  | Description|
|-------------|-------|--------------|
|**Comment**  |Text   | Used for general comments about the label, specifically about the placeholders in that label.|
|**Locked**   |Boolean| When Locked is set to **true**, the label should not be translated. Default value is **false**.|
|**MaxLength**|Integer| Determines how much of the label is used. If no maximum length is specified, the string can be any length.|

## Using labels

A label can take the form of four different AL structures. It can be the property value of certain page and report properties, the label data type variable and a report or a page label. The different possibilities are explained in more detail below.

### Properties

The label syntax is used in properties that are set to display text on the user interface. It applies to the following properties:

- [Caption Property](properties/devenv-caption-property.md)
- [ToolTip Property](properties/devenv-tooltip-property.md)
- [OptionCaption Property](properties/devenv-optioncaption-property.md)
- [AdditionalSearchTerms Property](properties/devenv-additionalsearchterms-property.md)
- [InstructionalText Property](properties/devenv-instructionaltext-property.md)
- [PromotedActionCategories Property](properties/devenv-promotedactioncategories-property.md)
- [RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)

The following example shows the label syntax when it is used as property value for the **Caption** property.

```AL
Caption = 'Developer translation for %1',  Comment = '%1 is extension name', locked = false, MaxLength=999;
```

### Report labels

Report labels are used by RDL and Word report layouts as, for example, the caption for a field, the title for a chart, or the title for the report itself. For a code example on how to use report labels for an RDL layout, see [Walkthrough: Designing a Report from Multiple Tables](devenv-walktrough-designing-reports-multiple-tables.md).

Report labels are defined inside the `labels` control of a report object, as shown in the code sample below.

```AL
labels
{
  LabelName1 = 'Label Text1', Comment='Foo', MaxLength=999, Locked=true;
  LabelName2 = 'Label Text2', Comment='Foo', Locked=false;
} 
```

### Page labels

Page labels are used to display plain text on a page, such as instructions or informative texts. You can find several examples of page labels in the Rapidstart Services Wizard in page `"Config. Wizard"`.

Page labels are defined by a `label(Name)` control inside the `area(Content)` part of a page. The following code shows how to define a page label.

```AL
label(BeforeSetupCloseMessage)
{
    ApplicationArea = Basic, Suite;
    Caption = 'If you still need to change setup data, do not change the profile.'
}
```


### Label data type

The [Label Data Type](methods-auto/label/label-data-type.md) denotes a string variable used to define error messages, questions, captions, tokens, or other text constants displayed to the user. 

The following code sample illustrates how to use the **Label** data type.

```AL
var
    a : Label 'Label Text', Comment='Foo', MaxLength=999, Locked=true;
```

The **Label** variable names should have an approved suffix. For more information, see [CodeCop Rule AA0074](analyzers/codecop-aa0074.md).


## See Also
[Working with labels](devenv-using-labels.md)    
[Working with Translation Files](devenv-work-with-translation-files.md)  
[Label Data Type](methods-auto/label/label-data-type.md)   
[Report Layouts](devenv-report-design-overview.md#report-layouts)
