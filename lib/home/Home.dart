import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout() async {
    Get.offAllNamed('login');
  }

  var temp = "0".obs;
  var timeStamp = "0".obs;

  getData() async {
    //TODO:
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // timeStamp = "$formattedDate $formattedTime".obs;

    return Scaffold(
        appBar: AppBar(
          title: const Text("PlateForme Touristique"),
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Régions du Maroc  ",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height / 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Change scrollDirection to horizontal
                  child: Row(
                    // Use Row instead of Column
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainCard(
                        name: "something",
                        description: "description",
                        imageUrl: "",
                        area: "394847371",
                        gdp: "100 Million MAD",
                        population: "1 million",
                      ),
                      MainCard(
                        name: "something",
                        description: "description",
                        imageUrl: "",
                        area: "394847371",
                        gdp: "100 Million MAD",
                        population: "1 million",
                      ),
                      MainCard(
                        name: "something",
                        description: "description",
                        imageUrl: "",
                        area: "394847371",
                        gdp: "100 Million MAD",
                        population: "1 million",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    this.name = "name",
    this.description = "description",
    this.imageUrl = "",
    this.area = "394847371",
    this.gdp = "100 Million MAD",
    this.population = "1 million",
  }) : super(key: key);

  final String name;
  final String description;
  final String imageUrl;
  final String area;
  final String gdp;
  final String population;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'GDP: $gdp',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Population: $population',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Area: $area',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
