# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :authored_polls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Poll

  has_many :responses,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Response

end
