---
title: "JsonToken.SelectToken(Text, var JsonToken) Method"
description: "Selects a JsonToken using a JPath expression."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonToken.SelectToken(Text, var JsonToken) Method
> **Version**: _Available or changed with runtime version 1.0._

Selects a JsonToken using a JPath expression.


## Syntax
```AL
[Ok := ]  JsonToken.SelectToken(Path: Text, var Result: JsonToken)
```
## Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
An instance of the [JsonToken](jsontoken-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
A valid JPath expression.  

*Result*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
A JsonToken variable that will contain the result if the operation is successful.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
The operation will fail if more or less than 1 tokens are the result of evaluating the JPath.

## Example
The following example shows how to select a value from a complex JSON Object. We build up a select expression in the query variable, we select the token corresponding to the salary of the employee with the given employeeId, and finally, we convert the token to a Decimal value.

We assume that the company token contains JSON data similar to the one below.

```
{ "company": {
    "employees": [
      { "id": "Marcy",
        "salary": 8.95
      },
      { "id": "John",
        "salary": 7
      },
      { "id": "Diana",
        "salary": 10.95
      }
    ]
  }
}
```

```al
local procedure SelectEmployeeSalary(companyData : JsonToken; employeeId : Text) salary : Decimal
var
    query : Text;
    salaryToken : JsonToken;
begin
    query := '$.company.employees[?(@.id=='''+employeeId+''')].salary';
    companyData.SelectToken(query, salaryToken);

    salary := salaryToken.AsValue().AsDecimal();    
end;
```

> [!NOTE]
> Ensure that the selected expression contains ' (single quotation mark) and not " (double quotation mark) to decorate the string value.

## Related information
[JsonToken Data Type](jsontoken-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)