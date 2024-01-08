import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sandesh/Model/ChatModel.dart';
import 'package:sandesh/utils/color.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:sandesh/widgets/OwnMessegeCard.dart';
import 'package:sandesh/widgets/ReplyMessageCard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {

  bool showEmoji = false;
  TextEditingController tc = TextEditingController();
  FocusNode focusNode =  FocusNode();

  late IO.Socket socket;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() { 
      if(focusNode.hasFocus){
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  void connect(){
    socket = IO.io("http://192.168.112.122:3000",<String,dynamic>{
      "transport":["websocket"],
      "autoConnect":false
    });

    socket.connect();
    socket.onConnect((data) => print("App connected with socket !"));
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            "assets/whatsapp_Back.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, size: 24,),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                     child: SvgPicture.asset(
                      widget.chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg" , 
                      alignment: Alignment.center, 
                      height: 30, 
                      width: 30, 
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
        
            title: InkWell(
              onTap: (){
        
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                
                    const Text(
                      "last seen today at 12:10",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
            ),
        
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.videocam),
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.call),
              ),
        
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
                      value: "View contact",
                      child: Text("View contact",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    ),
        
        
                    PopupMenuItem(
                      value: "Media, links and docs",
                      child: Text("Media, links and docs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
        
                    PopupMenuItem(
                      value: "Sandesh web",
                      child: Text("Sandesh web",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
        
                    PopupMenuItem(
                      value: "Search",
                      child: Text("Search",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
        
                    PopupMenuItem(
                      value: "Mute notification",
                      child: Text("Mute notification",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
        
                    PopupMenuItem(
                      value: "Wallpaper",
                      child: Text("Wallpaper",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                    ),
                  ];
                }
              )
            ],
          ),
        
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 155,
                  child: ListView(
                    children: [
                      OwnMessageCard(),
                      ReplyMessageCard(),
                      OwnMessageCard(),
                      OwnMessageCard(),
                      ReplyMessageCard(),
                      OwnMessageCard(),
                      ReplyMessageCard(),
                      OwnMessageCard(),
                      ReplyMessageCard(),
                    ],
                  ),
                ),
          
                WillPopScope(
                  onWillPop: (){
                    if(showEmoji){
                      setState(() {
                        showEmoji = false;
                      });
                    }
                    else{
                      Navigator.pop(context);
                    }
          
                    return Future.value(false);
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin: const EdgeInsets.only(left: 5,right: 2,bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                color: Colors.white,
                                child: TextFormField(
                                  controller: tc,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  cursorColor: secondary,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    prefixIcon: IconButton(
                                      onPressed: (){
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          showEmoji = !showEmoji;
                                        });
                                      }, 
                                      icon: const Icon(Icons.emoji_emotions_outlined, color: primary,),
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: (){
                                            if(showEmoji){
                                              setState(() {
                                                showEmoji = false;
                                              });
                                            }
                                            showModalBottomSheet(
                                              backgroundColor: Colors.transparent,
                                              context: context, 
                                              builder: (builder){
                                                return attachmentSheet();
                                              }
                                            );
                                          }, 
                                          icon: const Icon(Icons.attach_file, color: primary,),
                                        ),
                                        IconButton(
                                          onPressed: (){}, 
                                          icon: const Icon(Icons.camera_alt,color: primary,),
                                        ),
                                      ],
                                    ),
                                    contentPadding: const EdgeInsets.all(5)
                                  ),
                                )
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 3,left: 2,bottom: 8),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: secondary,
                                child: IconButton(
                                  onPressed: (){}, 
                                  icon: const Icon(Icons.mic, color: Colors.white,),
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        showEmoji ? 
                          SizedBox(
                          height: 255,
                          child: emojiSelector()
                        ) : Container() ,
                      ],
                    ),
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelector(){
    return EmojiPicker(
      // onEmojiSelected: (category, emoji){

      // },
      // onBackspacePressed: () {
      //     // Do something when the user taps the backspace button (optional)
      //     // Set it to null to hide the Backspace-Button
      // },
      textEditingController: tc,
      config: Config(
        columns: 7,
        emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0), 
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: const Color(0xFFF2F2F2),
        indicatorColor: secondary,
        iconColor: Colors.grey,
        iconColorSelected: secondary,
        backspaceColor: secondary,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        recentTabBehavior: RecentTabBehavior.RECENT,
        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), 
        loadingIndicator: const SizedBox.shrink(), 
        tabIndicatorAnimDuration: kTabScrollDuration,    
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }


  Widget attachmentSheet(){
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconCreation(Icons.insert_drive_file, "Document", Colors.indigo, (){}),
                  iconCreation(Icons.camera_alt, "Camera", Colors.pink, (){}),
                  iconCreation(Icons.insert_photo, "Photos", Colors.purple, (){}),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconCreation(Icons.headphones, "Audio", Colors.orange, (){}),
                  iconCreation(Icons.location_pin, "Location", Colors.green, (){}),
                  iconCreation(Icons.person, "Contact", Colors.blue, (){}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, String title, Color color, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, size: 29, color: Colors.white,),
          ),
          const SizedBox(height: 5,),
          Text(
            title,
            style:const TextStyle(
              fontSize: 12
            ),
          ),
        ],
      ),
    );
  }

}