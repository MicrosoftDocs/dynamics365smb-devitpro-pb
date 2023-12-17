The following table describes how dialog boxes are handled in a background or web service session, which has no UI.  

|Method that creates the dialog box|Behavior|  
|------------------------------------------|--------------|  
|[Dialog.Confirm](../dialog/dialog-confirm-method.md)|-   Dialog box is suppressed.<br />-   The following error occurs on the [!INCLUDE[prod_short](prod_short.md)] instance: **[!INCLUDE[prod_short](prod_short.md)] attempted to issue a client callback to show a confirmation dialog box.**|  
|[Dialog.Error](../developer/methods-auto/dialog/dialog-error-string-joker-method.md)|-   Dialog box is suppressed.<br />-   AL code execution ends.<br />-   The error is logged to the event log of the [!INCLUDE[prod_short](prod_short.md)] instance.<br />-   The error is added to the **Comments** field of the **Session Event** table.|  
|[Dialog.Message](../developer/methods-auto/dialog/dialog-message-method.md)|-   Dialog box is suppressed.<br />-   The message is recorded in the event log of the computer that is running [!INCLUDE[prod_short](prod_short.md)] instance. The log entry has type Information and includes the context of the message.|  
|[Dialog.Open](../developer/methods-auto/dialog/dialog-open-method.md)|-   Dialog box is suppressed.<br />-   Dialog box text is not displayed or logged.|  