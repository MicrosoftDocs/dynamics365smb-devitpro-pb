---
title: "Text Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a text string.


The following methods are available on the Text data type.


|Method name|Description|
|-----------|-----------|
|[ConvertStr(String, String, String)](text-convertstr-method.md)|Replaces all chars in source found in FromCharacters with the corresponding char in ToCharacters and returns the converted string. If the length of the FromCharacters parameter and the ToChars parameter are different, an exception is thrown. If the parameter FromCharacters or the parameter ToChars is empty, the source is returned unmodified. Each element in source is only converted ONCE a double-replacement cannot happen.|
|[CopyStr(String, Integer [, Integer])](text-copystr-method.md)|Copies a substring of any length from a specific position in a string (text or code) to a new string.|
|[DelChr(String [, String] [, String])](text-delchr-method.md)|Deletes chars contained in the which parameter in a string based on the contents on the where parameter. If the where parameter contains an equal-sign, then all occurrences of characters in which is deleted from the current value. If the where parameter contains a less-than, then the characters are only deleted when they are first in the string. If the where parameter contains a greater-than, then the characters are only deleted when they are the last in the string. If the where parameter contains any other char, an exception is thrown. If the where parameter or the which parameter is empty, the source is returned unmodified. The which parameter is to be considered as an array of chars to delete where the order does not matter.|
|[DelStr(String, Integer [, Integer])](text-delstr-method.md)|Deletes a substring inside a string (text or code).|
|[IncStr(String)](text-incstr-method.md)|Increases a positive number or decrease a negative number inside a string by one (1).|
|[InsStr(String, String, Integer)](text-insstr-method.md)|Inserts a substring into a string.|
|[LowerCase(String)](text-lowercase-method.md)|Converts all letters in a string to lowercase.|
|[MaxStrLen(String)](text-maxstrlen-string-method.md)|Gets the maximum defined length of a string variable.|
|[MaxStrLen(Variant)](text-maxstrlen-variant-method.md)|Gets the maximum defined length of a variant variable.|
|[PadStr(String, Integer [, String])](text-padstr-method.md)|Changes the length of a string to a specified length. If the string is shorter than the specified length, length spaces are added at the end of the string to match the length. If the string is longer than the specified length, the string is truncated. If the specified length is less than 0, an exception is thrown.|
|[SelectStr(Integer, String)](text-selectstr-method.md)|Retrieves a substring from a comma-separated string.|
|[StrCheckSum(String [, String] [, Integer])](text-strchecksum-method.md)|Calculates a checksum for a string that contains a number. If the source is empty, 0 is returned. Each char in the source and in the weight must be a numeric character 0-9, otherwise an exception is thrown. If the WeightString parameter is shorter then the source, it is padded with '1' up until the length of source. If the WeightString parameter is longer than the source, an exception is thrown.|
|[StrLen(String)](text-strlen-method.md)|Gets the length of a string you define.|
|[StrPos(String, String)](text-strpos-method.md)|Searches for the first occurrence of substring inside a string.|
|[StrSubstNo(String [, Any,...])](text-strsubstno-method.md)|Replaces %1, %2, %3... and #1, #2, #3... fields in a string with the values you provide as optional parameters.|
|[UpperCase(String)](text-uppercase-method.md)|Converts all letters in a string to uppercase.|

The following methods are available on instances of the Text data type.

|Method name|Description|
|-----------|-----------|
|[Contains(Text)](text-contains-method.md)|Returns a value indicating whether a specified substring occurs within this string.|
|[EndsWith(Text)](text-endswith-method.md)|Determines whether the end of this string instance matches the specified string.|
|[IndexOf(Text [, Integer])](text-indexof-method.md)|Reports the one-based index of the first occurrence of the specified string in this instance.|
|[IndexOfAny(Text [, Integer])](text-indexofany-text-integer-method.md)|Reports the one-based index of the first occurrence of the specified string in this instance. The search starts at a specified character position.|
|[IndexOfAny(List of [Char] [, Integer])](text-indexofany-list[char]-integer-method.md)|Reports the one-based index of the first occurrence in this instance of any character in a specified array of Unicode characters. The search starts at a specified character position.|
|[LastIndexOf(Text [, Integer])](text-lastindexof-method.md)|Reports the one-based index position of the last occurrence of a specified string in this instance.|
|[PadLeft(Integer [, Char])](text-padleft-method.md)|Returns a new Text that right-aligns the characters in this instance by padding them on the left, for a specified total length.|
|[PadRight(Integer [, Char])](text-padright-method.md)|Returns a new string that left-aligns the characters in this string by padding them with spaces on the right, for a specified total length.|
|[Remove(Integer [, Integer])](text-remove-method.md)|Returns a new Text in which a specified number of characters from the current string are deleted.|
|[Replace(Text, Text)](text-replace-method.md)|Returns a new Text in which all occurrences of a specified string in the current instance are replaced with another specified string.|
|[Split([Text,...])](text-split-text-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[Split(List of [Text])](text-split-list[text]-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[Split(List of [Char])](text-split-list[char]-method.md)|Splits a string into a maximum number of substrings based on a collection of separators.|
|[StartsWith(Text)](text-startswith-method.md)|Determines whether the beginning of this instance matches a specified string.|
|[Substring(Integer [, Integer])](text-substring-method.md)|Retrieves a substring from this instance.|
|[ToLower()](text-tolower-method.md)|Returns a copy of this string converted to lowercase.|
|[ToUpper()](text-toupper-method.md)|Returns a copy of this string converted to uppercase.|
|[Trim()](text-trim-method.md)|Returns a new Text in which all leading and trailing white-space characters from the current Text object are removed.|
|[TrimEnd([Text])](text-trimend-method.md)|Removes all trailing occurrences of a set of characters specified in an array from the current Text object.|
|[TrimStart([Text])](text-trimstart-method.md)|Removes all leading occurrences of a set of characters specified in an array from the current Text object.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **Text** data type is a value type, such that every time you use a method on it, you create a new string object in memory. This requires a new allocation of space. In situations where you need to perform repeated modifications to a string, the overhead associated with creating a **Text** data type can be costly.  

The [TextBuilder Data Type](../textbuilder/textbuilder-data-type.md) is a reference type, which holds a pointer elsewhere in memory. For performance reasons, we recommend you to use it when you want to modify a string without creating a new object. For example, using [TextBuilder Data Type](../textbuilder/textbuilder-data-type.md)  can boost performance when concatenating many strings together in a loop.

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[TextBuilder Data Type](../textbuilder/textbuilder-data-type.md)