class AdminGalleryController < ApplicationController
  
  before_filter :authenticate_section, :set_segment
  before_filter :find_album, :except => [:new_album, :save_photo, :remove_photo, :edit_photo]
  layout :determine_layout

	def new_album
		@album = Album.new
		@album.union_id = @union.id
	end

	def save_album		
		unless @album.nil?
			@album.update_attributes params[:album]
			redirect_to_index "Album uspešno shranjen."
		else
			@album = Album.create params[:album]
			redirect_to_index "Album je bil uspešno kreiran."
		end
	end

	def delete_album
		unless @album.nil?
			@album.photos.each { |p| p.destroy }
			if @album.destroy
				redirect_to_index 'Album uspešno izbrisan!'
			else
				redirect_to_index 'Pri brisanju albuma je prišlo do napake!'
			end
		end
	end
	
	def insert_photo
		@photo = Photo.new params[:photo]
		@album.photos << @photo unless @album.nil? or @photo.filename.blank?
		
		if @album.save and @photo.save
			redirect_to_album @album.id, "Fotografija dodana v album #{@album.title}!"
		else
			flash[:notice] = 'Pri dodajanju fotografije je prišlo do napake!'
			render :template => 'shared/gallery/add_photo'
		end
	end
	
	def save_photo
	  @photo = Photo.find params[:id] if params[:id]
		
		unless @photo.nil?
		  @photo.update_attributes params[:photo]
		  redirect_to_album @photo.album_id, "Fotografija uspešno shranjena."
		end
	end
	
	def remove_photo
		unless params[:id].nil? or params[:album_id].nil?
			@photo = Photo.find params[:id]
			if @photo.album.id == params[:album_id].to_i
				if @photo.destroy
					flash[:notice] = 'Fotografija uspešno izbrisana!'
				else
					flash[:notice] = 'Pri brisanju je prišlo do napake!'
				end
			end
		end
		
		redirect_to :action => 'edit_photos', :id => params[:album_id]
	end
	
	def edit_photo
		@photo = Photo.find params[:id]
	end
	
	
	

	protected
	
	def redirect_to_album(album_id, notice = nil)
		flash[:notice] = notice
		redirect_to :action => 'edit_photos', :id => album_id
	end
	
	def redirect_to_index(msg)
	  flash[:notice] = msg
	  redirect_to normal_link('gallery')
	end
	
	def find_album
	  id = (params[:id]) ? params[:id] : params[:album_id]
	  return unless id
	  
	 	@album = Album.find_for_union( id, @union.id, :include => :photos)
	end
end