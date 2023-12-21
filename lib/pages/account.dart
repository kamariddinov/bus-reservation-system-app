import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var busReservationState = context.watch<BusReservationState>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Account Details',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          _buildEditableField(
              context, 'Username', busReservationState.userName),
          _buildEditableField(context, 'Email', busReservationState.userEmail),
          _buildEditableField(context, 'Phone', busReservationState.userPhone),
        ],
      ),
    );
  }

  Widget _buildEditableField(BuildContext context, String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
      trailing: const Icon(Icons.edit),
      onTap: () {
        _showEditDialog(context, label, value);
      },
    );
  }

  void _showEditDialog(BuildContext context, String label, String value) {
    TextEditingController controller = TextEditingController(text: value);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update the user details in the state
                context
                    .read<BusReservationState>()
                    .updateUserDetails(label, controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class BusReservationState with ChangeNotifier {
  String userName = '';
  String userEmail = '';
  String userPhone = '';

  void updateUserDetails(String field, String value) {
    switch (field) {
      case 'Username':
        userName = value;
        break;
      case 'Email':
        userEmail = value;
        break;
      case 'Phone':
        userPhone = value;
        break;
      // Add more cases for other fields as needed
    }
    notifyListeners();
  }

  void logout() {
    // Perform any additional logout actions if needed
    // For example, clear user session, reset state, etc.

    // Clear user-specific state variables
    userName = '';
    userEmail = '';
    userPhone = '';

    // Notify listeners to rebuild UI
    notifyListeners();
  }
}
