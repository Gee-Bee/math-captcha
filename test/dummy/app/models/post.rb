class Post < ActiveRecord::Base
  validates :name, length: {minimum: 8}
end
