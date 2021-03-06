module Grids
  class Engine < ::Rails::Engine
    isolate_namespace Grids

    include OpenProject::Plugins::ActsAsOpEngine

    config.to_prepare do
      query = Grids::Query

      Queries::Register.filter query, Grids::Filters::ScopeFilter
    end

    config.to_prepare do
      Grids::MyPageGridRegistration.register!
    end
  end
end
