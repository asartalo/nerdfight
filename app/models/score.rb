class Score < ActiveRecord::Base
  belongs_to :team
  belongs_to :question
end
