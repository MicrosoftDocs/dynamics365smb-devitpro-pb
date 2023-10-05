Scheduled tasks or job queue entries that are set to run on a recurring schedule can impact the performance of [!INCLUDE[prod_short](prod_short.md)] in at least two ways:
1. if they run too frequent,
2. if they run heavy jobs while many users are also using [!INCLUDE[prod_short](prod_short.md)].

As for recurrence, ask critically how often the task/job needs to run. Especially for polling scenarios, you might have better and more performant ways to react, such as using webhooks. 

For heavy operations, consider running them outside working hours. This might decrease locking and deadlock issues both for users and for the task/job itself. 