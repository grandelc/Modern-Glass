ActiveAdmin.register Page do
  form do |f|                         
    f.inputs "Details" do  
      f.input :title   
      f.input :content, :as => :ckeditor   
    end                               
    f.actions                         
  end 
end
