The following example uses the WordXMLPart method to save the data structure of the report MyReport into a Text variable. The resultant string can be used in Word as a custom XML part. 
 
```AL
report 50142 MyReport
{
    dataset
    {
        dataitem(MyDataitem; MyTable)
        {
            column(Field1; MyField)
            {
            }
        }
        dataitem(MySecondDataitem; MyTable42)
        {
            column(Field42; MyField42)
            {
            }
        }
    }

    labels
    {
        MyLabel = 'My Label Text';
        MySecondLabel = 'My Second Label Text';
    }

    ...
}
```