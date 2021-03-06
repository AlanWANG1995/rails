require 'test_helper'

class GroupRelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @gr = group_relationships(:one)
    @user = User.find @gr.user_id
    @group = Group.find @gr.group_id
    @courses = @group.courses
  end
  test "before destroy should clear projcts" do
    @gr.destroy
    @courses.each do |c|
      assert_empty Project.where(user_id: @user, pushed_by: c)
    end
  end
end
