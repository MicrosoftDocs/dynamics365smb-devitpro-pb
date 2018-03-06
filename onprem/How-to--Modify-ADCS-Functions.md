---
title: "How to: Modify ADCS Functions"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2853a303-3827-4a35-a3af-dbe0b85baef5
caps.latest.revision: 6
---
# How to: Modify ADCS Functions
To implement or change the functionality of a miniform function, you must create a new codeunit or modify an existing one. You can learn more about ADCS functionality by examining codeunits such as 7705. That codeunit shows how a Card-type miniform works.  
  
 Any change to an ADCS miniform, other than the addition of an output or text field, must be reflected in the code in the miniform-specific codeunit.  
  
 Each codeunit must contain the following functions.  
  
|Function|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|**OnRun**|Required. Every miniform-specific codeunit must receive a Miniform Header record as a parameter, passed by variance. If this is the first call to the codeunit, the codeunit sends the XML document. If the user has entered some data, the function runs the **ProcessInput** function to process the user's data.|  
|**ProcessInput**|Must appear in all Card-type miniform-specific codeunits. This function processes the user's input. For example, in codeunit 7705, this function reacts to the entry of a User ID, a Password, or the **ESC** function. Since this is a Card-type miniform, the function also reacts when the user enters data in the last field in the form.|  
|**PrepareData**|Sets the active input field and sends the form.|  
|**SendForm**|Required. This function sends the prepared XML form.|  
  
 You can use the following codeunits as templates when creating new miniform-specific codeunits.  
  
|Miniform Type|Sample Codeunit|  
|-------------------|---------------------|  
|Card|7705|  
|Selection list|7706|  
|Data list|7712|  
|Data list input|7713|  
  
### To add support for a function key  
  
1.  The following example code is added to the .xsl file for the plug-in. This creates a function for the F6 key. The key sequence information can be obtained from the device manufacturer.  
  
    ```  
    <xsl:template match="Function[.='F6']">  
      <Function Key1="27" Key2="91" Key3="49" Key4="55" Key5="126" Key6="0"><xsl:value-of select="."/></Function>  
    </xsl:template>  
  
    ```  
  
2.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], open table 7702, and add a code representing the new key. This example creates a key called F6.  
  
3.  Add C/AL code to the relevant function of the miniform-specific codeunit to handle the function key.