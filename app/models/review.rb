class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :test, :report, :attendence, presence: true

  validates :review,     length: { minimum: 1 } 

  validates :fun, numericality: {
            only_integer: true, smaller_than_or_equal_to: 5
          }

  validates :easy, numericality: {
            only_integer: true, smaller_than_or_equal_to: 5
          }

def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end


end
