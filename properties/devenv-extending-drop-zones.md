---
title: Add drop zones for file uploads
description: Learn how you can handle multiple file uploads and designate different page parts as file drop zones.
ms.custom: bap-template
ms.reviewer: ivkoleti
ms.topic: conceptual
author: brentholtorf
ms.author: bholtorf
ms.date: 03/04/2024
---
# Add drop zones for uploading multiple files

The ability to handle multiple file uploads and designate different page parts as file drop zones provides greater flexibility and usability. Developers working on applications or customizations that require multi-file upload functionality add value to organizations by improving productivity and the user experience.

The following example designates a group and field as file drop zones by referencing the `ProductImageUpload` action property. The `FileUploadAction` action's `AllowMultipleFiles` property lets you specify whether an action can handle a single file or multiple files. The `AllowedFileExtensions` property allows developers to specify the file types that people can drag to a drop zone. After you drag one or more files to a group or field on a `HappyDragAndDrop` page, the `OnAction` trigger in the `FileUploadAction` property is called with the list of files.

```AL
> page 50102 HappyDragAndDropPage
> {
>   PageType = Card;
>   SourceTable = Item;
>   UsageCategory = Administration;
>
>   Layout
>   {
>      area(content)
>      {
>        group(GroupName)
>        {
>          FileUploadAction = ProductImageUpload;
>
>          field(name; 'Name')
>          {
>             FileUploadAction = ProductImageUpload;
>          }
>        }
>    }
> }
>
> actions
> {
>   area(Processing)
>   {
>     fileUploadAction(ProductImageUpload)
>     {
>         Caption = 'Upload product image';
>         
>         AllowMultipleFiles = false;
>         AllowedFileExtensions = '.jpg','.jpeg','.png';
>
>         trigger OnAction(files: List of [FileInfo])
>         var
>
>           currentFile: FileInfo;
>           stream: InStream;
>         begin
>           foreach currentFile in files do begin
>              currentFile.CreateInStream(stream);
>              // Code here to handle the file
>              Message('%1 has a length of %2', currentFile.FileName, stream.Length)
>            end;
>          end;
>       }
>    }
>  }    
> }
```

## See also

[Module Base Application](/dynamics365/business-central/application/base-application/module/base-application)  
[Extending Application Areas](devenv-extending-application-areas.md)