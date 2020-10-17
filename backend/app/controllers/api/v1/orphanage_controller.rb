module Api::V1
  class OrphanageController < ApiController
    
    def index
      render json: Orphanage.all
    end

    def show
      render json: Orphanage.find(params[:id])
    end

    def create
      orphanage = Orphanage.new(orphanage_params)
      if orphanage.save
        orphanage.images.attach(images_param)
        render json: orphanage, status: :created
      else
        render json: { errors: orphanage.errors.full_messages },
          status: :bad_request 
      end
    end

    def update
      orphanage = Orphanage.find(params[:id])
      if orphanage.update(orphanage_params)
        orphanage.images.attach(images_param)
        render json: orphanage, status: :accepted
      else
        render json: { errors: orphanage.errors.full_messages },
          status: :bad_request 
      end
    end

    def destroy
      orphanage = Orphanage.find(params[:id])
      if orphanage.destroy
        render json: orphanage, status: :accepted
      else
        render json: { errors: orphanage.errors.full_messages },
          status: :bad_request
      end
    end

    private

    def orphanage_params
      params.permit(
        :name,
        :latitude,
        :longitude,
        :about,
        :instructions,
        :opening_hours,
        :open_on_weekend
      )
    end

    def images_param
      imgs = []
      params[:images].values.each do |img|
        imgs.push(img)
      end
      return imgs
    end

  end
end