class Task < ApplicationRecord
  belongs_to :users, optional: true
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  enum status: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]
  scope :search_title, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  scope :search_status, -> (status) { where(status: status) if status.present? }
  scope :search_label, -> (id) { where(id: id) }
  has_many :task_labels, dependent: :destroy, foreign_key: 'task_id'
  has_many :labels, through: :task_labels, source: :label
end
