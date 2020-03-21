require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = @user.posts.build(content: '短文を投稿できるよ')
  end

  test '有効な投稿' do
    assert @post.valid?
  end

  test 'ユーザーIDは必須' do
    @post.user = nil
    assert_not @post.valid?
  end

  test '投稿内容は必須' do
    @post.content = '    '
    assert_not @post.valid?
  end

  test '投稿内容は140文字以内' do
    @post.content = 'a' * 140
    assert @post.valid?, '140文字の投稿内容は有効'

    @post.content = 'a' * 141
    assert_not @post.valid?, '141文字の投稿内容は無効'
  end
end
