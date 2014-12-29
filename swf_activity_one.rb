require_relative 'swf_utils'

class SwfActivityOne
  extend AWS::Flow::Activities

  activity :run_step_one, :run_step_two, :run_step_three do
    {
      version: SwfUtils::WF_VERSION,
      default_task_schedule_to_start_timeout: 30,
      default_task_start_to_close_timeout: 30
    }
  end

  # This activity will say hello when invoked by the workflow
  def run_step_one
    puts "Executing Step ONE"
  end

  def run_step_two
    puts "Executing Step TWO"
  end

  def run_step_three
    puts "Executing Step THREE"
  end
end

#Start activity_worker for working on this Activity
SwfUtils.new.activity_worker(SwfActivityOne).start if $0 == __FILE__
