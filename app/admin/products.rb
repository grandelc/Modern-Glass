ActiveAdmin.register Product do
  form do |f|                         
    f.inputs "Details" do  
      f.input :category   
      f.input :model     
      f.input :name               
      f.input :description               
      f.input :price
      f.input :sale_price
      f.input :stock_quantity
      f.input :ranking
      f.input :image, :as => :file
    end                               
    f.actions                         
  end 
end
