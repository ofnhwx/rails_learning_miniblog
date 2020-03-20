require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      username: 'test',
      email: 'test@example.com',
      password: 'password'
    )
  end

  test '有効なユーザー' do
    @user.valid?
  end

  test 'ユーザー名はアルファベット20文字以内' do
    @user.username = 'a' * 20
    assert @user.valid?

    @user.username = 'a' * 21
    assert_not @user.valid?

    @user.username = 'test user'
    assert_not @user.valid?

    @user.username = 'test1'
    assert_not @user.valid?

    @user.username = 'test@user'
    assert_not @user.valid?
  end

  test 'プロフィールは200文字以内、未入力も可' do
    @user.profile = nil
    assert @user.valid?

    @user.profile = '@' * 200
    assert @user.valid?

    @user.profile = '@' * 201
    assert_not @user.valid?
  end
end
