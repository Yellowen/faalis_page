json.array! @pages do |page|
  json.id page.id.to_s
  json.extract! page, :title, :layout, :description, :tags, :raw_content
end
