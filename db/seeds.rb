# db/seeds.rb

House.create!(
  price: 150000,
  house_type: 'one_bedroom',
  house_number: 'G1',
  floor: 'ground',
  image_url_1: 'house1_image1.jpg',
  image_url_2: 'house1_image2.jpg',
  image_url_3: 'house1_image3.jpg',
  image_url_4: 'house1_image4.jpg',
  image_url_5: 'house1_image5.jpg',
  has_kitchen: true,
  has_bedroom: true,
  has_bathroom: true,
  has_wifi: true,
  is_vacant: false
)

# Repeat the above block for each house

House.create!(
  price: 200000,
  house_type: 'bedsitter',
  house_number: 'A1',
  floor: 'first',
  image_url_1: 'house2_image1.jpg',
  image_url_2: 'house2_image2.jpg',
  image_url_3: 'house2_image3.jpg',
  image_url_4: 'house2_image4.jpg',
  image_url_5: 'house2_image5.jpg',
  has_kitchen: true,
  has_bedroom: true,
  has_bathroom: true,
  has_wifi: true,
  is_vacant: true
)

# Repeat the above block for each house
