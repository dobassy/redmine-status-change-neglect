module RedmineStatusChangeNeglect
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      base.class_eval do
        before_save :update_status
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def update_status
      # => by default: st(1): new, st(2) in progress, st(4) feedback
      st_new      = IssueStatus.find(1)
      st_progress = IssueStatus.find(2)
      st_feedback = IssueStatus.find(4)

      
      self.status = st_progress if self.assigned_to
      self.status = st_new unless self.assigned_to

      if !self.status.is_closed?
        if self.done_ratio > 0 and self.done_ratio < 100
          self.status = st_progress
        end
        if self.done_ratio == 100
          self.status = st_feedback
        end
      end

      if self.status.is_closed?
        self.done_ratio = 100 if self.done_ratio < 100
      end
    end
  end
end
