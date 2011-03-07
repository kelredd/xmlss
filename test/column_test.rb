require "test/helper"
require 'xmlss/column'

module Xmlss
  class ColumnTest < Test::Unit::TestCase

    context "Xmlss::Column" do
      subject { Column.new }

      should_have_style(Column)
      should_have_accessor :width, :auto_fit_width, :hidden

      should "set it's defaults" do
        assert_equal nil, subject.width
        assert_equal false, subject.auto_fit_width
        assert_equal false, subject.hidden
      end

      should "bark when setting non Numeric width" do
        assert_raises ArgumentError do
          Column.new({:width => "do it"})
        end
        assert_nothing_raised do
          Column.new({:width => 2})
        end
        assert_nothing_raised do
          Column.new({:width => 3.5})
        end
      end

      should "nil out height values that are < 0" do
        assert_equal nil, Column.new({:width => -1.2}).width
        assert_equal nil, Column.new({:width => -1}).width
        assert_equal 0, Column.new({:width => 0}).width
        assert_equal 1.2, Column.new({:width => 1.2}).width
      end

      context "for generating XML" do
        should_have_reader :xml
        should_build_node
      end

    end

  end
end
