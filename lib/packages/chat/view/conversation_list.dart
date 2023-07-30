import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/new_bg_img.dart';
import '../../widgets/text_field.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import '../../widgets/search_manager.dart';
import '../data/models/chat_rooms_model.dart';
import '../logic/rooms_bloc/chat_rooms_bloc.dart';
import '../logic/rooms_bloc/chat_state.dart';
import 'widgets/conversations_tile.dart';

class ConversationView extends StatefulWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
          builder: (context, state) {
            final allRooms = ChatRoomsBloc.of(context).allRooms;
            return KRequestOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              error: state.whenOrNull(error: (error) => error),
              onTryAgain: state.whenOrNull(error: (error) => ChatRoomsBloc.of(context).get_all_rooms),
              child: RefreshIndicator(
                onRefresh: () async => ChatRoomsBloc.of(context).get_all_rooms(),
                child: DefaultTabController(
                  length: 2,
                  child: BlocProvider(
                    create: (context) => SearchCubit(allRooms),
                    child: BlocBuilder<SearchCubit<Conversations>, SearchState<Conversations>>(
                      builder: (context, searchState) {
                        final rooms = ChatRoomsBloc.of(context).rooms;
                        final archivedRooms = ChatRoomsBloc.of(context).archivedRooms;
                        final searchCubit = SearchCubit.of<Conversations>(context);
                        return Column(
                          children: [
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: KTextFormField(
                                onChanged: (p0) => searchCubit.search(p0, (p0) => p0.nickname),
                                hintText: Tr.get.search,
                                suffixIcon: const Icon(Icons.search, color: KColors.accentColorD),
                                textInputAction: TextInputAction.search,
                              ),
                            ),
                            if (searchCubit.isSearching) ...[
                              Expanded(child: ConversationList(rooms: searchState.list)),
                            ] else ...[
                              TabBar(
                                padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 8),
                                labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: KColors.accentColorD,
                                tabs: [
                                  Text("${Tr.get.chats} ( ${rooms.length} )", style: KTextStyle.of(context).body2),
                                  Text("${Tr.get.archived} ( ${archivedRooms.length} )", style: KTextStyle.of(context).body2),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    ConversationList(rooms: rooms),
                                    ConversationList(rooms: archivedRooms),
                                  ],
                                ),
                              ),
                            ]
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ConversationList extends StatelessWidget {
  const ConversationList({super.key, required this.rooms});

  final List<Conversations> rooms;

  @override
  Widget build(BuildContext context) {
    return rooms.isEmpty
        ? Center(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  SvgPicture.asset('assets/images/empty_chat.svg'),
                  const SizedBox(height: 15),
                  Text(
                    Tr.get.your_inbox_is_empty,
                    style: KTextStyle.of(context).title,
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: 5, bottom: 100),
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              return ConversationTile(chatRoom: rooms[index]);
            },
          );
  }
}
