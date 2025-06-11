import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/location_note.dart';

class AddLocationScreen extends StatefulWidget {
  final Function(LocationNote) onAdd;

  AddLocationScreen({required this.onAdd});

  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final TextEditingController _titleController = TextEditingController();
  double? latitude;
  double? longitude;

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  void _saveLocation() {
    if (_titleController.text.isNotEmpty && latitude != null && longitude != null) {
      widget.onAdd(LocationNote(
        title: _titleController.text,
        latitude: latitude!,
        longitude: longitude!,
      ));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon isi semua data')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Lokasi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Nama Lokasi'),
            ),
            SizedBox(height: 10),
            latitude != null
                ? Text('Lat: $latitude, Lng: $longitude')
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveLocation,
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
