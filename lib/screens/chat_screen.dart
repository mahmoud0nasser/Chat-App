import 'package:chat_app_th/constants/constants.dart';
import 'package:chat_app_th/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
  });
  static String id = 'ChatScreen';

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessagesCollections,
    // 'messages',
  );
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    // String email = ModalRoute.of(context)!.settings.arguments as String;
    /* return FutureBuilder<QuerySnapshot>(
      future: messages.get(), */
    return StreamBuilder<QuerySnapshot>(
      stream: messages
          .orderBy(
            kCreatedAt,
            descending: true,
          )
          .snapshots(),
      builder: ((context, snapshot) {
        // snapshot.data!['message']; => DocumentSanpshot
        // snapshot.data!.docs[0]['message'];
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      // 'assets/images/scholar.png',
                      width: 60.0,
                      height: 60.0,
                    ),
                    Text(
                      'Chat',
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      /* itemBuilder: (context, index) =>
                          messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleFriend(
                                  message: messagesList[index],
                                ), */
                      itemBuilder: (context, index) =>
                          messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                  color: kPrimaryColor,
                                  bottomRight: 20.0,
                                  alignment: Alignment.centerLeft,
                                  text: messagesList[index].id.toString(),
                                )
                              : ChatBubbleForFriend(
                                  message: messagesList[index],
                                  color: Color(0xff006D84),
                                  bottomleft: 20.0,
                                  alignment: Alignment.centerRight,
                                  text: messagesList[index].id.toString(),
                                )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          // 'message': data,
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email,
                          // 'createdAt': DateTime.now(),
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          // _controller.position.maxScrollExtent,
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message...',
                        suffixIcon: IconButton(
                          onPressed: () {
                            messages.add({
                              // 'message': data,
                              kMessage: controller.text,
                              kCreatedAt: DateTime.now(),
                              'id': email,
                              // 'createdAt': DateTime.now(),
                            });
                            controller.clear();
                            _controller.animateTo(
                              0,
                              // _controller.position.maxScrollExtent,
                              duration: Duration(
                                seconds: 1,
                              ),
                              curve: Curves.fastOutSlowIn,
                            );
                          },
                          icon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Loading',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.orange,
              ),
            ),
          );
        }
      }),
    );
  }
}
