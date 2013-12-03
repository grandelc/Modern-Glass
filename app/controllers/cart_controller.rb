class CartController < ApplicationController
  def index
    
  end

  def add_to_cart
    flash[:success] = "Successfully added in the cart."

    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)

    redirect_to products_path
  end 

  def remove_from_cart
    flash[:remove] = "Successfully removed item from the cart."

    id = params[:id].to_i
    session[:cart].delete(id) 

    redirect_to products_path
  end 

  def empty_cart
    flash[:empty] = "Cart is now empty"
    session[:cart] = nil
    session[:cart_count] = nil

    redirect_to products_path
  end 

  def checkout
    @provinces = Province.all
  end

  def confirmation
    session[:cust_info] = nil
    session[:cust_info] = []

    @first_name  = params[:first_name]
    @last_name   = params[:last_name]
    @address     = params[:addres]
    @city        = params[:city]
    @province    = Province.where(:id => params[:province])
    @postal_code = params[:postal_code]
    @email       = params[:email]

    session[:cust_info] << @first_name
    session[:cust_info] << @last_name
    session[:cust_info] << @address
    session[:cust_info] << @city
    session[:cust_info] << params[:province]
    session[:cust_info] << @postal_code
    session[:cust_info] << @email
  end 

  def create
    
  end 
end
