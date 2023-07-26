The HttpClient datatype supports the following HTTP methods:
* DELETE 
* GET 
* POST 
* PATCH
* PUT

The following table includes links to help you get started with calling external services using different HTTP methods.

|To      |See      | 
|--------|---------| 
|Dynamically set the HTTP method from AL, set it on the HttpRequestMessage datatype and use the HttpClient.Send method to call the service.| [HttpClient.Send(HttpRequestMessage, var HttpResponseMessage) Method](../developer/methods-auto/httpclient/httpclient-send-method.md) <br> [HttpRequestMessage.Method([Text]) Method](../developer/methods-auto/httprequestmessage/httprequestmessage-method-method.md) | 
|Read data from a service endpoint using the HTTP GET method.| [HttpClient.Get(Text, var HttpResponseMessage) Method](../developer/methods-auto/httpclient/httpclient-get-method.md)  | 
|Delete data in a service endpoint using the HTTP DELETE method.| [HttpClient.Delete(Text, var HttpResponseMessage) Method](../developer/methods-auto/httpclient/httpclient-delete-method.md)  | 
|Send data to a service endpoint using the HTTP POST method.| [HttpClient.Post(Text, HttpContent, var HttpResponseMessage) Method](../developer/methods-auto/httpclient/httpclient-post-method.md) | 
|Send data to a service endpoint using the HTTP PUT method.| [HttpClient.Put(Text, HttpContent, var HttpResponseMessage) Method](../developer/methods-auto/httpclient/httpclient-put-method.md) | 
