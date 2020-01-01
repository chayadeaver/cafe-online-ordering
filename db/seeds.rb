Category.destroy_all
Item.destroy_all

coffee = Category.create(name: "coffee")
tea = Category.create(name: "tea")
food = Category.create(name: "food")

coffee.items.create(title: "Brewed Coffee", price: 2)
coffee.items.create(title: "Iced Coffee", price: 3.5)
coffee.items.create(title: "Cold Brew", price: 4)

tea.items.create(title: "Hot Brewed Tea", price: 1.75)
tea.items.create(title: "Iced Tea", price: 3)

food.items.create(title: "Croissant", price: 3)
food.items.create(title: "Chocolate Croissant", price: 3.5)
food.items.create(title: "Strawberry Croissant", price: 3.5)
food.items.create(title: "Blueberry Muffin", price: 3)
food.items.create(title: "Blueberry Scone", price: 3)
food.items.create(title: "Cranberry Scone", price: 3)
food.items.create(title: "Cheese Danish", price: 3.5)
food.items.create(title: "Orange Pecan Cinnamon Rolls", price: 4)