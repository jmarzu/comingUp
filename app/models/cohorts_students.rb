class CohortsStudents < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :student
end
