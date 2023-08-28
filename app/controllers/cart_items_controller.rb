# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]

  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # SOIT SUPRIMER LES METHODES COMMENTEES
  # SOIT RAJOUTER UPDATE AU BEFORE_ACTION & ROUTES.RB SI ON FAIT LA PARTIE OPTIONNEL
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  # # GET /cart_items/1/edit
  # def edit
  # end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_item_url(@cart_item), notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /cart_items/1 or /cart_items/1.json
  # def update
  #   respond_to do |format|
  #     if @cart_item.update(cart_item_params)
  #       format.html { redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully updated." }
  #       format.json { render :show, status: :ok, location: @cart_item }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @cart_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_item_params
    params.fetch(:cart_item, {})
  end
end
