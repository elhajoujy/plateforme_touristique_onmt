import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plateforme_touristique_onmt/controllers/region_controller.dart';
import 'package:plateforme_touristique_onmt/models/region.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout() async {
    Get.offAllNamed('login');
  }

  RegionPage? regionPage;
  bool isLoaded = false;

  loadRegions() async {
    final RegionController regionController = RegionController();
    regionPage = await regionController.getListRegion();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadRegions();
  }

  @override
  Widget build(BuildContext context) {
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
            isLoaded
                ? Expanded(
                    child: ListView.builder(
                      itemCount: regionPage!.content.length,
                      itemBuilder: (context, index) {
                        final Content content = regionPage!.content[index];
                        return MainCard(
                          name: content.name,
                          description: content.description,
                          area: content.area,
                          gdp: content.gdp,
                          population: content.population,
                          imageUrl: content.imageUrl,
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.area,
      required this.gdp,
      required this.population,
      required this.imageUrl})
      : super(key: key);

  final String name;
  final String description;
  final String area;
  final String gdp;
  final String population;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseImage(imageUrl: imageUrl),
          Padding(
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
        ],
      ),
    );
  }
}

class BaseImage extends StatelessWidget {
  const BaseImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: double.infinity, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return CircularProgressIndicator(
            backgroundColor: Colors.white70,
            value: bytesLoaded / totalBytes,
            color: Colors.blue[900],
            strokeWidth: 5.0,
          );
        } else {
          return child;
        }
      },
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('😢');
      },
    );
  }
}
