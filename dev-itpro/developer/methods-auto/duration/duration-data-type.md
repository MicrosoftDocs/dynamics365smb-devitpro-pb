---
title: "Duration Data Type"
description: "Represents the difference between two DateTimes."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Duration Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents the difference between two DateTimes. This value can be negative. It is stored as a 64-bit integer. The integer value is the number of milliseconds during the duration.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The following are examples of durations:  
  
 DateTime-DateTime=Duration  
  
 DateTime-Duration=DateTime  
  
 DateTime+Duration=DateTime  
  
The value of the Duration data type can also be explicitly defined in milliseconds.

## Example 1

This example shows how to calculate the difference between two DateTimes. This example is run on a computer with the Current Format in the Regional and Language Options set to English (United States).  
  
```al
var
    DateTime1: DateTime;
    DateTime2: DateTime;
    Duration: Duration;
begin
    DateTime1 := CreateDateTime(20090101D, 080000T); // January 1, 2009 at 08:00:00 AM  
    DateTime2 := CreateDateTime(20090505D, 133001T); // May 5, 2009 at 1:30:01 PM  
    Duration := DateTime2 - DateTime1;  
    Message(Format(Duration));  
end;
```  
  
The message window displays the following:  
  
**124 days 4 hours 30 minutes 1 second**  

## Example 2

The following example shows how to specify the duration of a timeout in milliseconds. 

```al
procedure GetDefaultTimeout(): Duration
var
     Timeout: Duration;
begin
    Timeout = 1000 * 60 * 60; // One hour
    exit(Timeout);
end
```

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  