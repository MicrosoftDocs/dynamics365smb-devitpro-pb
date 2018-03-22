---
title: "SelectToken Method"
ms.author: solsen
ms.custom: na
ms.date: 12/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

 

# SelectToken Method
Selects a JsonToken using a JPath expression.

```
[Ok := ] Value.SelectToken(Path, Result)
```

## Parameters
*Value*  
&emsp;Type: [JsonToken](jsontoken-class.md)  

*Path*  
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
&emsp;A valid JPath expression.

*Result*  
&emsp;Type: [JsonToken](jsontoken-class.md)  
&emsp;A **JsonToken** variable that will contain the result if the operation is successful.

## Property Value/Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the operation was successful; otherwise, **false**.

If you omit this optional return value and if the select does not execute successfully, then a run-time error occurs.

## Remarks
The operation will fail if more or less than 1 tokens are the result of evaluating the JPath.

## Example
The following example shows how to select a value from a complex [JSON Object](jsonobject-class.md).
We build up a select expression in the *query* variable, we select the token corresponding to the salary of the employee with the given *employeeId*, and finally, we convert the token to a [Decimal](../datatypes/devenv-decimal-data-type.md) value.

We assume that the *company* token contains JSON data similar to the one below.

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

```
local procedure SelectEmployeeSalary(companyData : JsonToken; employeeId : Text) salary : Decimal;
var
    query : Text;
    salaryToken : JsonToken;
begin
    query := '$.company.employees[?(@.id=="'+employeeId+'")].salary';
    companyData.SelectToken(query, salaryToken);

    salary := salaryToken.AsValue().AsDecimal();    
end;

```
## See Also
[JsonArray](jsonarray-class.md)  
[JsonObject](jsonobject-class.md)  
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
