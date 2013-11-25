ActiveAdmin.register Product do
  form do |f|                         
    f.inputs "Details" do  
      f.input :category     
      f.input :model                  
      f.input :description               
      f.input :price
      f.input :stock_quantity
      f.input :ranking
      f.input :brand   
      f.input :color
      f.input :style
      f.input :gender      
      f.input :image, :as => :file
    end                               
    f.actions                         
  end 
end
