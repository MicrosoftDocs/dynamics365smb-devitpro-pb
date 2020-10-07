---
title: "Method Attributes"
description: "The attributes that you can apply to methods in AL for Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Method Attributes

An attribute is modifier on a method declaration that specifies information that controls the method's use and behavior. For example, decorating a method with the `Integration` attribute sets the method to be an event publisher. An attribute can have one or more arguments that set properties for the method instance.

In AL, attributes are placed before the method, and have the following syntax:

```AL
[Attribute_Name(ArgumentName : data_type, ArgumentName : data_type)]
```

For example, the Integration attribute has two arguments, and the syntax is:

```AL
[Integration(IncludeSender : Boolean, GlobalVarAccess : Boolean)]
```

## Attributes

The following method attributes are available:

- [CommitBehavior Attribute](devenv-commitbehavior-attribute.md)  
- [Business Attribute](devenv-business-attribute.md)  
- [ConfirmHandler Attribute](devenv-confirmhandler-attribute.md)  
- [EventSubscriber Attribute](devenv-eventsubscriber-attribute.md)  
- [FilterPageHandler Attribute](devenv-filterpagehandler-attribute.md)  
- [HandlerFunctions Attribute](devenv-handlerfunctions-attribute.md)
- [HyperlinkHandler Attribute](devenv-hyperlinkhandler-attribute.md)
- [InDataSet Attribute](devenv-indataset-attribute.md)
- [IntegrationEvent Attribute](devenv-integration-attribute.md)
- [InternalEvent Attribute](devenv-internal-attribute.md)  
- [MessageHandler Attribute](devenv-messagehandler-attribute.md)  
- [ModalPageHandler Attribute](devenv-modalpagehandler-attribute.md)
- [NonDebuggable Attribute](devenv-nondebuggable-attribute.md)  
- [Normal Attribute](devenv-normal-attribute.md)  
- [Obsolete Attribute](devenv-obsolete-attribute.md)
- [PageHandler Attribute](devenv-pagehandler-attribute.md)
- [RecallNotificationHandler Attribute](devenv-recallnotificationhandler-attribute.md)
- [ReportHandler Attribute](devenv-reporthandler-attribute.md)
- [RequestPageHandler Attribute](devenv-requestpagehandler-attribute.md)  
- [Scope Attribute](devenv-scope-attribute.md)
- [SendNotificationHandler Attribute](devenv-sendnotificationhandler-attribute.md)
- [SessionSettingsHandler Attribute](devenv-sessionsettingshandler-attribute.md)
- [StrMenuHandler Attribute](devenv-strmenuhandler-attribute.md)
- [Test Attribute](devenv-test-attribute.md)
- [TestPermissions Attribute](devenv-testpermissions-attribute.md)
- [TryFunction Attribute](devenv-tryfunction-attribute.md)

## See Also

[AL Method Reference](../methods-auto/library.md)  
