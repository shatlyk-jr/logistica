import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InventoryManagementScreen extends StatefulWidget {
  @override
  _InventoryManagementScreenState createState() =>
      _InventoryManagementScreenState();
}

class _InventoryManagementScreenState extends State<InventoryManagementScreen> {
  List<Map<String, dynamic>> inventoryItems = [
    {
      'name': 'Product A',
      'quantity': 100,
      'location': 'Warehouse 1',
    },
    {
      'name': 'Product B',
      'quantity': 50,
      'location': 'Warehouse 2',
    },
    // Add more inventory items here...
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void addInventoryItem() {
    final newItem = {
      'name': nameController.text,
      'quantity': int.tryParse(quantityController.text) ?? 0,
      'location': locationController.text,
    };

    setState(() {
      inventoryItems.add(newItem);
    });

    nameController.clear();
    quantityController.clear();
    locationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        title: Text('Inventory Management'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: inventoryItems.length,
              itemBuilder: (context, index) {
                final item = inventoryItems[index];
                return Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 3,
                    intensity: 0.8,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      item['name'],
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity: ${item['quantity']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Location: ${item['location']}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                NeumorphicButton(
                  onPressed: addInventoryItem,
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add Item',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
