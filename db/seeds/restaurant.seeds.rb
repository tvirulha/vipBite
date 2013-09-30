Restaurants.delete_all

Restaurants.create(restaurantName: 'Belgo', address: '501 - 8th Avenue SW', city: 'Calgary', province: 'Alberta', postal: 'T2P1G1',
				imageUrl: '/Image/restaurant/belgo.jpg', email: 'shaun@belgo.ca', phone: '403.265.6555', restaurantPromo: 'belgo_promo', cuisine: 'Fusion')

Restaurants.create(restaurantName: 'test', address: '501 - 8th Avenue SW', city: 'Calgary', province: 'Alberta', postal: 'T2P1G1',
				imageUrl: '/Image/restaurant/belgo.jpg', email: 'shaun@belgo.ca', phone: '403.265.6555', restaurantPromo: 'belgo_promo', cuisine: 'Fusion')

Restaurants.ConvertedAddressToLatLong('Belgo')