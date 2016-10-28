class Music < ApplicationRecord
  include ImageUploader[:image]

  validates :title, presence: true
end
