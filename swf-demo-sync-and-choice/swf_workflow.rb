require_relative 'swf_utils'
require_relative 'swf_activity_one'
require_relative 'swf_activity_two'
require_relative 'swf_activity_three'

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
  activity_client(:client_two) { { from_class: "SwfActivityTwo" } }
  activity_client(:client_three) { { from_class: "SwfActivityThree" } }
  # This is the entry point for the workflow
  def start_workflow(name)
    puts "schedule the next Activity/Step for #{name}!"
    numbers = []
    numbers << client_one.send_async(:set_number)
    numbers << client_two.send_async(:set_number)
    wait_for_all(numbers)
    sum = numbers.map! { |x| x.get }.reduce(:+)
    client_one.print_finish
    client_two.print_finish
    resto = (sum % 2)
    case resto
    when 0
      # Use the activity client_three for print pari if rest is 0
      client_three.print_dispari(sum)
    when 1
      # Use the activity client_three for print dispari if rest is 0
      client_three.print_pari(sum)
    end
  end
end

puts "Starting Workflow ..."
SwfUtils.new.workflow_worker(SwfWorkflow).start if $0 == __FILE__