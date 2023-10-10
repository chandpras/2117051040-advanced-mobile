import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var fitur = ["Top Up", "Send", "Withdraw", "Pay", "Top Up", "Send", "Withdraw", "Pay"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 3));
          },
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 20, backgroundImage: NetworkImage("https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg"),),
                      SizedBox(width: 16,),
                      Text( "Hello, Alex", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
                
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Saldo", style: TextStyle(fontSize: 20, color: Colors.white,),),
                      Text("Rp 100.000.000", style: TextStyle(fontSize: 32, color: Colors.white,),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: fitur.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag, size: 32,),
                            Flexible(
                              child: Text(fitur[index], overflow: TextOverflow.ellipsis,),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16), image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/money.jpg"),),),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(16),),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Promo Spesial", style: TextStyle(color: Colors.white, fontSize: 26)),
                              Text("Dapatkan cashback 50% untuk pembelian pertama", style: TextStyle(color: Colors.white, fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}