# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

MY CHECKLIST

-Make radio button select w/ icons for student signin
-Helpers in views to set permissions
-write out course/:id/materials/:id and course/:id/materials/new
-Flash messages for all routing errors
-Bugfix student assignments list
-add option to select user type when you sign up w/ fb
-User assignment 'mark as viewed' buttons should be displayed conditionally
-Bugfix user assignments hash outputting to screen
