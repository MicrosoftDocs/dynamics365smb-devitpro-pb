Scheduled tasks or job queue entries that are set to run on a recurring schedule can impact the performance of [!INCLUDE[prod_short](prod_short.md)] under either of the following conditions:
- They run too frequently.
- They run heavy jobs while many users are also using [!INCLUDE[prod_short](prod_short.md)].

As for recurrence, consider how often the task or job needs to run. Especially for polling scenarios, you might have better and more performant ways to react, such as using webhooks. 

For heavy operations, consider running them outside working hours. This might decrease locking and deadlock issues both for users and for the task or job itself. 

