// home_admin.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valyrian_ventures/admin/add_item.dart';
import 'package:valyrian_ventures/widget/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  List<Map<String, String>> items = [];

  void _navigateToAddItemPage() async {
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItem()),
    );

    if (newItem != null) {
      setState(() {
        items.add(newItem);
      });
    }
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Added Items",
          style: AppWidget.headlineTextFieldStyle(),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: items.isEmpty
                  ? Center(child: Text("No items added yet."))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: ListTile(
                            leading: Image.network(item['Image']!),
                            title: Text(item['Name']!),
                            subtitle: Text(item['Detail']!),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item['Price']!),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteItem(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddItemPage,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
