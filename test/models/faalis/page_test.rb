require 'test_helper'

module Faalis::Page
  class PageTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Page::Page

    test "saves with a title" do
      page = @@subject.new(title: 'example')

      assert page.save, "Can't save page due to: #{page.errors.to_json}"
    end

    test "won't save without a title" do
      page = @@subject.new()

      assert_not page.save, "Page saved. It shouldn't without a title"
      assert_equal page.errors.keys[0], :title
    end

    test "renders the raw content as markdown and store it in content" do
      page = @@subject.create(title: "example", raw_content: '# Example')
      msg  = "Rendered content is not the same as raw_content"

      content = "<h1>Example</h1>\n"
      result  = page.content

      assert_equal result, content, msg: msg
    end

    test "`published` scope should returns only published pages" do
      1.upto(4) do
        @@subject.create(title: "example", published: true)
      end
      @@subject.create(title: "example")
      msg = "It seems that `published` scope returns all objects"

      result = @@subject.published

      assert_equal result.count, 4, msg: msg
    end

    test "with `members_only` it would be visible to signed in users only" do

      page = @subject.create(title: 'ex2', members_only: true, published: true)

      result = page.can_view?(user)
    end
  end
end
