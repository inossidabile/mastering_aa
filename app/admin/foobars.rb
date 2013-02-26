ActiveAdmin.register Foobar do
  filter :id
  filter :title
  filter :priority, :as => :numeric_range
end
