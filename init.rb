require 'redmine'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'issue'
  unless Issue.included_modules.include? RedmineStatusChangeNeglect::IssuePatch
    Issue.send(:include, RedmineStatusChangeNeglect::IssuePatch)
  end
end

Redmine::Plugin.register :redmine_status_change_neglect do
  name 'Redmine Status Change Neglect'
  author 'Dobashi, Hiroki'
  description 'Status change is supported according to condition.'
  version '0.1.0'
  url ''
  author_url ''
end
