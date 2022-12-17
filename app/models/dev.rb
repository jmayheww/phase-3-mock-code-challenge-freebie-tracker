class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    has_item = freebies.filter { |freebie| freebie.item_name == item_name }

    if has_item.length.positive?
      true
    else
      false
    end
  end

  def give_away(dev:, freebie:)
    if freebie.dev_id == id
      freebie.update(dev_id: dev.id)
    else
      puts 'nah'
    end
  end
end
