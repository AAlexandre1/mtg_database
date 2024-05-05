class CardsController < ApplicationController
    before_action :set_card, only:[:show, :update, :destroy]

    def index
        cards = Card.all
        render json: CardBlueprinter.render(cards, view: :normal)
    end

    def show
        if @card 
            # render json: CardBlueprinter.render(@card, view: :extended), status: :ok
            render json: @card, status: :ok
        else
            render json:{message: 'Card not found.'}, status: :not_found
        end
    end

    def create
        card = Card.new(card_params)
        if card.save
            render json: CardBlueprinter.render(card, view: :extended), status: :created
        else
            render json: card.errors, status: :unprocessable_entity
        end
    end

    def update
        if @card.update(card_params)
            render json: CardBlueprinter.render(@card, view: :extended), status: :ok
        else
            render json: @card.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @card.destroy
            head :no_content
        else
            render json: @card.errors, status: :unprocessable_entity
        end
    end


    private

    def card_params
        params.require(:card).permit(:name, :set, :power, :toughness, :description, :type_ids => [])
    end

    def set_card
        @card = Card.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { message: 'Card not found.' }, status: :not_found
    end
end
