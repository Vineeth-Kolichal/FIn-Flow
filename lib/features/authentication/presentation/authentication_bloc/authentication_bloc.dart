import 'package:bloc/bloc.dart';
import 'package:fin_flow/core/usecases/usecases.dart';
import 'package:fin_flow/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthUseCase authUseCase;
  AuthenticationBloc(this.authUseCase) : super(_Initial()) {
    on<GoogleSignIn>((event, emit) async {
      await authUseCase(NoParams()).then((value) {
        value.fold((fail) {
          print("${fail.error} from bloc");
        }, (success) {
          print("$success from bloc");
        });
      });
    });
  }
}
