class Music < ApplicationRecord
  belongs_to :album

  include ImageUploader[:image]

  validates :title, presence: true
end
