---
title: "TestPage Data Type"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c702a57a-726f-43ec-978f-cabd2131a0ea
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---
# TestPage Data Type
Stores test pages. A test page is a logical representation of a page that does not display a user interface (UI). The subtype of a test page is the page that it is used to test.  
  
A test page can be any page type. For more information [Page Object](../devenv-page-object.md). You can use test pages only within test codeunits.

There are three categories of TestPage data type methods: TestPage, TestPage field, and TestPage filter.
  
## TestPage methods
You use the TestPage methods to:
-   Open and close test pages.
-   Navigate among records to display on the test page.
-   Navigate among fields on the test page.
-   Expand and collapse rows on a test page.
-   Create a new record from a test page.
-   Get the options and option count for an option field.
-   Get validation errors and error counts.

Here is a list of the TestPage methods:

[OPENEDIT Method](../methods/devenv-openedit-method-testpage.md)

[OPENNEW Method](../methods/devenv-opennew-method-testpage.md)

[OPENVIEW Method](../methods/devenv-openview-method-testpage.md)

[CLOSE Method](../methods/devenv-close-method-testpage.md)

[TRAP Method](../methods/devenv-trap-method-testpage.md)

[FIRST Method](../methods/devenv-first-method-testpage.md)

[LAST Method](../methods/devenv-last-method-testpage.md)

[NEXT Method](../methods/devenv-next-method-testpage.md)

[PREVIOUS Method](../methods/devenv-previous-method-testpage.md)

[GOTOKEY Method](../methods/devenv-gotokey-method-testpage.md)

[GOTORECORD Method](../methods/devenv-gotorecord-method-testpage.md)

[FINDFIRSTFIELD Method](../methods/devenv-findfirstfield-method-testpage.md)

[FINDNEXTFIELD Method](../methods/devenv-findnextfield-method-testpage.md)

[FINDPREVIOUSFIELD Method](../methods/devenv-findpreviousfield-method-testpage.md)

[GETFIELD Method](../methods/devenv-getfield-method-testpage.md) 

[EXPAND Method](../methods/devenv-expand-method-testpage.md)

[NEW Method](../methods/devenv-new-method-testpage.md)

[GETOPTION Method (TestPage Field)](../methods/devenv-getoption-method-testpage-field.md)

[OPTIONCOUNT Method (TestPage Field)](../methods/devenv-optioncount-method-testpage-field.md)

[GETVALIDATIONERROR Method (TestPage, TestPage Field)](../methods/devenv-getvalidationerror-method-testpage-testpage-field.md)

[VALIDATIONERRORCOUNT Method (TestPage, TestPage Field)](../methods/devenv-validationerrorcount-method-testpage-testpage-field.md)

## TestPage field methods
The field methods enable you to view or change the value of a field on a test page.

Here is a list of the TestPage field methods:

[CAPTION Method](../methods/devenv-caption-method-fieldref-testpage-field.md)

[ASBOOLEAN Method](../methods/devenv-asboolean-method-testpage-field.md)

[ASDECIMAL Method](../methods/devenv-asdecimal-method-testpage-field.md)

[ASINTEGER Method](../methods/devenv-asinteger-method-testpage-field.md)

[ASSERTEQUALS Mehtod](../methods/devenv-assertequals-method-testpage-field.md)

[ASSISTEDIT Method](../methods/devenv-assistedit-method-testpage-field.md)

[DRILLDOWN Method](../methods/devenv-drilldown-method-testpage-field.md)

[GETVALIDATIONERROR Method](../methods/devenv-getvalidationerror-method-testpage-testpage-field.md)

[LOOKUP Method](../methods/devenv-lookup-method-testpage-field.md)

[OPTIONCOUNT Method](../methods/devenv-optioncount-method-testpage-field.md)

[SETVALUE Method](../methods/devenv-setvalue-method-testpage-field.md)

[VALIDATIONERRORCOUNT Method \(TestPage, TestPage Field\)](../methods/devenv-validationerrorcount-method-testpage-testpage-field.md)

## TestPage filter methods
The filter methods enable you to filter data that can be accessed on a test page.

Here is a list of the TestPage filter methods:

[ASCENDING Method](../methods/devenv-ascending-method-testpage-filter.md)

[CURRENTKEY Method](../methods/devenv-currentkey-method-testpage-filter.md)

[GETFILTER Method](../methods/devenv-getfilter-method-testpage-filter.md)

[SETCURRENTKEY Method](../methods/devenv-setcurrentkey-method-testpage-filter.md)

[SETFILTER Method](../methods/devenv-setfilter-method-testpage-filter.md)

## See Also
[AL Method Reference](../methods/devenv-al-method-reference.md)  
[TestRequestPage Data Type](devenv-testrequestpage-data-type.md)  