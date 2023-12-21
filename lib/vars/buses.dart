class Bus {
  String busNumber;
  String destination;
  int seatsAvailable;

  // Constructor
  Bus({
    required this.busNumber,
    required this.destination,
    required this.seatsAvailable,
  });

  // Factory constructor for creating a Bus from a map
  factory Bus.fromMap(Map<String, dynamic> map) {
    return Bus(
      busNumber: map['busNumber'],
      destination: map['destination'],
      seatsAvailable: map['seatsAvailable'],
    );
  }

  // Convert Bus to a map
  Map<String, dynamic> toMap() {
    return {
      'busNumber': busNumber,
      'destination': destination,
      'seatsAvailable': seatsAvailable,
    };
  }

  @override
  String toString() {
    return 'Bus{busNumber: $busNumber, destination: $destination, seatsAvailable: $seatsAvailable}';
  }
}
