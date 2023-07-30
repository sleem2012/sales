// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/rooms_bloc/chat_rooms_bloc.dart';
import '../../logic/rooms_bloc/chat_state.dart';

class UnReaddMsgBadge extends StatelessWidget {
  const UnReaddMsgBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
        builder: (context, state) {
          if (ChatRoomsBloc.of(context).unReaddMsgs > 0) {
            return UnReadedCountBadge(count: ChatRoomsBloc.of(context).unReaddMsgs);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class UnReadedCountBadge extends StatelessWidget {
  const UnReadedCountBadge({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    final String str = count == 0
        ? ''
        : count > 99
            ? "99+"
            : count.toString();
    if (count <= 0) return const SizedBox();
    return Container(
      padding: const EdgeInsets.all(1),
      width: 16,
      height: 16,
      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: FittedBox(
        child: Center(
          child: Text(str, style: const TextStyle(fontSize: 8, color: Colors.white)),
        ),
      ),
    );
  }
}
