Variables of the [Dialog data type](../developer/methods-auto/dialog/dialog-data-type.md) or any of the methods listed as dialog methods can cause "callback not allowed" exceptions when they're called from a web service call or a background session. The [Message Method (Dialog)](../developer/methods-auto/dialog/dialog-message-method.md) is the only method in this category that doesn't cause an exception.  

[!INCLUDE[dialog_exceptions_in_non_ui_sessions](include-dialog-exceptions-in-non-ui-sessions.md)]

Other AL methods that you shouldn't use in web service endpoints or background sessions are:  
  
- Page.Run  
- Page.RunModal
- Activate
- Report.Run  
- Report.RunModal
- Hyperlink
- File.Upload
- File.Download
 
You should also avoid operations on client-side Automation and .NET Framework interoperability objects. 