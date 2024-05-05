# frozen_string_literal: true

class PlayerBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :username
    end

end
