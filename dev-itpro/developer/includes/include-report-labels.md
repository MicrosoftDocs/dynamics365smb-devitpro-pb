Report labels are used by report layouts as, for example, the caption for a field, the title for a chart, or the title for the report itself. 

Report labels are defined inside the `labels` control of a report object, as shown in the following code sample.

```AL
labels
{
  LabelName1 = 'Label Text1', Comment='Foo', MaxLength=999, Locked=true;
  LabelName2 = 'Label Text2', Comment='Foo', Locked=false;
} 
```

For a code example on how to use report labels for an RDL layout, see [Walkthrough: Designing a Report from Multiple Tables](../devenv-walktrough-designing-reports-multiple-tables.md).