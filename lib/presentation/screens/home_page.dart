import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  int counter = 0;
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Map<String, dynamic>> items = [
    {
      "name": "Pullover",
      "color": "Black",
      "size": "L",
      "price": 51,
      "quantity": 1,
      "image": 'assets/1.jpg'
    },
    {
      "name": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "price": 30,
      "quantity": 1,
      "image": 'assets/1.jpg'
    },
    {
      "name": "Sport Dress",
      "color": "Black",
      "size": "M",
      "price": 43,
      "quantity": 1,
      "image": 'assets/2p.jpg'
    },
  ];

  // Function to calculate total amount
  double calculateTotal() {
    return items.fold(
        0, (total, item) => total + (item['price'] * item['quantity']));
  }

  // Function to increase or decrease quantity of an item
  void updateQuantity(int index, bool isIncrement) {
    setState(() {
      if (isIncrement) {
        items[index]['quantity']++;
      } else if (items[index]['quantity'] > 1) {
        items[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Expanded(
            child: buildListViewBuilder(),
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Total amount: ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 170,
              ),
              Column(
                children: [
                  Text(
                    '${calculateTotal()}\$',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              )
            ],
          ),
          elevatedButton(context)
        ],
      ),
    );
  }

  ListView buildListViewBuilder() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  tileColor: Colors.white,
                  title: title(item: item),
                  subtitle: subtitle(item, index),
                  leading: leading(item),
                  trailing: trailingWrap()),
            ),
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "My Bag",
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0,
    );
  }

  Image leading(Map<String, dynamic> item) {
    return Image.asset(
      item['image'],
      fit: BoxFit.cover,
    );
  }

  Column subtitle(Map<String, dynamic> item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Color: ',
                style: TextStyle(fontSize: 15),
              ),
              TextSpan(
                text: '${item['color']}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: '    Size: ',
                style: TextStyle(fontSize: 15),
              ),
              TextSpan(
                text: '${item['size']}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // Text(
        //   'Color: ${item['color']}    Size: ${item['size']}',
        //   style: TextStyle(fontSize: 15),
        // ),
        const SizedBox(
          height: 14.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => updateQuantity(index, false),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
              ),
              child: const Icon(Icons.remove),
            ),
            Text(
              '${item['quantity']}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => updateQuantity(index, true),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              '${item['price'] * item['quantity']}\$',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Wrap trailingWrap() {
    return const Wrap(
      children: [
        Icon(Icons.more_vert),
      ],
    );
  }

  snackbars(BuildContext context, message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  SizedBox elevatedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ElevatedButton(
          onPressed: () {
            snackbars(context, 'Congrats on your latest shopping spree!');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'CHECK OUT',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class title extends StatelessWidget {
  const title({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item['name'],
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}
