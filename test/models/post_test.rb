require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "should not save a post missing an author id, title, or body" do
    post = Post.new(author_id: 1, title: "Lorem Ipsum", body: "Don't accept post without an author!" )

    post.title = nil
    assert_not post.save, "Saved the article without a title"

    post.title = "Lorem Ipsum"
    post.author_id = nil
    assert_not post.save, "Saved the article without an author id"

    post.author_id = 1
    post.body = nil
    assert_not post.save, "Saved the article without a body"
  end
end
