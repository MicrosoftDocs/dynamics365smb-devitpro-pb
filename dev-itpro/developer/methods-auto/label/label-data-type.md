---
title: "Label data type"
description: "Denotes a string constant that can be optionally translated into multiple languages."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label data type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a string constant that can be optionally translated into multiple languages.



## Instance methods
The following methods are available on instances of the Label data type.

|Method name|Description|
|-----------|-----------|
|[Contains(Text)](label-contains-method.md)|Returns a value indicating whether a specified substring occurs within this string.|
|[EndsWith(Text)](label-endswith-method.md)|Determines whether the end of this string instance matches the specified string.|
|[IndexOf(Text [, Integer])](label-indexof-method.md)|Reports the one-based index of the first occurrence of the specified string in this instance.|
|[IndexOfAny(Text [, Integer])](label-indexofany-text-integer-method.md)|Reports the one-based index of the first occurrence of the specified string in this instance. The search starts at a specified character position.|
|[IndexOfAny(List of [Char] [, Integer])](label-indexofany-list[char]-integer-method.md)|Reports the one-based index of the first occurrence in this instance of any character in a specified array of Unicode characters. The search starts at a specified character position.|
|[LastIndexOf(Text [, Integer])](label-lastindexof-method.md)|Reports the one-based index position of the last occurrence of a specified string in this instance.|
|[PadLeft(Integer [, Char])](label-padleft-method.md)|Returns a new Text that right-aligns the characters in this instance by padding them on the left, for a specified total length.|
|[PadRight(Integer [, Char])](label-padright-method.md)|Returns a new string that left-aligns the characters in this string by padding them with spaces on the right, for a specified total length.|
|[Remove(Integer [, Integer])](label-remove-method.md)|Returns a new Text in which a specified number of characters from the current string are deleted.|
|[Replace(Text, Text)](label-replace-method.md)|Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.|
|[Split([Text,...])](label-split-text-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[Split(List of [Text])](label-split-list[text]-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[Split(List of [Char])](label-split-list[char]-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[StartsWith(Text)](label-startswith-method.md)|Determines whether the beginning of this instance matches a specified string.|
|[Substring(Integer [, Integer])](label-substring-method.md)|Retrieves a substring from this instance.|
|[ToLower()](label-tolower-method.md)|Returns a copy of this string converted to lowercase.|
|[ToUpper()](label-toupper-method.md)|Returns a copy of this string converted to uppercase.|
|[Trim()](label-trim-method.md)|Returns a new Text in which all leading and trailing white-space characters from the current Text object are removed.|
|[TrimEnd([Text])](label-trimend-method.md)|Removes all trailing occurrences of a set of characters specified in an array from the current Text object.|
|[TrimStart([Text])](label-trimstart-method.md)|Removes all leading occurrences of a set of characters specified in an array from the current Text object.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Parameters

All of the parameters below are *optional* and the order is not enforced.

| Attribute   | Description|
|-------------|--------------|
|**Comment**  | Used for general comments about the label, specifically about the placeholders in that label.|
|**Locked**   | When Locked is set to **true**, the label should not be translated. Default value is **false**.|
|**MaxLength**| Determines how much of the label is used.</br> `<br>If no maximum length is specified, the string can be any length.|

## Syntax example

```al
var
    a : Label 'Label Text', Comment='Foo', MaxLength=999, Locked=true;
```

## Remarks

The `Label` data type is used in .xlf files for translations. For more information, see [Working with Translation Files](../../devenv-work-with-translation-files.md). 

For information about naming, see [CodeCop Rule AA0074](../../analyzers/codecop-aa0074.md).

## Related information

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  