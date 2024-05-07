import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/utils/conversation_metadata.dart';
import 'package:dem_recip_mobile/view/widget/add_button.dart';
import 'package:dem_recip_mobile/view/widget/conversation_box.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showQuesionnaire = false;

  List<ConversationMetaData> _conversations = [];
  
  @override
  void initState() {
    super.initState();
    _fetchConversations();
  }

  Future<void> _fetchConversations() async {
    try {
      List<ConversationMetaData> loadedConversations = await UserService.getConversations(AuthService().currentUser?.email);
      setState(() {
        _conversations = loadedConversations;
      });
    } catch (e) {
      print('Failed to fetch conversations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
          children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                  children: 
                  _conversations.map((element) => ConversationBox(data: element)).toList()
            ),
          ),
          AddButton(showQuestionnaire: showQuesionnaire, setState: setState)
        ]
      )
    );
  }
}