# desc "Explaining what the task does"
# task :faalis_page do
#   # Task goes here
# end

LISTVIEW = 'faalis:js:list_view lib/scaffolds/'

namespace :build do

  desc 'Create the page resource'
  task :page => :environment do
    system "#{LISTVIEW}page.json"
  end
end
