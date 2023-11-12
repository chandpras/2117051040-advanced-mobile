import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var feature = ["Request", "Send", "Bills", "Top Up", "Withdraw", "Games", "Split", "Mobile"];

  List<Icon> feature_icons = [
    Icon(Icons.call_received),
    Icon(Icons.call_made),
    Icon(Icons.receipt_long_rounded),
    Icon(Icons.add),
    Icon(Icons.payments_outlined),
    Icon(Icons.sports_esports_outlined),
    Icon(Icons.splitscreen),
    Icon(Icons.phone_android)
  ];

  var listview_img = [
    "assets/images/foodlist.jpg", 
    "assets/images/gamelist.png"
  ];

  var listview_title = [
    "Get your greens for less", 
    "Level up your gaming experience"
  ];

  var listview_desc = [
    "Enjoy exclusive discounts at Ranch Market, your go-to veggie supermarket", 
    "Get exciting cashback offers on topping up your game balance"
  ];

  var name = "";

  void getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("name")){
      setState(() {
        name = prefs.getString("name") ?? "User";
      });
    }else{
      setState(() {
        name = "User";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 251),
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
                      CircleAvatar(radius: 20, backgroundImage: AssetImage("assets/images/shanon.png"),),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( "Hai,", style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 164, 168, 174),),),
                          Text( "$name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
                
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(color: Color.fromARGB(255, 30, 144, 255), borderRadius: BorderRadius.circular(16),),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Platinum Member", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                            Text("Member Since 08/23", style: TextStyle(fontSize: 12, color: Colors.white,),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Balance", style: TextStyle(fontSize: 14, color: Colors.white,),),
                            Text("Rp.4.000.000", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: feature.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        children:[
                          Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(22),
                                child: feature_icons[index],
                              ),
                            ],
                          ),
                        ),
                          Flexible(
                            child: Text(feature[index], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.visible,),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Promo", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      TextButton(
                      onPressed: () {},
                      child: Text("See All", style: TextStyle(color: Color.fromARGB(255, 30, 144, 255), fontWeight: FontWeight.bold),),)
                    ],
                  ),
                ),

                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(16), image: DecorationImage(fit: BoxFit.cover, image: AssetImage(listview_img[index]),),),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.55), borderRadius: BorderRadius.circular(16),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listview_title[index], style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(listview_desc[index], style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
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