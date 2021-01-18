---
title: "Duration Data Type"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Duration Data Type
> **Version**: _Available from runtime version 1.0._

Represents the difference between two DateTimes. This value can be negative. It is stored as a 64-bit integer. The integer value is the number of milliseconds during the duration.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The following are examples of durations:  
  
 DATETIME-DATETIME=DURATION  
  
 DATETIME-DURATION=DATETIME  
  
 DATETIME+DURATION=DATETIME  
  
## Example  
 This example shows how to calculate the difference between two DateTimes. This example is run on a computer with the Current Format in the Regional and Language Options set to English (United States).  
  
```  
var
    DateTime1: DateTime;
    DateTime2: DateTime;
    Duration: Duration;
begin
    DateTime1 := CREATEDATETIME(20090101D, 080000T); // January 1, 2009 at 08:00:00 AM  
    DateTime2 := CREATEDATETIME(20090505D, 133001T); // May 5, 2009 at 1:30:01 PM  
    Duration := DateTime2 - DateTime1;  
    Message(FORMAT(Duration));  
end;
```  
  
 The message window displays the following:  
  
 **124 days 4 hours 30 minutes 1 second**  

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  