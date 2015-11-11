class Review < ActiveRecord::Base
  belongs_to :product

  validates :fun, presence: true
  validates :easy, presence: true
  validates :attendence, presence: true
  validates :review, presence: true
  validates :report, presence: true
  validates :test, presence: true


end
