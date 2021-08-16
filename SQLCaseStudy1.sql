SELECT * FROM recipes.recipe_main;
#Dalgona Coffee
INSERT INTO recipes.recipe_main
VALUES (3, 'Dalgona Coffee', 3, 'Whipped Coffee', 5, 0, 1, 1, 'Add all the coffee, sugar and boiling water in a bowl (you can easily double or triple this recipe). 
Using a hand mixer or stand mixer and whip on one of the higher speeds. Whip the entire mixture for about 2 minutes. 
Scrape down the sides and whip any bits that didnt get whipped.
Taste and add more sugar IF desired. Remember it will be diluted with the milk!
Add the coffee to a tall glass of your favourite milk. 
If iced, add a few ice cubes, then the milk, then spoon the whipped coffee on top. If using hot, just add it to the glass.
Using your spoon or straw, stir vigorously to swirl it into your milk.');

INSERT INTO recipes.categories
VALUES (3, 'Coffee');

INSERT INTO recipes.ingredients
VALUES (20,'coffee, instant'),(21,'Sugar, granulated'),(22,'water, boiling'),(23,'Cinnamon'),(24,'Milk');

INSERT INTO recipes.rec_ingredients
VALUES (17,3,2,20),(18,3,2,21),(19,3,2,22),(20,3,0.5,23),(21,3,1,24);

#Japanese Whisky Ginger Highball
INSERT INTO recipes.recipe_main
VALUES(4,'Japanese Whisky Ginger Highball',4,'Cocktail',5,0,1,1,'Fill a highball glass with ice. 
Gently pour the ginger beer into the glass. Add soda to about two fingers below the rim of the glass.
Add the whisky and bitters and stir using a bar spoon.
Taste an add more soda if necessary.
Garnish with a slice of blood orange (if using). Serve immediately.');

INSERT INTO recipes.categories
VALUES (4, 'Cocktails');

INSERT INTO recipes.ingredients
VALUES (25,'Whisky, Toki Suntory'),(26,'Beer, ginger'),(27,'Water, soda'),(28,'Bitters, angostura'),(29,'Orange, blood');

INSERT INTO recipes.rec_ingredients
VALUES (22,4,1,25),(23,4,3.5,26),(24,4,1,27),(25,4,1,28),(26,4,1,29);

SELECT *
FROM recipe_main AS a
JOIN rec_ingredients AS b
ON a.recipe_id = b.recipe_id
JOIN ingredients AS c
ON b.ingredient_id = c.ingredient_id
JOIN categories as d
ON a.category_id = d.category_id
WHERE a.recipe_id = 3 or a.recipe_id = 4;

SELECT recipe_main.rec_title, categories.category_name, ingredients.ingred_name, rec_ingredients.amount
FROM recipe_main, categories, ingredients, rec_ingredients; 

#orderby descending category name
SELECT recipe_main.rec_title, categories.category_name, ingredients.ingred_name, rec_ingredients.amount
FROM recipe_main, categories, ingredients, rec_ingredients
ORDER BY category_name DESC; 

#orderby ascending rec_title
SELECT recipe_main.rec_title, categories.category_name, ingredients.ingred_name, rec_ingredients.amount
FROM recipe_main, categories, ingredients, rec_ingredients
ORDER BY rec_title ASC; 

#orderby ingred_name descending
SELECT recipe_main.rec_title, categories.category_name, ingredients.ingred_name, rec_ingredients.amount
FROM recipe_main, categories, ingredients, rec_ingredients
ORDER BY ingred_name DESC; 

