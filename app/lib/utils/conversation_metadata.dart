
class ConversationMetaData {
  String convoId;
  String topic;
  DateTime timestamp;
  List<dynamic>? participants;

  ConversationMetaData(this.convoId, this.topic, this.timestamp, this.participants);

  factory ConversationMetaData.fromJson(Map<String, dynamic> json) {
    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(json['timestamp'] * 1000);
    return ConversationMetaData(
      json['convoId'] as String,
      json['topic'] as String,
      timestamp,
      json['participants'] as List<dynamic>?
    );
  }
}