module ActiveAdmin
  module Inputs
    class FilterSelectInput < ::Formtastic::Inputs::SelectInput
      def extra_input_html_options
        {
          :class => 'chosen'
        }
      end
    end
  end
end

class Formtastic::Inputs::SelectInput
  def extra_input_html_options
    {
      :class => 'chosen',
      :multiple => multiple?
    }
  end
end
