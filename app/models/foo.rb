class Foo < ActiveRecord::Base
  has_many :foobars

  accepts_nested_attributes_for :foobars
end
