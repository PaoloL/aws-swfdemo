require 'aws/decider'

class SwfUtils

  WF_VERSION = "2.5"
  ACTIVITY_VERSION = "2.5"
  WF_TASKLIST = "my_workflow_task_list"
  ACTIVITY_TASKLIST = "my_activity_task_list"
  DOMAIN = "DemoXpeppers2.1"

  AWS.config({
    :access_key_id => 'AKIAJAK7TMVSRGTL6FNQ',
    :secret_access_key => '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',
    :region => 'us-east-1',
  })

  def initialize
    @swf = AWS::SimpleWorkflow.new
    @domain = @swf.domains[DOMAIN]
  end

  #Activity Worker for a Multiple Activites Class
  #Make three instance of activity and pass their to Workflow
  def activity_worker
    worker = AWS::Flow::ActivityWorker.new(@domain.client, @domain, ACTIVITY_TASKLIST)
    worker.add_implementation(SwfActivityOne.new)
    worker.add_implementation(SwfActivityTwo.new)
    worker.add_implementation(SwfActivityThree.new)
    worker
  end

  def workflow_worker(klass)
    AWS::Flow::WorkflowWorker.new(@domain.client, @domain, WF_TASKLIST, klass)
  end

  def workflow_client(klass)
    AWS::Flow::workflow_client(@domain.client, @domain) { { from_class:
    klass.name } }
  end
end
