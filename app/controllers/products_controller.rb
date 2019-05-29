class ProductsController < ApplicationController
  def index
    @stuffies = StuffedAnimal.all
    @accessories = Accessory.all
  end
end
