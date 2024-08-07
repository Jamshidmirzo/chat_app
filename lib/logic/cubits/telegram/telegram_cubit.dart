import 'package:bloc/bloc.dart';

part 'telegram_state.dart';

class TelegramCubit extends Cubit<TelegramState> {
  TelegramCubit() : super(TelegramInitial());
}
