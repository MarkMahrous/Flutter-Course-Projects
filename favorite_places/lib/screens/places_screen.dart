import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/favorite_places_provider.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Place> favoritePlaces = ref.watch(favoritePlacesProvider);

    Widget content = const Center(
      child: Text('No places yet!'),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaceDetailsScreen(
                  place: favoritePlaces[index],
                ),
              ),
            ),
            child: ListTile(
              title: Text(favoritePlaces[index].name),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPlaceScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: content,
    );
  }
}
