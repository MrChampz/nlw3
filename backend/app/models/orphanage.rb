class Orphanage < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many_attached :images

  validates_presence_of :name, message: "deve ser preenchido"
  validates_presence_of :latitude, message: "deve ser preenchido"
  validates_presence_of :longitude, message: "deve ser preenchido"
  validates_presence_of :about, message: "deve ser preenchido"
  validates_length_of :about, maximum: 300, message: "deve ter tamanho máximo de 300 caracteres"
  validates_presence_of :instructions, message: "deve ser preenchido"
  validates_presence_of :opening_hours, message: "deve ser preenchido"
  validates_inclusion_of :open_on_weekend, in: [true, false], message: "deve ser preenchido"

  def get_images_urls
    urls = []
    self.images.each do |image|
      urls.push(url_for(image))
    end
    return urls
  end
end
