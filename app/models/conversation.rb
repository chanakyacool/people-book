# == Schema Information
#
# Table name: conversations
#
#  id          :integer          not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string           not null
#

class Conversation < ApplicationRecord
  include Slug

  # Associations
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages,
           dependent: :destroy

  # Scopes
  scope :with_user, ->(user) do
    unscope(:where).where('? IN (sender_id, receiver_id)', user.id)
  end

  scope :with, ->(user) do
    where('? IN (sender_id, receiver_id)', user.id)
  end

  scope :ordered, -> { order(created_at: :desc) }

  def other_user(user)
    sender == user ? receiver : sender
  end

  def participates?(user)
    sender == user || receiver == user
  end
end
