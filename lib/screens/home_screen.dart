import 'package:flutter/material.dart';
import 'package:sandesh/utils/color.dart';
import 'package:sandesh/pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandesh"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          // IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          PopupMenuButton<String>(
            // color: Colors.white,
            offset: const Offset(0, 10),
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey.withOpacity(.23),
            onSelected: (value){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(value.toString()),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'ACTION',
                  onPressed: () { },
                ),
              ));
            },
            itemBuilder: (BuildContext context){
              return const [
                PopupMenuItem(
                  child: Text("New group",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  value: "New group",
                ),

                PopupMenuItem(
                  child: Text("New broadcast",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                  value: "New broadcast",
                ),

                PopupMenuItem(
                  child: Text("Linked devices",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                  value: "Linked devices",
                ),

                PopupMenuItem(
                  child: Text("Sandesh web",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                  value: "Sandesh web",
                ),

                PopupMenuItem(
                  child: Text("Starred messages",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                  value: "Starred messages",
                ),

                PopupMenuItem(
                  child: Text("Settings",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                  value: "Settings",
                ),
              ];
            }
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(.6),
          indicatorSize: TabBarIndicatorSize.tab,      
          tabs: const [
            // Tab(
            //   icon: const Icon(Icons.camera_alt),
            // ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const [
          // Text("Camera"),
          ChatPage(),
          Text("status"),
          Text("calls"),
        ],
      ),
    );
  }
}