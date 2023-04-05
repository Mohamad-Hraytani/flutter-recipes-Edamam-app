# Flutter Recipe

Simple food recipe application that fetches food recipes using [Edamam API](https://developer.edamam.com/).

## Overview:

Ths project has several features:
- `HomeScreen` contains special dishes fetched from the API in a `staggered_grid_view` manner.
- `filtersScreen` Allows  users to filter based on specific values.
- `DetailsScreen` All details of the recipe appear.
- `SqlFavorite` Allows users to save their meals in a local database.
- `SearchScreen` Allows users to search for new recipes by  ingredients or recipe names.
- `button_in_HomeScreen` A button that allows to choose a random recipe.
- `button_in_HomeScreen` A button that allows users to share a recipe with their       
                         friends via email or social media.


_Note: I need the id to store the recipes in the database and I couldn't get the id of 
       the recipes from the api for some reason
       So I generated an id for each element to be added and processed the proces

_Note: This project is made using Edamam API, to know more click [here](https://developer.edamam.com/)_


 
 ## Dependency used:
 
- [http](https://pub.dev/packages/http)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)
- [provider](https://pub.dev/packages/provider)
- [sqflite](https://pub.dev/packages/sqflite)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [share_plus](https://pub.dev/packages/share_plus)





## Flutter

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



