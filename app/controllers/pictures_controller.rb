class PicturesController < ApplicationController
    def index
        render("pic_templates/all_photos.html.erb")
    end
    
    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def create_photo
        render("pic_templates/create_photo.html.erb")
    end
    
    def show_details
        render("pic_templates/show_details.html.erb")
    end
    
    def edit_form
        render("pic_templates/edit_form.html.erb")
    end 
    
    def update_photo
        render("pic_templates/update_photo.html.erb")
    end
    
    def delete_photo
        render("pic_templates/delete_photo.html.erb")
    end
end