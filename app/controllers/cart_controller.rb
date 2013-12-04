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

    redirect_to checkout_path
  end 

  def checkout
    @provinces = Province.all
  end

  def confirmation
    session[:cust_info] = nil
    session[:cust_info] = []

    if params[:first_name].empty? || params[:last_name].empty?
      redirect_to checkout_path
      flash[:error] = "Must enter first and last name."
    else 
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
  end 

  def create
    order_total = 0
    quantity = 1

    first_name  = session[:cust_info][0]
    last_name   = session[:cust_info][1]
    address     = session[:cust_info][2]
    city        = session[:cust_info][3]
    province    = session[:cust_info][4]
    postal_code = session[:cust_info][5]
    email       = session[:cust_info][6]

    new_customer = Customer.new(:first_name  => first_name,
                                :last_name   => last_name,
                                :addres      => address,
                                :city        => city,
                                :province_id => province,
                                :postal_code => postal_code,
                                :email       => email)

    new_customer.province_id = province.first
    new_customer.save

    new_order = Order.new
    new_order.customer = new_customer
    new_order.gst_rate = new_customer.province.gst unless new_customer.province.gst.nil?
    new_order.pst_rate = new_customer.province.pst unless new_customer.province.pst.nil?
    new_order.hst_rate = new_customer.province.hst unless new_customer.province.hst.nil?

    @cart_prod.each do |product|

      if(product.sale_price) then
        new_item = LineItem.new(:quantity => quantity,
                                :price    => product.sale_price)

        order_total += product.sale_price

       else 
        new_item = LineItem.new(:quantity => quantity,
                                :price    => product.price)

        order_total += product.price
      end

      new_item.product = product
      new_item.save
    end

    order_total += order_total * new_customer.province.gst unless new_customer.province.gst.nil?
    order_total += order_total * new_customer.province.pst unless new_customer.province.pst.nil?
    order_total += order_total * new_customer.province.hst unless new_customer.province.hst.nil?

    new_order.order_total = order_total
    new_order.order_status = "Pending"
    new_order.save

    session[:cust_info] = nil
    session[:cart] = nil

    flash[:order_complete] = "Order has been submitted."

    redirect_to products_path
  end 
end
