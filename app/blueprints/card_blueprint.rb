# frozen_string_literal: true

class CardBlueprint < Blueprinter::Base

    identifier :id

    view :normal do
        fields :id, :name
    end
    view :extended do
        fields :id, :name, :set, :toughness, :power, :description
    end

end
