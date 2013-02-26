ActiveAdmin.register Foo do
  filter :id
  filter :kind, :as => :multiple_select, :collection => ['first', 'second']  

  form do |f|
    f.inputs do
      f.input :title
      f.has_many :foobars, :sortable => :priority do |ff|
        ff.input :title
      end
    end
    f.actions
  end
end
