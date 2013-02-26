module ActiveAdmin
  module Inputs
    class FilterMultipleSelectInput < Formtastic::Inputs::SelectInput
      include FilterBase

      def input_name
        "#{super}_in"
      end

      def extra_input_html_options
        {
          :class => 'chosen',
          :multiple => true
        }
      end
    end
  end
end