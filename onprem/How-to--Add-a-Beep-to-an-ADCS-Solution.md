---
title: Add Beep Sound to ADCS Solution
description: Add a Beep to an ADCS solution by adding a keyword _BELL_ to a string for the miniform that has the functionality you want to modify.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: d1fde2a6-ab79-45f1-a703-6ceebb828147
caps.latest.revision: 6
---
# How to Add a Beep to an ADCS Solution in Dynamics NAV
You can add beep sounds to your ADCS solution. To do this, you add the keyword **\_BELL\_** to a string for the miniform that has the functionality you want to modify. The keyword is case sensitive. The following procedure demonstrates modifying codeunit 7705, which controls the logon screen for a handheld device.  
  
### To add a beep sound to an ADCS string  
  
1.  Start [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], and on the **Tools** menu, choose **Object Designer**.  
  
2.  Choose **CodeUnit**, and from the list, select a codeunit for ADCS miniforms, for example, codeunit 7705.  
  
3.  Choose the **Design** button. The C/AL Editor opens.  
  
4.  On the **View** menu, choose **C/AL Globals**.  
  
5.  Choose the **Text Constants** tab.  
  
6.  For each string for which you want to sound a beep, append the following code to the end of the string.  
  
    ```  
    _BELL_  
    ```  
  
     The following is example code.  
  
    ```  
    Invalid User ID._BELL_  
    ```  
  
     For a double-beep, append the following code.  
  
    ```  
    _BELL__BELL_  
    ```  
  
     Recompile the codeunit.  
  
## See Also  
 [ADCS Overview](ADCS-Overview.md)