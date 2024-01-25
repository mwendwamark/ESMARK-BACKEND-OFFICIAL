class HouseSerializer < ActiveModel::Serializer
  attributes :id, :house_type, :price, :floor, :image_url_1, :image_url_2, :image_url_3, :image_url_4, :image_url_5, :has_kitchen, :has_bedroom, :has_bathroom, :has_wifi, :is_vacant
end
