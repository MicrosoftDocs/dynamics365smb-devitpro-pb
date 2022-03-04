---
title: "Creating a Custom Layout Report"
description: "Describes the steps involved in creating a report that uses a custom layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/04/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating a Custom Layout Report



```al


layout(UserDefinedType)
        {
            Type = Custom;
            Caption = 'UserDefinedList';
            Summary = 'Employee list sorted by last name in external custom render';
            LayoutFile = 'EmpSortedByLastName.html';
            MimeType = 'Application/AppName/Report/MyUserDefinedType';
        }


```


## See also