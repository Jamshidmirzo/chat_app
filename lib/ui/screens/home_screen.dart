import 'package:chat_app/logic/cubits/telegram/telegram_cubit.dart';
import 'package:chat_app/ui/screens/chat_screen.dart';
import 'package:chat_app/ui/widgets/storyies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TelegramCubit>().getContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts_rounded,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Text(
                "Converstations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_rounded,
              ),
              label: ''),
        ],
      ),
      appBar: AppBar(
        leadingWidth: 170,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Center(
            child: Text(
              "Conversations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey, width: 3),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade300),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                    const Storyies(
                      imageUrl:
                          'https://img.freepik.com/premium-photo/portrait-smile-man-with-positive-confidence-carefree-against-grey-studio-background-face-male-person-human-with-cheerful-attitude-freedom-model-with-joy-canada-relax_590464-177008.jpg',
                      name: 'Lyoha',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<TelegramCubit, TelegramState>(
                  builder: (context, state) {
                    if (state is TelegramUserState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          final contact = state.contacts[index];
                          return ZoomTapAnimation(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    contact: contact,
                                  ),
                                ),
                              );
                              context.read<TelegramCubit>().getContacts();
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(contact.imageUrl),
                              ),
                              title: Text(contact.contactName),
                              subtitle: Text(contact.contactLastName),
                              trailing: Text(contact.lastOnlineTime.toString()),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
