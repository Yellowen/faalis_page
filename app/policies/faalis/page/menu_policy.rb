class Faalis::Page::MenuPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
