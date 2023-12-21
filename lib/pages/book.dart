import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BusReservationScreen extends StatelessWidget {
  const BusReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Seat Reservation',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 38)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side (Minimap)
            const SeatGrid(),
            const SizedBox(
                width:
                    16.0), // Add spacing between minimap and passenger details
            // Right side (Passenger Details)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Passenger Information',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      PassengerInformationForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatGrid extends StatefulWidget {
  const SeatGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SeatGridState createState() => _SeatGridState();
}

class _SeatGridState extends State<SeatGrid> {
  List<bool> selectedSeats =
      List.generate(56, (index) => false); // 56 seats in the bus

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GridView.builder(
        itemCount: 56, // 56 seats in the bus
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 8 seats per row
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          // Seats layout: 2 on left, 2 on right, space in the middle, and 4 at the end

          int row = index ~/ 8;
          int seatNumber = (row * 8) + 1 + (index % 8);

          return ElevatedButton(
            onPressed: () {
              setState(() {
                selectedSeats[index] = !selectedSeats[index];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  selectedSeats[index] ? Colors.blue : Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              seatNumber.toString(),
              style: TextStyle(
                color: selectedSeats[index] ? Colors.white : Colors.black,
                fontSize: 9.0,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PassengerInformationForm extends StatelessWidget {
  const PassengerInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Surname',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Date of Birth DD/MM/YYYY',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Government ID number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Phone',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            _selectDate(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[100],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      // Do something with the selected date
      if (kDebugMode) {
        print('Selected trip date: ${picked.toLocal()}');
      }
    }
  }
}
