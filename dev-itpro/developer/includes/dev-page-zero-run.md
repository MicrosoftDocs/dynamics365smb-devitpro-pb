The parameter `Number` is an integer and represents the number of the page that you want to run. If you enter zero (0), the system displays the default lookup window for the current page. If the page you specify doesn't exist, a runtime error occurs.

The code lines are from the base application and illustrate that the `Page.RunModal` method with the `Number` parameter set to zero (0) displays the default lookup window defined for the "G/L Account Where-Used" table.

```al

table 180 "G/L Account Where-Used"
{
    Caption = 'G/L Account Where-Used';
    LookupPageID = "G/L Account Where-Used List"; // The lookup page for the G/L Account Where-Used table
    DataClassification = CustomerContent;
    ...
}
```

```al
codeunit 100 "Calc. G/L Acc. Where-Used"
{
    ...   
    var
        TempGLAccWhereUsed: Record "G/L Account Where-Used" temporary;
        ...

...

local procedure ShowGLAccWhereUsed()
begin
    OnBeforeShowGLAccWhereUsed(TempGLAccWhereUsed);
    TempGLAccWhereUsed.SetCurrentKey("Table Name");
    Page.RunModal(0, TempGLAccWhereUsed); // Page number is zero, show the default lookup window defined for TempGLAccWhereUsed
end;
...
}
```
