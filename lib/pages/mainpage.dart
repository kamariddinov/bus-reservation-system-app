import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:os/pages/book.dart';
import 'package:os/pages/bookedbus.dart';
import 'package:os/pages/account.dart';
import 'package:os/pages/welcome.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          _getAppBarTitle(_currentIndex),
          style: const TextStyle(
              fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: _buildTabContent(_currentIndex),
      ),
      drawer: _buildSideDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.indigo[100],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
            ),
            label: 'Bus Destinations',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
            ),
            label: 'Booked Buses',
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        // Bus Destinations Tab
        return const BusDestinationsTabContent();
      case 1:
        // Booked Buses Tab
        return const BookedBusesScreen();
      default:
        return Container(); // Placeholder for an unknown index
    }
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Bus Destinations';
      case 1:
        return 'Booked Buses';
      default:
        return '';
    }
  }

  Widget _buildSideDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 85,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'Bus Reservation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Account'),
            onTap: () {
              _account(context);
              // You can navigate to the home page or perform any other action
            },
          ),
          ListTile(
            title: const Text('Share'),
            onTap: () {
              Navigator.pop(context);
              // You can navigate to the about page or perform any other action
            },
          ),
          ListTile(
            title: const Text('Rate'),
            onTap: () {
              Navigator.pop(context);
              // You can navigate to the about page or perform any other action
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              _logout(context);
            },
          ),
        ],
      ),
    );
  }
}

class BusDestinationsTabContent extends StatelessWidget {
  const BusDestinationsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Samarkand',
            price: '23',
            departureTime: '14:00',
            arrivalTime: '18:30',
            travelTime: '4h 30m',
            numberOfSeats: '40',
          ),
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Bukhara',
            price: '29',
            departureTime: '11:00',
            arrivalTime: '19:35',
            travelTime: '8h 35m',
            numberOfSeats: '40',
          ),
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Qarshi',
            price: '19',
            departureTime: '09:00',
            arrivalTime: '12:41',
            travelTime: '3h 41m',
            numberOfSeats: '40',
          ),
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Ferghana',
            price: '43',
            departureTime: '08:00',
            arrivalTime: '13:15',
            travelTime: '5h 15m',
            numberOfSeats: '40',
          ),
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Andijan',
            price: '22',
            departureTime: '19:45',
            arrivalTime: '23:10',
            travelTime: '3h 25m',
            numberOfSeats: '40',
          ),
          BusDestinationCard(
            city: 'Tashkent',
            destination: 'Namangan',
            price: '19',
            departureTime: '12:00',
            arrivalTime: '14:57',
            travelTime: '2h 57m',
            numberOfSeats: '40',
          ),
        ],
      ),
    );
  }
}

class BusDestinationCard extends StatelessWidget {
  final String city;
  final String destination;
  final String price;
  final String departureTime;
  final String arrivalTime;
  final String travelTime;
  final String numberOfSeats;

  const BusDestinationCard({
    super.key,
    required this.city,
    required this.destination,
    required this.price,
    required this.departureTime,
    required this.arrivalTime,
    required this.travelTime,
    required this.numberOfSeats,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the card press action
        if (kDebugMode) {
          print('Card pressed: From $city to $destination');
        }
        _navigateToBusReservationScreen(context);
      },
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From $city to $destination',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.attach_money, color: Colors.blue),
                      const SizedBox(width: 4.0),
                      Text('\$$price',
                          style: const TextStyle(color: Colors.blue)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.green),
                      const SizedBox(width: 4.0),
                      Text('Travel Time: $travelTime',
                          style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.orange),
                      const SizedBox(width: 4.0),
                      Text('Departure: $departureTime',
                          style: const TextStyle(color: Colors.orange)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.red),
                      const SizedBox(width: 4.0),
                      Text('Arrival: $arrivalTime',
                          style: const TextStyle(color: Colors.red)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.event_seat, color: Colors.purple),
                      const SizedBox(width: 4.0),
                      Text('Seats: $numberOfSeats',
                          style: const TextStyle(color: Colors.purple)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToBusReservationScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BusReservationScreen(),
      ),
    );
  }
}

void _logout(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const WelcomePage()),
    (Route<dynamic> route) => false,
  );
}

void _account(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const AccountScreen()),
    (Route<dynamic> route) => false,
  );
}
