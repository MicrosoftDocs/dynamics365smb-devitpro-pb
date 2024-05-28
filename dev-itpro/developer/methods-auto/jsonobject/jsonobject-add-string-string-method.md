---
title: "JsonObject.Add(Text, Text) Method"
description: "Adds a new property to a JsonObject."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.Add(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a new property to a JsonObject.


## Syntax
```AL
[Ok := ]  JsonObject.Add(Key: Text, Value: Text)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The operation will fail if the object already contains a property with the given key.

Note that text constants, such as labels or raw text values assigned in the source code, will be transformed by the compiler. All characters that require escaping in C# strings will be prefixed with the backslash symbol ('\\'). These characters include single and double quotes, backslashes, control characters (for example, line feed or tab). For more information, refer to [String escape sequences](/dotnet/csharp/programming-guide/strings/#string-escape-sequences).

## Example 1

In this example, the newline symbol '\n' is changed to '\\\\n' when the value is added to the JSON object.

```AL
local procedure AddMultilineTextValue()
var
    TextValue: Label 'Multiline\nValue';
    JObj: JsonObject;
begin
    JObj.Add('Key', TextValue);
end;
```

When the code above is run, the variable `JObj` has the following value.
```
{
    "Key": "Multiline\\nValue"
}
```

## Example 2

One way to avoid redundant escaping is to use the [JsonToken.ReadFrom(Text) method](../jsontoken/jsontoken-readfrom-string-method.md)

In the following example, the text value is assigned to a `JsonToken` variable, which is then appended to a `JsonObject`.
Note the double quotes in the `TextValue` label.

```AL
local procedure AddMultilineTextValue()
var
    TextValue: Label '"Multiline\nValue"';
    JTok: JsonToken;
    JObj: JsonObject;
begin
    JTok.ReadFrom(TextValue);
    JObj.Add('Key', JTok);
end;
```

The value of the variable `JObj` after running the code of this example is as follows.
```
{
    "Key": "Multiline\nValue"
}
```

## Example 3

Another method is to add unescaped control characters to the AL text.

```AL
local procedure AddMultilineTextValue()
var
    Builder: TextBuilder;
    JObj: JsonObject;
begin
    Builder.AppendLine('Multiline');
    Builder.Append('Value');
    JObj.Add('Key', Builder.ToText());
end;
```

In the example above, `TextBuilder.AppendLine` method adds unescaped characters `0x0D` and `0x0A` at the end of the line, so the resulting JsonObject contains the escaped `\r` `\n` values.
```
{
    "Key": "Multiline\r\nValue"
}
```

## See also
[JsonObject Data Type](jsonobject-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
