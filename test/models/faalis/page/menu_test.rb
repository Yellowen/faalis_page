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

      assert_equal 4, result.count, msg: msg
    end

    describe 'nodes' do

      before do
        @json_data = [
          { title: 'Home', url: '/home', icon: 'fa fa-home' },
          { title: 'Users',
            icon: 'fa fa-user',
            members_only: true,
            children: [
              { title: 'sign out', url: '/logout' },
              { title: 'Dashboard', model: 'Faalis::Page::Page', url: '/dashboard' }
            ]
          },
          { title: 'Pages', children: [
            { title: 'page-1', url: '/pages/page-1' }
          ]},
        ]
      end

      test 'fail with argument error if title was not exists' do
        subject = Fabricate(:menu, title: 'main menu', data: [{}])

        failed = false

        begin
          subject.nodes
        rescue Exception => e
          assert_equal ArgumentError, e.class
          failed = true
        end

        assert_equal failed, true
      end

      test 'returns a iterable nested structure of Menus and Items' do
        subject = Fabricate(:menu, title: 'main menu', data: @json_data.to_json)
        titles = ['Home', 'Users', 'Pages']

        subject.nodes.each do |root_node|
          msg = "'#{root_node.title}' is not in #{titles}."
          assert titles.include?(root_node.title), msg: msg
        end
      end
    end
  end
end
