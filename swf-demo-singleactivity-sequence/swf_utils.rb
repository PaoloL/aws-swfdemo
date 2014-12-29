require 'aws/decider'

class SwfUtils

  WF_VERSION = "2.2"
  ACTIVITY_VERSION = "2.2"
  WF_TASKLIST = "my_workflow_task_list"
  ACTIVITY_TASKLIST = "my_activity_task_list"
  DOMAIN = "DemoXpeppers"

  AWS.config({
    :access_key_id => 'XXXXXXX',
    :secret_access_key => 'XXXXX',
    :region => 'us-east-1',
  })

  def initialize
    @swf = AWS::SimpleWorkflow.new
    @domain = @swf.domains[DOMAIN]
  end

  #Activity Worker for a Multiple Activites Class
  #def activity_worker(klass)
  #  worker = AWS::Flow::ActivityWorker.new(@domain.client, @domain, ACTIVITY_TASKLIST)
  #  worker.add_implementation(klass.new())
  #  worker
  #end

  #Activity Worker for a single Activites Class
  def activity_worker(klass)
    AWS::Flow::ActivityWorker.new(@domain.client, @domain, ACTIVITY_TASKLIST, klass)
  end

  def workflow_worker(klass)
    AWS::Flow::WorkflowWorker.new(@domain.client, @domain, WF_TASKLIST, klass)
  end

  def workflow_client(klass)
    AWS::Flow::workflow_client(@domain.client, @domain) { { from_class:
    klass.name } }
  end
end
