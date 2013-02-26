ActiveAdmin::FormBuilder.class_eval do
  def has_many(association, options = {}, &block)
    options = { :for => association }.merge(options)
    options[:class] ||= ""
    options[:class] << "inputs has_many_fields"

    # Add Delete Links
    form_block = proc do |has_many_form|
      # @see https://github.com/justinfrench/formtastic/blob/2.2.1/lib/formtastic/helpers/inputs_helper.rb#L373
      contents = if block.arity == 1  # for backwards compatibility with REE & Ruby 1.8.x
        block.call(has_many_form)
      else
        index = parent_child_index(options[:parent]) if options[:parent]
        block.call(has_many_form, index)
      end

      if has_many_form.object.new_record?
        contents += template.content_tag(:li) do
          template.link_to I18n.t('active_admin.has_many_delete'), "#", :onclick => "$(this).closest('.has_many_fields').remove(); return false;", :class => "button"
        end
      end

      contents
    end

    content = with_new_form_buffer do
      attributes = { :class => "has_many #{association}" }
      unless options[:sortable].blank?
        attributes[:class] << " sortable"
        attributes['data-sortable'] = options[:sortable]
      end

      template.content_tag :div, attributes do
        form_buffers.last << template.content_tag(:h3, object.class.reflect_on_association(association).klass.model_name.human(:count => 1.1))
        inputs options, &form_block

        js = js_for_has_many(association, form_block, template)
        form_buffers.last << js.html_safe
      end
    end
    form_buffers.last << content.html_safe
  end
end