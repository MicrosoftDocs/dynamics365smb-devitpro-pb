When you try to access content on a server by using the HTTP protocol, it returns a numeric code that indicates the result of the request and semantics of the response, including whether the request was successful.

The first digit of the status code defines the class of response. The last two digits don't have any categorization role. There are five values for the first digit:

1xx (Informational): Provisional response - the request was received, continuing process.
2xx (Successful): The server successfully received and accepted the request.
3xx (Redirection): Further action needs to be taken in order to complete the request.
4xx (Client Error): The request contains an error and can't be fulfilled.
5xx (Server Error): The server failed to fulfill the request.

For more information, see [HTTP Semantics](https://www.rfc-editor.org/rfc/rfc9110.html#name-status-codes)