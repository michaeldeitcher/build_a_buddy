class RelatedPurchasesController < ApplicationController
  def index
    stuffed_animals_ids = params.keys.select{|k| k.starts_with? 'stuffed_animal_'}.map{|k| k[/\d+/]}
    accessory_ids = params.keys.select{|k| k.starts_with? 'accessory_'}.map{|k| k[/\d+/]}
    @stuffed_animals = StuffedAnimal.find(stuffed_animals_ids)
    @accessories = Accessory.find(accessory_ids)

    @purchase_suggestion = nil
    @stuffed_animals.each do |stuffy|
      @purchase_suggestion = stuffy.purchase_suggestion
      break if @purchase_suggestion
    end

    @accessories.each do |accessory|
      @purchase_suggestion = accessory.purchase_suggestion
      break if @purchase_suggestion
    end
  end
end
