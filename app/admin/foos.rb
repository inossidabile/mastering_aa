ActiveAdmin.register Foo do
  filter :id
  filter :kind, :as => :multiple_select, :collection => ['first', 'second']  
end
