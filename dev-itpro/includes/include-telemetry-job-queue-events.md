The following table describes the event IDs that are currently emitted by the job queue system.

| Event | Event id | Job queue status | Description | 
| ----- | -------- | ---------------- | ----------- |
| Job queue entry enqueued | AL0000E24 | Enqueued | Occurs when a job queue entry is enqueued to run at or after the specified `alJobQueueEarliestStartDateTime`. |
| Job queue entry failed to be enqueued | AL0000FNY | Enqueued | Occurs when a job queue entry fails to enqueue and this happens if no task scheduler is created behind it. |
| Job queue entry started | AL0000E25 |Started | Occurs right before the `Job Queue Start codeunit` is triggered and that codeunit will run the specified `Object ID to run`. |
| Job queue request finished | AL0000E26 | Finished successfully | Occurs when a job queue request completes successfully. |
| Job queue run finished | AL000082C | Finished successfully | Occurs when a job queue run completes successfully. This event is sent only to the extension publisher's telemetry resource. |
| Job queue entry failed (might be retried) | AL0000HE7 | Error | Occurs when a job queue errors, and this is the first thing that is triggered before the updating of records.|
| Job queue entry rescheduled on sign-in | AL0000I49 | N/A | Emitted when an eligible recurring job queue entry without a scheduled task is rescheduled after sign-in. |
| Job queue entry run once by a user | AL0000FMG | N/A | Emitted after a user selects **Run once (foreground)** on the **Job Queue Entries** or **Job Queue Entry Card** page and confirms the action. |
| Job queue entry failed for the last time and is set to stopped | AL0000JRG | Error | Emitted when the job queue entry fails for the very last time before being set in `Error` state. | 
| Job queue entry cancelled | AL0000KZV | N/A | Emitted when a job queue entry is cancelled. The event has normal severity (`1`). |
