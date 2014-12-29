require_relative 'swf_utils'
require_relative 'swf_activity_one'
require_relative 'swf_activity_two'

# HelloWorldWorkflow class defines the workflows for the HelloWorld sample
class SwfWorkflow 
  extend AWS::Flow::Workflows

  workflow :start_workflow do
    {
      version: SwfUtils::WF_VERSION,
      default_execution_start_to_close_timeout: 120,
    }
  end

  # Create an activity client using the activity_client method to schedule
  # activities
  activity_client(:client_one) { { from_class: "SwfActivityOne" } }

  # This is the entry point for the workflow
  def start_workflow(name)
    puts "Starting Workflow #{name}!"
    # Use the activity client 'client' to invoke the say_hello activity
    client_one.run_step_one
    client_one.run_step_two
    client_one.run_step_three
  end
end

SwfUtils.new.workflow_worker(SwfWorkflow).start if $0 == __FILE__