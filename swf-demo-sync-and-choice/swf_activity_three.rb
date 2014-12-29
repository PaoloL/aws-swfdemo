require_relative 'swf_utils'

class SwfActivityThree
  extend AWS::Flow::Activities

  activity :print_pari, :print_dispari do
    {
      version: SwfUtils::WF_VERSION,
      default_task_schedule_to_start_timeout: 30,
      default_task_start_to_close_timeout: 30
    }
  end

  def print_pari (sum)
    puts "A3: The sum is #{sum} and the rest is 0 FINISH!"
  end

  def print_dispari (sum)
    puts "A3: The sum is #{sum} and the rest is 1 FINISH!"
  end

end
