class Faalis::Page::PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
