
class ConversationMetaData {
  String convoId;
  String topic;
  String partner;
  String timeStamp;

  ConversationMetaData(this.convoId, this.topic, this.partner, this.timeStamp);

  factory ConversationMetaData.fromJson(String id, Map<String, dynamic> json) {
    return ConversationMetaData(
      id,
      json['topic'] as String,
      json['partnerId'] as String,
      json['timestamp'] as String,
    );
  }
}