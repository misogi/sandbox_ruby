class Person < ApplicationRecord
    validates :age, numericality: {only_integer: true, greater_than: 0}, presence: true
end
