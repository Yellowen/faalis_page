Given(/^there is a page named "(.*?)" in database$/) do |name|
  Page.new(:name => name).save!
end

Then(/^there shouldn't be any page$/) do
  Page.all.count.should == 0
end
