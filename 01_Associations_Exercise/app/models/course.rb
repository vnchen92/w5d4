# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    #connecting enrollment to course
    has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

    #connecting user to course
    has_many :enrolled_students,
    through: :enrollments,
    source: :user

    #many prereqs per course
    has_many :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

    #instructor is a user
    belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User
end
