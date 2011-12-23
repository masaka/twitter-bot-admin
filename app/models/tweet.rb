class Tweet < ActiveRecord::Base
  validates_length_of :title, :in => 1..140
end
