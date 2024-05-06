import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/utils/conversation_metadata.dart';
import 'package:dem_recip_mobile/view/widget/conversation_box.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<ConversationMetaData> _conversations = [];
  bool _isLoading = true;
  
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
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to fetch conversations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Your Widget Title")),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: 
                  _conversations.map((element) => ConversationBox(data: element)).toList()
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    // Handle your button tap here
                  },
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
    );
  }
}