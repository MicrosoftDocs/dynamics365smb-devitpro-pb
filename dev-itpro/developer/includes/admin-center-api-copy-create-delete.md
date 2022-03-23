> [!NOTE]  
> The Create, Copy, and Delete operations are asynchronous.
>
> With API v2.8 and earlier, the response objects are returned before the underlying operation has completed. The final results of the operation are reflected in the `status` field of the environment that the operations affect. In practice this means that polling of the `Get Environments`endpoints must be done to determine if the given operation was successful.
> 
> With API v2.9 and later, consumers should rely on the `status` field of the corresponding `EnvironmentOperation` response to monitor the status of the underlying operation. So, to get the updated status of the operation, consumers should poll the `Get environment operations for all environments` endpoint rather than  `Get Environments` and inspect the `status` of the relevant operation.