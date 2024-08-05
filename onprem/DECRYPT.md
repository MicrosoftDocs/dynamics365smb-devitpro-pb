---
title: "DECRYPT"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 1421d883-09c9-498e-873a-8965941f3f75
caps.latest.revision: 5
---
# DECRYPT
Takes a string as input and returns the decrypted value of the string.  

## Syntax  

```  
String := DECRYPT(Str)  
```  

#### Parameters  
 *Str*  
 Value: Text or Code  

 The input string that will be decrypted.  

## Property Value/Return Value  
 Value: Text or Code  

 The output string that is decrypted.  

## Exceptions  
 If encryption is not enabled or the encryption key does not exist, the following error will be displayed: **An encryption key is required to complete the request**. If decryption failed because input data could not be decrypted, the following error will be displayed: **Unable to decrypt data. The data was encrypted using a different key**.  

## Example  
 This code example checks whether the tenant is configured to allow encryption using the [ENCRYPTIONENABLED](ENCRYPTIONENABLED.md) function, and then it decrypts an encrypted text string.  

 This example requires that you create the following text constants: EncryptedText and PlainText.  

```  
IF NOT ENCRYPTIONENABLED THEN  
        ERROR('Encryption has not been enabled.');  
      PlainText := DECRYPT(EncryptedText);  

```  

## See Also  
 [System](System.md)   
 [Technical Reference](Technical-Reference.md)   
 [C/SIDE Reference Guide](C-SIDE-Reference-Guide.md)
