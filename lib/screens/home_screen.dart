import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'add_location_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> locations = [];

  void _getCurrentLocation() async {
    Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locations.add({
        'title': 'Lokasi ${locations.length + 1}',
        'lat': pos.latitude,
        'lng': pos.longitude,
      });
    });
  }

  void _deleteLocation(int index) {
    setState(() {
      locations.removeAt(index);
    });
  }

  void _editLocation(int index) {
    TextEditingController ctrl = TextEditingController(text: locations[index]['title']);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Lokasi'),
        content: TextField(controller: ctrl),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                locations[index]['title'] = ctrl.text;
              });
              Navigator.pop(context);
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SafeTrack - Lokasi')),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: Icon(Icons.add_location_alt),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (_, index) {
          var loc = locations[index];
          return ListTile(
            title: Text(loc['title']),
            subtitle: Text('Lat: ${loc['lat']}, Lng: ${loc['lng']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () => _editLocation(index), icon: Icon(Icons.edit)),
                IconButton(onPressed: () => _deleteLocation(index), icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
