import 'package:demo_connect_native_app/src/controller/product_controller.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ProductRepo().getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder(
        future: ProductController().getProducts(),
        builder: (context,snapshot) {
          snapshot.data;
          if(snapshot.data==null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final product = snapshot.data;
          return ListView.builder(itemCount: product?.length,itemBuilder: (context,index){
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product![index].title, style:  const TextStyle(fontSize: 20),),
                  Text(product[index].description),
                  Image.network(product[index].images.first,width: 200,height: 100,)
                ],
              ),
            );
          },);
        },
      ),
    );
  }
}
