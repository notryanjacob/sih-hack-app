import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Ryan',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "It's a sunny day!",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.location_on),
                    label: Text('Rajkot'),
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2.5,
                children: [
                  _buildWeatherTile(Icons.thermostat, '62° F', 'Temperature'),
                  _buildWeatherTile(Icons.water_drop, '61%', 'Humidity'),
                  _buildWeatherTile(Icons.umbrella, '0.0mm', 'Rainfall'),
                  _buildWeatherTile(Icons.air, '3.9m/s', 'WindSpeed'),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.bug_report),
                      Text('Diagnose issues with crops'),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Gallery',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildGalleryItem(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wAjAO298t11xOtnEF7oKEq7MW8tolPasOQ&s'),
                    _buildGalleryItem(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwvB8-k0qCnXvO6DpypsnEspImRvWeGcojnA&s'),
                    _buildGalleryItem(
                        'https://www.foodrepublic.com/img/gallery/15-types-of-grapes-to-know-eat-and-drink/l-intro-1684769284.jpg'),
                    _buildGalleryItem(
                        'https://cdn.britannica.com/16/187216-131-FB186228/tomatoes-tomato-plant-Fruit-vegetable.jpg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trending Diseases',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Card(
                child: ListTile(
                  // leading: Image.asset('assets/mole_cricket.jpg'),
                  leading: Image(
                    image: NetworkImage(
                        'https://www.planetnatural.com/wp-content/uploads/2012/12/potato-blight.jpg'),
                  ),
                  title: const Text('African Mole Cricket'),
                  subtitle: const Text('Insect'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Best Crop to plant',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherTile(IconData icon, String value, String label) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          // image: AssetImage(imagePath),
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
