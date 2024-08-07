import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:chat_app/data/models/contact.dart';
import 'package:chat_app/data/models/message.dart';
import 'package:flutter/material.dart';

part 'telegram_state.dart';

class TelegramCubit extends Cubit<TelegramState> {
  TelegramCubit() : super(TelegramInitial());

  getContacts() {
    emit(
      TelegramUserState(
        [
          Contact(
              contactId: 1,
              contactName: 'Opercoder',
              contactLastName: 'coderoper',
              isOnline: false,
              imageUrl:
                  'https://img.freepik.com/free-photo/handsome-hispanic-man-with-beard-wearing-casual-clothes-with-happy-cool-smile-face-lucky-person_839833-31901.jpg',
              lastOnlineTime: DateTime.now()),
          Contact(
              contactId: 2,
              contactName: 'Codepode',
              contactLastName: 'coderoper',
              isOnline: false,
              imageUrl:
                  'https://c1.wallpaperflare.com/preview/568/71/709/face-facial-hair-fine-looking-guy.jpg',
              lastOnlineTime: DateTime.now()),
          Contact(
              contactId: 3,
              contactName: 'Abduvali',
              contactLastName: 'Shamshiyev',
              isOnline: false,
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEFixMgSJA888PPdVGeurwizYT1pnGmK7roA&s',
              lastOnlineTime: DateTime.now()),
          Contact(
              contactId: 4,
              contactName: 'Salombek',
              contactLastName: 'Hayirev',
              isOnline: false,
              imageUrl:
                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              lastOnlineTime: DateTime.now()),
        ],
      ),
    );
  }

  getMesagessById(int contactID) {
    List<Message> newList = [];
    List<Message> messages = [
      Message(
        messageId: Random().nextInt(20),
        messageText: 'salom Operocderdan',
        isFile: false,
        createdTime: DateTime.now().toString(),
        contactId: 1,
        status: Random().nextInt(20),
      ),
      Message(
        messageId: Random().nextInt(20),
        messageText: 'salom Codepodedan',
        isFile: false,
        createdTime: DateTime.now().toString(),
        contactId: 2,
        status: Random().nextInt(20),
      ),
      Message(
        messageId: Random().nextInt(20),
        messageText: 'salom Abduvalidan',
        isFile: false,
        createdTime: DateTime.now().toString(),
        contactId: 3,
        status: Random().nextInt(20),
      ),
      Message(
        messageId: Random().nextInt(20),
        messageText: 'salom Abduvalidan bro nima gap',
        isFile: false,
        createdTime: DateTime.now().toString(),
        contactId: 3,
        status: Random().nextInt(20),
      ),
      Message(
        messageId: Random().nextInt(20),
        messageText: 'salom Salombekdan',
        isFile: false,
        createdTime: DateTime.now().toString(),
        contactId: 4,
        status: Random().nextInt(20),
      ),
    ];

    for (var element in messages) {
      if (element.contactId == contactID) {
        newList.add(element);
      }
    }
    emit(TelegramMessagess(newList));
  }
}
