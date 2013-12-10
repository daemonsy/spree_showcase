module Spree
  module Admin
    class SlidesController < ResourceController
      respond_to :html

      # Copied over from the Spree Core.
      def update_positions
        slider_params[:positions].each do |id, index|
          Slide.where(id: id).update_all(position: index)
        end

        respond_to do |format|
          format.js  { render :text => 'Ok' }
        end
      end

      def index
        @slides = Slide.all # There is a default_scope order(:position) in effect.
      end

      private

      def slider_params
        params.require(:slide).permit(:name, :body, :target_url, :published, :image, :thumbnail_message)
      end

    end
  end
end