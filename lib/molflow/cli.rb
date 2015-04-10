require 'thor'
require 'pry'

module Molflow
  class CLI < Thor
    # molflow install

    desc 'install', 'Install Figaro'

    method_option 'path',
                  aliases: ['-p'],
                  default: "#{ENV['HOME']}/.molflow",
                  desc: 'Specify a configuration file path'

    def install
      require 'molflow/cli/install'
      Install.start
    end

    # molflow jira:ps

    desc 'jira:ps', 'The list of projects in jira'

    define_method 'jira:ps' do
      require 'molflow/cli/jira_projects'
      JiraProjects.run(options)
    end

    # molflow jira:is

    desc 'jira:is', 'The list of projects in jira'

    define_method 'jira:is' do
      require 'molflow/cli/jira_issues'
      JiraIssues.run(options)
    end
  end
end