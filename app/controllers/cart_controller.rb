class CartController < ApplicationController
  def index
    
  end

  def add_to_cart
    flash[:success] = "Successfully added in the cart."

    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    session[:cart_count] += 1

    redirect_to products_path
  end 

  def remove_from_cart
    flash[:remove] = "Successfully removed item from the cart."

    id = params[:id].to_i
    session[:cart].delete(id) 
    session[:cart_count] -= 1

    redirect_to products_path
  end 

  def empty_cart
    flash[:empty] = "Cart is now empty"
    session[:cart] = nil
    session[:cart_count] = nil

    redirect_to products_path
  end 
end
