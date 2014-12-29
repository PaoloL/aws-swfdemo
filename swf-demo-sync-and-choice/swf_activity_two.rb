require_relative 'swf_utils'

class SwfActivityTwo
  extend AWS::Flow::Activities

  activity :set_number, :get_number, :print_finish do
    {
      version: SwfUtils::WF_VERSION,
      default_task_schedule_to_start_timeout: 30,
      default_task_start_to_close_timeout: 30
    }
  end

  #setting a number for this instance
  def set_number
    puts "A2: Setting number"
    3
  end

  #print finish for alert end of task
  def print_finish
    puts "A2: Finish!"
  end
end
