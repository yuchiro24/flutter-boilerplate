import 'dart:convert';
import 'dart:io';

import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/entities/create_card/create_card.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'create_card_page_notifier.freezed.dart';

final createCardPageNotifierProvider =
    StateNotifierProvider<CreateCardPageNotifier, CreateCardPageState>((ref) {
  return CreateCardPageNotifier(ref);
});

@freezed
class CreateCardPageState with _$CreateCardPageState {
  const factory CreateCardPageState({
    @Default(<CreateCard>[]) List<CreateCard> cardList,
  }) = _CreateCardPageState;
}

class CreateCardPageNotifier extends StateNotifier<CreateCardPageState> {
  CreateCardPageNotifier(this._ref) : super(const CreateCardPageState());
  final Ref _ref;

  Future<void> addCard() async {
    final selectFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectFile == null) {
      return;
    }
    final image = File(selectFile.path);
    final imageBytes = image.readAsBytesSync();
    final base64Image = base64Encode(imageBytes);
    final card = CreateCard(imgBase64: base64Image);
    state = state.copyWith(
      cardList: [
        ...[card],
        ...state.cardList
      ],
    );
  }

  void setTitle(int index, String title) {
    final clone = state.cardList.map((card) {
      final idx = state.cardList.indexWhere((ele) => ele == card);
      if (idx == index) {
        return card.copyWith(title: title);
      }
      return card;
    }).toList();

    state = state.copyWith(cardList: clone);
  }

  Future<void> sendCard(BuildContext context) async {
    try {
      final roomId = _ref.read(roomNotifierProvider).room?.id;
      if (roomId == null) {
        throw Exception('could not get roomId');
      }
      final uri =
          _ref.read(appServiceProvider).endpoint('/rooms/$roomId/cards/');
      for (final element in state.cardList) {
        final params = {
          'title': element.title,
          'img_base64': element.imgBase64,
        };
        // TODO: check if photo is new or already added.
        final response = _ref.read(appServiceProvider).post(
              uri,
              <String, String?>{},
              data: params,
            );
      }
      Navigator.of(context).pop();
    } on Exception catch (_) {
      logger.info('failed to send card');
      OriginalProgress.showMessageDialog(
        context,
        '',
        'ふだの追加に失敗しました。',
      );
    }
  }
}
