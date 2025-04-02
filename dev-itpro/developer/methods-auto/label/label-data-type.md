---
title: "Label data type"
description: "Denotes a string constant that can be optionally translated into multiple languages."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label Data type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a string constant that can be optionally translated into multiple languages.


## Static methods
The following methods are available on the Label data type.


|Method name|Description|
|-----------|-----------|
|[ConvertStr(Text, Text, Text)](label-convertstr-method.md)|Replaces all chars in source found in FromCharacters with the corresponding char in ToCharacters and returns the converted string. If the length of the FromCharacters parameter and the ToChars parameter are different, an exception is thrown. If the parameter FromCharacters or the parameter ToChars is empty, the source is returned unmodified. Each element in source is only converted ONCE a double-replacement cannot happen.|
|[CopyStr(Text, Integer [, Integer])](label-copystr-method.md)|Copies a substring of any length from a specific position in a string (text or code) to a new string.|
|[DelChr(Text [, Text] [, Text])](label-delchr-method.md)|Deletes chars contained in the which parameter in a string based on the contents on the where parameter. If the where parameter contains an equal-sign, then all occurrences of characters in which is deleted from the current value. If the where parameter contains a less-than, then the characters are only deleted when they are first in the string. If the where parameter contains a greater-than, then the characters are only deleted when they are the last in the string. If the where parameter contains any other char, an exception is thrown. If the where parameter or the which parameter is empty, the source is returned unmodified. The which parameter is to be considered as an array of chars to delete where the order does not matter.|
|[DelStr(Text, Integer [, Integer])](label-delstr-method.md)|Deletes a substring inside a string (text or code).|
|[IncStr(Text)](label-incstr-string-method.md)|Increases the last positive number or decreases the last negative number inside a string by one (1).|
|[IncStr(Text, BigInteger)](label-incstr-string-biginteger-method.md)|Increases the last positive number or decreases the last negative number inside a string by the provided positive increment.|
|[InsStr(Text, Text, Integer)](label-insstr-method.md)|Inserts a substring into a string.|
|[LowerCase(Text)](label-lowercase-method.md)|Converts all letters in a string to lowercase.|
|[MaxStrLen(Text)](label-maxstrlen-method.md)|Gets the maximum defined length of a string variable.|
|[PadStr(Text, Integer [, Text])](label-padstr-method.md)|Changes the length of a string to a specified length. If the string is shorter than the specified length, length spaces are added at the end of the string to match the length. If the string is longer than the specified length, the string is truncated. If the specified length is less than 0, an exception is thrown.|
|[SelectStr(Integer, Text)](label-selectstr-method.md)|Retrieves a substring from a comma-separated string.|
|[StrCheckSum(Text [, Text] [, Integer])](label-strchecksum-method.md)|Calculates a checksum for a string that contains a number. If the source is empty, 0 is returned. Each char in the source and in the weight must be a numeric character 0-9, otherwise an exception is thrown. If the WeightString parameter is shorter then the source, it is padded with '1' up until the length of source. If the WeightString parameter is longer than the source, an exception is thrown.|
|[StrLen(Text)](label-strlen-method.md)|Gets the length of a string you define.|
|[StrPos(Text, Text)](label-strpos-method.md)|Searches for the first occurrence of substring inside a string.|
|[StrSubstNo(Text [, Any,...])](label-strsubstno-method.md)|Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.|
|[UpperCase(Text)](label-uppercase-method.md)|Converts all letters in a string to uppercase.|

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