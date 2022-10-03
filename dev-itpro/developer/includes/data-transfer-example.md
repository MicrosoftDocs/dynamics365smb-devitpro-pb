---
author: jswymer
ms.topic: include
ms.date: 09/28/2022
ms.author: jswymer
---
In this code example, you copy the **PK** and **S3** fields in the **Source** table for all rows where **S2** equals *A* and add them as new rows in the **Destination** table. You use `AddConstantValue` method to give the field **D2** the value *X* in the inserted rows.

```AL
local procedure CopyRows()
var
    dt: DataTransfer;
    src: Record Source;
    dest : Record Destination;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFieldValue(src.FieldNo("PK"), dest.FieldNo("PK"));
    dt.AddFieldValue(src.FieldNo("S3"), dest.FieldNo("D3"));
    dt.AddConstantValue('X', dest.FieldNo(D2));
    dt.AddSourceFilter(src.FieldNo("S2"), '=%1', 'A');
    dt.CopyRows();
end;
```
