import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/src/api/client.dart';
import 'package:starter/src/dto/token_response.dart';
import 'package:starter/src/service/storage_service.dart';

final tokenController = StateNotifierProvider<TokenController, TokenDto?>(
    (ref) => TokenController(ref));

class TokenController extends StorageNotifier<TokenDto?> {
  final Ref ref;
  TokenController(this.ref) : super(SecureStorage(), 'tokenKey');

  @override
  TokenDto? fromJson(v) {
    return TokenDto.fromJson(v);
  }

  @override
  Map<String, dynamic>? toJson(v) {
    return v?.toJson();
  }

  Future<void> logOut([bool alert = true]) async {
    await setTo(null);

    // ref.read(appRouterProvider).replace(const AuthRoute());
  }

  Future<void> refreshToken() async {
    final newTokens =
        await ref.read(apiClient).auth.refreshToken(state!.refreshToken);
    state = TokenDto.fromJson({...state!.toJson(), ...newTokens.toJson()});
  }
}

// class ProfileController extends HydratedStateNotifier<Str?> {}
