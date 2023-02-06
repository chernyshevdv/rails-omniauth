class Movie < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  has_many :moviegoers, :through => :reviews

  def to_s
    "#{title} (#{release_date}): #{rating}"
  end
end
