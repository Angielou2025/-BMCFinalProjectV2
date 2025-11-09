import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> orderData;

  const OrderCard({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> items = orderData['items'] ?? [];
    final double totalPrice = (orderData['totalPrice'] ?? 0).toDouble();
    final String status = orderData['status'] ?? 'Pending';

    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(
          'Order - ₱${totalPrice.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Status: $status'),
        children: items.map((item) {
          return ListTile(
            title: Text(item['name'] ?? 'Unknown'),
            subtitle: Text('Qty: ${item['quantity']}'),
            trailing: Text('₱${(item['price'] as num).toDouble().toStringAsFixed(2)}'),
          );
        }).toList(),
      ),
    );
  }
}
