import 'package:flutter/material.dart';

final List<Map<String, dynamic>> dummyOrders = [
  {
    'id': 32053,
    'category': 'Breakfast',
    'title': 'Chicken Thai Biriyani',
    'price': 60,
    'imageUrl':
        'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32054,
    'category': 'Lunch',
    'title': 'Beef Burger with Fries',
    'price': 45,
    'imageUrl':
        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32055,
    'category': 'Dinner',
    'title': 'Creamy Pasta Carbonara',
    'price': 55,
    'imageUrl':
        'https://images.unsplash.com/photo-1612874742237-6526221588e3?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32056,
    'category': 'Dessert',
    'title': 'Berry Pancake Special',
    'price': 30,
    'imageUrl':
        'https://images.unsplash.com/photo-1528207776546-365bb710ee93?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
];

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late final List<Map<String, dynamic>> _orders = dummyOrders
      .map((order) => Map<String, dynamic>.from(order))
      .toList();

  void _updateStatus(int index, String status) {
    setState(() {
      _orders[index]['status'] = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Food Orders',
          style: TextStyle(
            color: Color(0xFF263238),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
              child: Text(
                'Your orders (${_orders.length})',
                style: const TextStyle(
                  color: Color(0xFF263238),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return _OrderCard(
                    order: _orders[index],
                    onDone: () => _updateStatus(index, 'done'),
                    onCancel: () => _updateStatus(index, 'cancelled'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.order,
    required this.onDone,
    required this.onCancel,
  });

  final Map<String, dynamic> order;
  final VoidCallback onDone;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final status = order['status'] as String;
    final isPending = status == 'pending';
    final statusLabel = switch (status) {
      'done' => 'Completed',
      'cancelled' => 'Cancelled',
      _ => null,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  order['imageUrl'] as String,
                  width: 92,
                  height: 96,
                  fit: BoxFit.cover,
                  semanticLabel: order['title'] as String,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 92,
                      height: 96,
                      color: const Color(0xFFFFE9DC),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.fastfood,
                        color: Color(0xFFF36B32),
                        size: 34,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: SizedBox(
                  height: 96,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['category'] as String,
                        style: const TextStyle(
                          color: Color(0xFFF36B32),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order['title'] as String,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF263238),
                          fontSize: 15,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ID: ${order['id']}',
                              style: const TextStyle(
                                color: Color(0xFF78909C),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            '\$${order['price']}',
                            style: const TextStyle(
                              color: Color(0xFFF36B32),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (isPending)
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: onDone,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF36B32),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF78909C),
                        side: const BorderSide(color: Color(0xFFDCE3E6)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                ),
              ],
            )
          else
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: status == 'done'
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusLabel!,
                  style: TextStyle(
                    color: status == 'done'
                        ? const Color(0xFF388E3C)
                        : const Color(0xFFC62828),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
