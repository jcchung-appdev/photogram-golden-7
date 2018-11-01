class PicturesController < ApplicationController
    def index
        @photo_list = Photo.all
        render("pic_templates/all_photos.html.erb")
    end
    
    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def create_photo
        p = Photo.new
        p.source = params.fetch('the_source')
        p.caption = params.fetch('the_caption')
        p.save
        
        @count = Photo.count
        
        #render("pic_templates/create_photo.html.erb")
        redirect_to("/photos")
    end
    
    def show_details
        @photo = Photo.find(params.fetch('id'))
        
        diff_min = ((Time.now - @photo.created_at) / 60.0).round
        diff_hr = (diff_min / 60.0).round
        diff_day = (diff_hr / 24.0).round
        diff_mth = (Time.now.month - @photo.created_at.month) + 12 * (Time.now.year - @photo.created_at.year)
        
        case 
        when diff_min <= 1
            @time = "Less than 1 minute"
        when diff_hr < 1
            @time = diff_min.to_s + " minutes"
        when diff_day < 1
            @time = diff_hr.to_s + " hours"
        when diff_mth < 1
            @time = diff_day.to_s + " days"
        else 
            @time = "More than 1 month"
        end
        
        
        render("pic_templates/show_details.html.erb")
    end
    
    def edit_form
        @photo = Photo.find(params.fetch('id'))
        render("pic_templates/edit_form.html.erb")
    end 
    
    def update_photo
        @p = Photo.find(params.fetch('id'))
        @p.source = params.fetch('the_source')
        @p.caption = params.fetch('the_caption')
        @p.save
        
        redirect_to("/photos/" + @p.id.to_s)
        #render("pic_templates/update_photo.html.erb")
    end
    
    def delete_photo
        Photo.find(params.fetch('id')).destroy
        @count = Photo.count
        #render("pic_templates/delete_photo.html.erb")
        redirect_to("/photos")
    end
end