json.id @page.id.to_s
json.extract! @page, :title, :layout, :description, :tags, :permalink, :publish, :raw_content

