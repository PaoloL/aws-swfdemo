aws-swfdemo
===========

A simple Amazon SWF demo with more example

swf-demo-singleactivity-sequence
--------------------------------
A sequence pattern refers to a workflow in which one task follows another in sequential order. It is implemented by calling activities synchronously:

![Alt text](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/images/wp-sequence.png "SWF Sequence")

Since each activity blocks execution of the main thread when it runs, activity2 will run only after activity1 has completed. Likewise, activity3 won't run until after activity2 is complete.

swf-demo-morectivity-sequence
--------------------------------
A sequence pattern refers to a workflow in which activity one and acitivity two go in parallel and activity three wait ouput from activity one and two before print it's output. 

![Alt text](http://docs.aws.amazon.com/amazonswf/latest/awsrbflowguide/images/wp-synchronize.png "SWF Sequence")

Since each activity blocks execution of the main thread when it runs, activity2 will run with activity1 in parallel async mode

swf-demo-sns-sample
--------------------------------
An example copied from aws guide



