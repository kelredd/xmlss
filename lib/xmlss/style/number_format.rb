module Xmlss::Style
  class NumberFormat

    FORMATS = {
      :general => "General",
      :general_number => "General Number",
      :general_date => "General Date",
      :long_date => "Long Date",
      :medium_date => "Medium Date",
      :short_date => "Short Date",
      :long_time => "Long Time",
      :medium_time => "Medium Time",
      :short_time => "Short Time",
      :currency => "Currency",
      :euro_currency => "Euro Currency",
      :fixed => "Fixed",
      :standard => "Standard",
      :percent => "Percent",
      :scientific => "Scientific",
      :yes_no => "Yes/No",
      :true_false => "True/False",
      :on_off => "On/Off"
    }.freeze

    class << self
      def format(f)
        FORMATS[f.to_sym]
      end
    end

    attr_accessor :format

    def initialize(attrs={})
      self.format = attrs[:format]
    end

    def format=(value)
      @format = if value && FORMATS.has_key?(value.to_sym)
        FORMATS[value.to_sym]
      elsif FORMATS.has_value?(value)
        value
      else
        nil
      end
    end

  end
end