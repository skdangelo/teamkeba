class User < ApplicationRecord
  has_many :programs
  has_many :enrollments
  has_many :enrolled_programs, through: :enrollments, source: :program
  has_many :gallerys
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(program)
    return enrolled_programs.include?(program)
  end     
end
