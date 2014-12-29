require_relative 'swf_utils'
require_relative 'swf_workflow'

#Start a Workflow execution SwfWorkflow and passing argument to Workflow
SwfUtils.new.workflow_client(SwfWorkflow).start_execution("Demo AWS Flow Framework")