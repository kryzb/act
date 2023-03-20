import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeHive extends StatefulWidget {
  const HomeHive({super.key});

  @override
  State<HomeHive> createState() => _HomeHiveState();
}

class _HomeHiveState extends State<HomeHive> {
  @override
  Widget build(BuildContext context) {

    // final box = Hive.box('shopp');
    List<String> shop = [];
    // box.put('myShop', shop);
    // List<String> myShop = box.get('myShop');
    var listController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        leading: Icon(Icons.check),
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: listController,
                  decoration: InputDecoration(
                    hintText: 'Input text',
                    label: Text('Istem')
                  ),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    shop.add(listController.text);
                  });
                }, child: Text('Add'))

              ],
             ),
              
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: shop.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(shop.elementAt(index)),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever)),
              );
            },
          ),)
        ],
      ),
    );
  }
}