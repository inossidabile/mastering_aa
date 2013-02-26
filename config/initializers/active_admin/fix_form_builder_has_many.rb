ActiveAdmin::FormBuilder.class_eval do
  def js_for_has_many(association, form_block, template)
    association_reflection = object.class.reflect_on_association(association)
    association_human_name = association_reflection.klass.model_name
    placeholder = "NEW_#{association_human_name.upcase.split(' ').join('_')}_RECORD"

    js = with_new_form_buffer do
      inputs_for_nested_attributes :for => [association, association_reflection.klass.new],
                                   :class => "inputs has_many_fields",
                                   :for_options => { :child_index => placeholder },
                                   &form_block
    end

    js = template.escape_javascript(js)

    text = I18n.t 'active_admin.has_many_new', :model => association_human_name.human
    onclick = "$(this).siblings('li.input').append('#{js}'.replace(/#{placeholder}/g, new Date().getTime())); return false;"

    template.link_to text, "#",
                     :onclick => onclick,
                     :class => "button"
  end

end