As a user
  I want to have a shopping list
  I want to be able to CRUD groceries in that list
  I want to be able to search for groceries
  I want to be able to browse for groceries
  I want my groceries to be automatically purchased and delivered
  I want to differentiate between who is paying for the groceries


```
User
  has_many :items

Item
  product_id
  picture
  quantity: decimal
  purchased: bool

Purchase:
  has_many :items
```
