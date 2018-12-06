class Dish < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :cuisine,
             :counter_cache => true

  # Indirect associations

  has_many   :specialists,
             :through => :bookmarks,
             :source => :venue

  has_many   :fans,
             :through => :bookmarks,
             :source => :user

  # Validations

  validates :name, :uniqueness => { :case_sensitive => false }

  validates :name, :presence => true
end
