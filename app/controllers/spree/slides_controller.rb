module Spree
  class SlidesController < Spree::HomeController
    def slides_test
      @slides = Slide.all # FIXME => This is purely for testing. To be removed by first commit.
    end
  end
end