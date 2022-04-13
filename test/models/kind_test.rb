require 'test_helper'
class KindTest < ActiveSupport::TestCase 

    def setup 
        @kind = Kind.new(name: "Appetizer")
    end

    test "kind name should be valid" do 
        assert @kind.valid?
    end

    test "kind name present" do
        @kind = Kind.new(name: " ")
        assert_not @kind.valid?
    end

    test "kind name is unique" do
        @kind.save 
        @kind2 = Kind.new(name: "Soups")
        assert @kind2.valid?
    end

    test "kind name is not be too long" do 
        @kind.name = "a" * 26
        @kind.save 
        assert_not @kind.valid?
    end

    test "kind name is not be too short" do 
        @kind.name = "aa"
        @kind.save 
        assert_not @kind.valid?
    end


end