By default, the content headers contain a header for 'Content-Type', namely 'text/plain; charset=utf-8'. This is important to adjust if the endpoint you're calling expects a different content type, for example, multipart/form-data or application/json.

The following AL code examples illustrate ways to change the content header.

```AL
    local procedure SendRequest(HttpMethod: Text[6]) ResponseText: Text
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
    begin
        Content.GetHeaders(ContentHeaders);

        // If you want to set all the headers yourself, do it this way
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'multipart/form-data;boundary=boundary');

        // from here on, the method must deal with calling out to the external service. 
    end;
```


```AL
    local procedure SendRequest(HttpMethod: Text[6]) ResponseText: Text
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
    begin
        Content.GetHeaders(ContentHeaders);

        // In this example, you just change the headers you need
        if ContentHeaders.Contains('Content-Type') then headers.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'multipart/form-data;boundary=boundary');

        // from here on, the method must deal with calling out to the external service. 
    end;
```


When calling an endpoint, you get a response back from the service you called. The response is saved in the data type HttpResponseMessage, where you can parse it to use the information in your app. The service call itself might not succeed, so make sure that you check the HTTP status code in your AL code. In the case of setting the wrong content type header, you will typically receive the _415 Unsupported Media Type_ return code. This return code can also be due to the request's  _Content-Encoding_ header, or if the data you send does not match what the endpoint expects.
