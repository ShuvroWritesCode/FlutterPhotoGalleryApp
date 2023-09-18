import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
List<String> imageUrls = [
  'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNhdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1490650034439-fd184c3c86a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0JTIwc3F1YXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1557246565-8a3d3ab5d7f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhdHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1568043210943-0e8aac4b9734?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNhdHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
  'https://plus.unsplash.com/premium_photo-1666612335748-d23dcba788e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGNhdHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1559235038-1b0fadf76f78?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNhdHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search for Photos...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Image $index Clicked'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          imageUrls[index],
                          width: 95,
                          height: 95,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8.0),
                        Text('Photo $index'),
                      ],
                    ),
                  ),
                );
              },
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNhdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                radius: 25,
              ),
              title: Text('Sample Photo 1'),
              subtitle: Text('Description for Photo 1'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1490650034439-fd184c3c86a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2F0JTIwc3F1YXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60'),
                radius: 25,
              ),
              title: Text('Sample Photo 2'),
              subtitle: Text('Description for Photo 2'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1557246565-8a3d3ab5d7f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhdHN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60'),
                radius: 25,
              ),
              title: Text('Sample Photo 3'),
              subtitle: Text('Description for Photo 3'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(side: BorderSide(color: Colors.blue, width: 2.0)),
                padding: const EdgeInsets.all(15.0),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: const Icon(
                Icons.upload,
                size: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
