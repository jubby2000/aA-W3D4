# == Schema Information
#
# Table name: responses
#
#  id        :bigint(8)        not null, primary key
#  user_id   :integer          not null
#  answer_id :integer          not null
#

class Response < ApplicationRecord

  validate :not_duplicate_response, :is_not_author?

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice

  has_one :question,
  through: :answer_choice,
  source: :question

  has_one :poll,
  through: :question,
  source: :poll

  def is_not_author?
    debugger
    unless question.poll.author.id != user_id
      errors[:user_id] << "Authors can't rig their own polls."
    end
  end

  def not_duplicate_response
    respondent_already_answered?
  end

  def sibling_responses
    question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: user_id)
  end

end
