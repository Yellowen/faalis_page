module Faalis
  class Page < Faalis::ORM.proper_base_class

    include Faalis::Concerns::Authorizable

    if Faalis::ORM.mongoid?
      include Mongoid::Document
      include Mongoid::Timestamps

      field :title
      field :layout
      field :tags
      field :description
      field :permalink
      field :publish, type: Boolean, default: false
      field :raw_content
    end
  end
end
