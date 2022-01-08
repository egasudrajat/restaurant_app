import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/DetailScreen.dart';

import 'model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurant', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Rekomendation restaurant for family', style: TextStyle(fontSize: 14)),
              SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<String>(
                    future: rootBundle.loadString("assets/local_restaurant.json"),
                    builder: (context, snapshot) {
                      // print(snapshot.data);
                      final Model model = parseRestaurant(snapshot.data);
                      return ListView.builder(
                          itemCount: model.restaurants?.length,
                          itemBuilder: (context, index) {
                            print(index);
                            return _buildArticleItem(context, model.restaurants![index]);
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Restaurants restaurants) {
  return Card(
    color: Color(0xFFF0E7FA),
    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
    elevation: 2,
    child: ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(model: restaurants);
        }));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(

        restaurants.pictureId!,
        width: 100,
      ),
      title: Text(restaurants.name!),
      subtitle: Text(restaurants.city!),
    )
  );
}
