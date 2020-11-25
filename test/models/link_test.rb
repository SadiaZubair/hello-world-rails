require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save link without title" do
    @link = User.first.links.new
    assert_not @link.save
  end
end
