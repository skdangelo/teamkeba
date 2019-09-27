class Enrollment < ApplicationRecord
  belongs_to :program
  belongs_to :user
end
