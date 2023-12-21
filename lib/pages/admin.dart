import 'package:flutter/material.dart';
import 'package:os/vars/buses.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Bus> buses = [
    Bus(
        busNumber: 'Departure at 14:00',
        destination: 'Tashkent - Samarkand',
        seatsAvailable: 40),
    Bus(
        busNumber: 'Departure at 11:00',
        destination: 'Tashkent - Bukhara',
        seatsAvailable: 40),
    Bus(
        busNumber: 'Departure at 09:00',
        destination: 'Tashkent - Qarshi',
        seatsAvailable: 40),
    Bus(
        busNumber: 'Departure at 08:00',
        destination: 'Tashkent - Ferghana',
        seatsAvailable: 40),
    Bus(
        busNumber: 'Departure at 19:45',
        destination: 'Tashkent - Andijan',
        seatsAvailable: 40),
    Bus(
        busNumber: 'Departure at 12:00',
        destination: 'Tashkent - Namangan',
        seatsAvailable: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Admin Page',
          style: TextStyle(
              fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                'Bus ${buses[index].busNumber} to ${buses[index].destination}'),
            subtitle: Text('Seats Available: ${buses[index].seatsAvailable}'),
            tileColor: Colors.indigo[100],
            onTap: () {
              _showEditBusDialog(context, buses[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBusDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditBusDialog(BuildContext context, Bus bus) {
    // Implement a dialog to edit bus details
    // You can use a similar approach as the edit dialog in the AccountScreen
    // Update the 'buses' list with the edited bus details
  }

  void _showAddBusDialog(BuildContext context) {
    // Implement a dialog to add a new bus
    // Update the 'buses' list with the new bus
  }
}
