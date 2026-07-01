import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/visitor_providers.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/typography.dart';
import '../../../../routes/route_names.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  String _selectedContactId = 'contact_001';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(contactsProvider);
    final messages = ref.watch(chatMessagesProvider(_selectedContactId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: contacts.when(
          data: (items) {
            final contact = items.firstWhere(
              (c) => c.id == _selectedContactId,
              orElse: () => items.first,
            );
            return Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceAlt,
                    shape: BoxShape.circle,
                    image: contact.profileImage != null
                        ? DecorationImage(
                            image: NetworkImage(contact.profileImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: contact.profileImage == null
                      ? Icon(
                          Icons.person_rounded,
                          color: AppColors.textTertiary,
                          size: 24,
                        )
                      : null,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name ?? '',
                        style: AppTypography.headline5.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        contact.company ?? '',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          loading: () => const Text('Loading...'),
          error: (error, stack) => const Text('Error'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () {
            // Use go() instead of pop() for root navigation
            context.go(RouteNames.home);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_rounded,
                          size: 72,
                          color: AppColors.textTertiary,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No messages yet',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Start the conversation!',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.senderId == 'user_001';
                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isMe ? AppColors.secondary : Colors.white,
                          borderRadius: BorderRadius.circular(18).copyWith(
                            bottomRight: isMe
                                ? const Radius.circular(6)
                                : const Radius.circular(18),
                            bottomLeft: isMe
                                ? const Radius.circular(18)
                                : const Radius.circular(6),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowLight,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.message,
                              style: TextStyle(
                                fontSize: 15,
                                color: isMe ? Colors.white : AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatTime(message.timestamp),
                              style: TextStyle(
                                fontSize: 11,
                                color: isMe
                                    ? Colors.white.withOpacity(0.7)
                                    : AppColors.textTertiary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text(
                  'Failed to load messages',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.error,
                  ),
                ),
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceAlt,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: TextField(
                      controller: _messageController,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textTertiary,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: AppColors.premiumGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowGold,
                        blurRadius: 16,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;
    
    final message = _messageController.text.trim();
    _messageController.clear();
    
    await ref.read(visitorNotifierProvider.notifier);
    setState(() {});
  }

  String _formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}