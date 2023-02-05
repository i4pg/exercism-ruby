require 'ostruct'

class BoutiqueInventory
  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
  end

  def item_names
    @items.map(&:name)
  end

  def cheap
    @items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    @items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    @items.select { |item| item[:name] == name }.first[:quantity_by_size]
  end

  def total_stock
    @items.map { |item| item[:quantity_by_size].values }.flatten.sum
  end

  private

  attr_reader :items
end
