---
title: Update locales in HTML files
description: This article describes the HtmlLocaleChanger tool in the custom help toolkit for Business Central. 

author: edupont04
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 04/01/2021
ms.author: edupont
---

# Custom Help Toolkit: The HtmlLocaleChanger tool

The custom help toolkit includes the **HtmlLocaleChanger** tool that can process HTML files containing Help content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to change the metadata for language. 

HTML files published by Microsoft for documentation contain the ms.locale metadata which describes the language of the content. Depending on the website that you deploy your content to, the value can be used to switch between different translations of the content. For example, on the docs.microsoft.com site, the value specifies if the version of the article that is published under the URL ```https://docs.microsoft.com/de-de/dynamics365/business-central``` is in fact in German (Germany) or in another language, such as English. The same value is also used in the translation process.  

## <a name="htmllocale"></a>Use the HtmlLocaleChanger tool to align locales

The **HtmlLocaleChanger** tool can update your HTML files with a new value for the *ms.locale* entry in the metadata for the specified files. For example, if you have HTML files for German (Germany) and you want to make the same content available in German (Austria), then copy the files to a new folder, and then run the tool to change the setting from *ms.locale: de-de* to *ms.locale:de-at*.  

Here is the syntax for HtmlLocaleChanger.exe:  

```cmd
HtmlLocaleChanger.exe --h <path> --l <locale> --v <true|false>
```

Here is an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|h|Specifies the path to the HTML files that you want to process. |
|l|Specifies the new locale for the HTML files. |
|v|**true** to enable verbose logging; otherwise **false**.|

## Example

The following example changes the original locale to *de-at* with verbose logging:

```cmd
HtmlLocaleChanger.exe --h D:\BC\de --l de-at --v
```

In the example, the `D:\BC\de` folder contains HTML files with the locale *de-de*, and the command changes that locale setting to *de-at*. You can now publish the relevant HTML files to your website in both locales.  

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
[Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)  
