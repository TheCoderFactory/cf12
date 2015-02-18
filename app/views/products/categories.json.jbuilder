# json.artists @artists do |artist|
#   json.(artist, :id, :name, :label)

#   json.albums artist.albums do |album|
#     json.(album, :id, :name)
#   end
# end

json.products @products do |product|
	json.(product, :name, :short_description, :product_category_id)

	json.variants product.variants.order(start_date: :asc) do |variant|
		json.(variant, :location_id, :start_date, :end_date)
	end
end



# , :level




# [{
#     title           : 'Web Design',
#     info            : "Get creative with web design. Learn how to make beautiful websites. This short course form gives you a fast paced but enjoyable taste of web design. You'll learn the words the kids are using like UX, UI, Development. Anyone can do it!",
#     level           : 'Beginner',
#     type            : 'workshop',
#     location        : ['Melbourne', 'Brisbane', 'Sydney'],
#     nextClass       : {
#                         'Melbourne': '17 - 18th Feb (Weekend)',
#                         'Brisbane' : '19 - 20 Mar (Weekend)',
#                         'Sydney'   : '15 - 16 Apr (Weekend)'
#                       },
#     followingClass  : {
#                         'Melbourne': '28 - 29th Feb (Weekend)',
#                         'Brisbane' : '22 - 23 Mar (Weekend)',
#                         'Sydney'   : '21 - 22 Apr (Weekend)'
#                       },
#     tags   : ['how to code'],
#     skills : [{
#       name : 'Visual Design',
#       img  : 'icon-brush'
#     }, {
#       name : 'Design Fundamentals',
#       img  : 'icon-type'
#     }, {
#       name : 'User Experience',
#       img  : 'icon-flow-chart'
#     }, {
#       name : 'Front End Design',
#       img  : 'icon-html-code'
#     }]
# }]