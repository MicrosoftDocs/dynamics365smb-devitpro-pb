---
title: "CREATE Function (Automation)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5b465bda-f087-43ea-8066-f463eb82cb0c
caps.latest.revision: 25
manager: edupont
---
# CREATE Function (Automation)
Creates an Automation object.  
  
## Syntax  
  
```  
  
[Ok :=] CREATE(Automation [,NewServer] [,OnClient])  
```  
  
#### Parameters  
 *Automation*  
 Type: Automation  
  
 A variable that has previously been declared.  
  
 *NewServer*  
 Type: Boolean  
  
 If *NewServer* is **false**, which is the default value, then the CREATE function tries to reuse an already running instance of the Automation server that is referenced by Automation before creating a new instance. If *NewServer* is **true**, then the CREATE function always creates a new instance of the Automation server.  
  
 *OnClient*  
 Type: Boolean  
  
 *OnClient* must evaluate to **true**. You can either set the parameter to **true** or define a Boolean type variable that evaluates to **true**. If variable evaluates to **false**, then you will see a run-time error.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the Automation object could be created; otherwise, **false**.  
  
 If the return value is not tested, then execution will end with a run-time error.  
  
## [!INCLUDE[bp_supcli_head](includes/bp_supcli_head_md.md)]  
 [!INCLUDE[bp_supcli_rtc](includes/bp_supcli_rtc_md.md)]  
  
## Remarks  
  
> [!IMPORTANT]  
>  This function is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 The CREATE function instantiates, or creates, the Automation server that is referenced by the Automation variable. An OCX, or a custom control, is instantiated implicitly, but Automation variables must be created explicitly.  
  
 If you have an array of OCXs, then each control is created when its first member is accessed.  
  
 If you have an array of Automation servers, then you have to call the CREATE function on each element individually. The *NewServer* variable can be used independently on each element.  
  
 The Automation object that is created can be explicitly destroyed by the [CLEAR Function](CLEAR-Function.md). The object is implicitly destroyed when the Automation variable goes out of scope.  
  
 An Automation variable can only be created one time. You will get a run-time error if you try to create an Automation variable again and do not call CLEAR first. You also get a run-time error if you try to create an OCX variable.  
  
## Example  
 The following example shows how you can use the CREATE function. This example requires that you create the following variables.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|Document|Automation|'Microsoft XML, V3.0'.DOMDocument|  
|ReturnValue|Boolean|Not applicable|  
  
```  
ReturnValue := CREATE(Document, FALSE, TRUE);  
```  
  
## See Also  
 [Automation Data Type](Automation-Data-Type.md)