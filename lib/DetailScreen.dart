import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant_app/model.dart';

class DetailScreen extends StatelessWidget {
  final Restaurants model;

  DetailScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DetailMobilePage(model: model);
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Restaurants model;

  DetailMobilePage({required this.model});

  var infoTextStyle = TextStyle(fontFamily: 'Oxygen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.network(model.pictureId!),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          FavoriteButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  model.name!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.apartment, color: Colors.blue),
                        SizedBox(height: 8.0),
                        Text(
                          model.city!,
                          style: infoTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star_half_sharp, color: Colors.yellow),
                        SizedBox(height: 8.0),
                        Text(
                          model.rating!.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  model.description!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: model.menus!.foods!.map((food) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(model.pictureId!),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

        ));
  }
}

Widget _buildFoods(BuildContext context, Foods food) {
  return Card(
      color: Color(0xFFF0E7FA),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      elevation: 2,
      child: Stack(
        children: [Container(width: 80, height: 80, child: Text("hfhf")), Text(food.name!)],
      ));
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
