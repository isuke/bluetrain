# frozen_string_literal: true

require 'json'

module Api::Views::Projects
  class Index
    include Api::View

    def render
      # TODO: temporary solution
      json = projects.map do |project|
        {
          id:   project.id,
          name: project.name,
        }
      end.to_json
      raw json
    end
  end
end
