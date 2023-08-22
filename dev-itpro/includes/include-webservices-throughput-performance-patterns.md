When integrating to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from external systems using web services, it's important to understand the operational limits for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] servers that host the web service endpoints being called. To ensure that excessive traffic doesn't cause stability and performance issues for all users, the online version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server has set up throttling limits on web service endpoints.

Make sure that your external application can handle the three HTTP status codes *429 (Too Many Requests)*, *503 (Service Temporarily Unavailable)*, and *504 (Gateway Timeout)*.

- Handling status codes 429 and 503 requires the client to adopt a retry logic while providing a cool off period. You can apply different strategies, like:

    - Regular interval retry
    - Incremental intervals retry
    - Exponential back-off
    - Randomization

- Handling status code 504 - Gateway Timeout requires the client to refactor the long running request to execute within time limit by splitting the request into multiple requests. Then, deal with potential 429 codes by applying a back off strategy.

A common pattern is to implement a queue in your external application so that you can flatten spikes of traffic. If a request gets the HTTP status code *429 (Too Many Requests)* or *503 (Service Temporarily Unavailable)*, then put it back in the queue and apply one of the retry strategies described previously.

Read more about web service limits, see [Working with API limits in Dynamics 365 Business Central](../api-reference/v2.0/dynamics-rate-limits.md).

The same advice applies for outgoing web service calls using the AL module HttpClient. Make sure your AL code can handle slow response times, throttling, and failures in external services that you integrate with.