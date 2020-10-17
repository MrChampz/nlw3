class OrphanageSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :about, :instructions,
             :opening_hours, :open_on_weekend, :images
  
  def images
    return object.get_images_urls
  end
end
