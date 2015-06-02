class Ticket < ActiveRecord::Base
  belongs_to :article
  validates :title, :description, presence: true,
                    length: { minimum: 5 }
end
