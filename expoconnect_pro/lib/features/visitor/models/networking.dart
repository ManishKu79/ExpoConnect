import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String id;
  final String name;
  final String? profileImage;
  final String company;
  final String position;
  final bool isConnected;
  final bool isPending;

  const Contact({
    required this.id,
    required this.name,
    this.profileImage,
    required this.company,
    required this.position,
    this.isConnected = false,
    this.isPending = false,
  });

  Contact copyWith({
    String? id,
    String? name,
    String? profileImage,
    String? company,
    String? position,
    bool? isConnected,
    bool? isPending,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      company: company ?? this.company,
      position: position ?? this.position,
      isConnected: isConnected ?? this.isConnected,
      isPending: isPending ?? this.isPending,
    );
  }

  @override
  List<Object?> get props => [id, name, profileImage, company, position, isConnected, isPending];
}

class ChatMessage extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final MessageType type;

  const ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    this.type = MessageType.text,
  });

  @override
  List<Object?> get props => [id, senderId, receiverId, message, timestamp, isRead, type];
}

enum MessageType {
  text,
  image,
  file,
  location,
}