aws-swfdemo
===========

A simple Amazon SWF demo with more example

swf-demo-singleactivity-sequence
--------------------------------
A sequence pattern refers to a workflow in which one task follows another in sequential order. It is implemented by calling activities synchronously:

![Alt text](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/images/wp-sequence.png "SWF Sequence")

Since each activity blocks execution of the main thread when it runs, activity2 will run only after activity1 has completed. Likewise, activity3 won't run until after activity2 is complete.

swf-demo-sync-and-choice
--------------------------------
A sequence pattern refers to a workflow in which activity_one and activity_two start in parallel and decider wait the ouput of both befose schdule the activity_three. In this example activity_one and activity_two set two numbers, decider make a sum and pass to activity_three for print and choise if the number is odd or even

![Alt text](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/images/wp-synchronize.png "SWF Sync")
![Alt text](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/images/wp-exclusive-choice.png "SWF Choise")

Since each activity blocks execution of the main thread when it runs, activity2 will run with activity1 in parallel async mode

swf-demo-sns-sample
--------------------------------
An example copied from aws guide



