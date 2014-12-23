##
# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://aws.amazon.com/apache2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
##

require 'yaml'
require_relative 'basic_activity.rb'

class RejectedActivity < BasicActivity

  # initialize the activity
  def initialize
    super('rejected_activity')
  end

  # Get some data to use to subscribe to the topic.
  def do_activity(task)
    puts "Hello"
    puts "Draft activity started!"

    # make sure that @results is a single string. YAML makes this easy.
    @results = "Return To Draft"
    return true
  end
end

