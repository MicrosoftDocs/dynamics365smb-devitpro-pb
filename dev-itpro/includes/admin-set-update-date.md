---
author: edupont04
ms.topic: include
ms.date: 12/10/2021
ms.author: edupont
---
The following fields on the environment page can help you plan the update:

|Field|Description|
|-----|-----------|
|**Available Update Version**|Specifies the version to which you can update your environment|
|**Update Scheduling Available**|Specifies whether it's possible for you to change the update date. The options are **Yes** or **No**.|
|**Scheduled Update Date**| Specifies the default update date set by Microsoft. You can change this date to one you prefer, if **Update Scheduling Available** is set to **Yes**|
|**Update Window (UTC + offset)**| Specifies the hours of the day that an update can run. (UTC + offset) indicates the time zone, represented as Coordinated Universal Time plus or minus the difference in hours and minutes.|
|**Update Rollout State**|Microsoft can sometimes postpone the updates for various reasons. This field provides information that can help you track the current state of the rollout. For more information about what happens in such cases, see [Postponed updates](../administration/update-rollout-timeline.md#postponed)|

> [!IMPORTANT]
> If you don't set a date in the **Scheduled Update Date** field, Microsoft will update the environment automatically on any day between the default date and the date that is shown as the last possible update date in your notification email. If you don't want your environment to be updated automatically, change the update date to one that fits you better.
