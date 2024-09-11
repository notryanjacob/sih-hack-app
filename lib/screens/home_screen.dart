import 'package:agrihealth/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Green container for the top 25% of the screen
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            color: Color.fromARGB(255, 1, 170, 99),
          ),
          // Scrollable content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Existing content
                  Padding(
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
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "It's a sunny day!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.location_on),
                              label: Text('Rajkot'),
                              style: ElevatedButton.styleFrom(
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
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 2.5,
                          children: [
                            _buildWeatherTile(
                                Icons.thermostat, '31° C', 'Temperature'),
                            _buildWeatherTile(
                                Icons.water_drop, '61%', 'Humidity'),
                            _buildWeatherTile(
                                Icons.umbrella, '0.0mm', 'Rainfall'),
                            _buildWeatherTile(Icons.air, '3.9m/s', 'WindSpeed'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 170, 99),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChatScreen())),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.bug_report, color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      'Diagnose issues with crops',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_forward_ios,
                                        color: Colors.white),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Image(
                                        image: AssetImage('assets/cattle.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Image(
                                        image: AssetImage('assets/crop.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                  'data:image/jpeg;base64,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'),
                              _buildGalleryItem(
                                  'data:image/jpeg;base64,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'),
                              _buildGalleryItem(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wAjAO298t11xOtnEF7oKEq7MW8tolPasOQ&s'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Trending Diseases',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Card(
                          child: ListTile(
                            leading: Image(
                              image: NetworkImage(
                                  'https://www.planetnatural.com/wp-content/uploads/2012/12/potato-blight.jpg'),
                            ),
                            title: Text('Crop Blight'),
                            subtitle: Text('Fungus'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Best Crop to plant',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
