require 'test_helper'

module Faalis::Page
  class MenuTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Page::Menu

    test "saves with a title" do
      subject = Fabricate(:menu, title: 'example')

      assert subject.save, "Can't save page due to: #{subject.errors.to_json}"
    end

    test "won't save without a title" do
      subject = @@subject.new(title: nil)

      assert_not subject.save, "Page saved. It shouldn't without a title"
      assert_equal subject.errors.keys[0], :title
    end

    test "`published` scope should returns only published pages" do
      1.upto(4) do
        Fabricate(:menu, title: "example", published: true)
      end
      Fabricate(:menu, title: "example")
      msg = "It seems that `published` scope returns all objects"

      result = @@subject.published

      assert_equal result.count, 4, msg: msg
    end

  end
end
