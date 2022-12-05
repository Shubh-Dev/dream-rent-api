set :runner_command, "rails runner"

every 15.minutes do
    rake 'testing:run_tests'
  end

