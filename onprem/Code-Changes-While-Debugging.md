---
title: "Code Changes While Debugging"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 28076d19-b29f-4db2-96f8-4ab3900855ce
caps.latest.revision: 3
---
# Code Changes While Debugging
While you are debugging, you may want to edit code, compile, and save objects. In this case, you must know which version of the code that the debugger executes and displays.  
  
 When the debugger loads code to display in the code viewer, it loads code from the newest compiled version of the object. Similarly, when [!INCLUDE[navnow](includes/navnow_md.md)] loads an object into memory to be executed, it loads the newest compiled version of the object. After an object is loaded into memory and is executing, it is not reloaded.  
  
 If you change, compile, and save an object that is not currently executing, then when you next execute that object, the changed version of the object is loaded into memory and executed. This behavior is the same if you are debugging a session. If the object that you changed is not currently executing or being debugged, then when you execute the object, the changed version is executed and displayed in the debugger.  
  
 If you change, compile, and save an object that is currently executing, then the object is not reloaded. The application continues to execute the original version of the object. This behavior is also the same if you are debugging a session. If the object that you changed is currently being debugged, then the object is not reloaded. The debugger continues to execute the original version of the object and the code viewer displays the original version of the object. However, if you refresh the code in the code viewer, or if the debugger refreshes itself, then the code viewer displays the new version of the code, not the version that is currently executing and being debugged.  
  
## See Also  
 [Debugging](Debugging.md)
