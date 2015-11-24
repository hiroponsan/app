class Product < ActiveRecord::Base
  has_many :reviews

  # def easy_average
  #   reviews.average(:easy).round if reviews.present?
  # end

  # def fun_average
  #   reviews.average(:fun).round if reviews.present?
  # end
  # def all_average
    # self.reviews.average(:all).round
  # end


  validates :easy, :fun, :test, :report, :review, :attendence, presence: true



end
