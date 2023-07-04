import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repository/homerepository.dart';
import '../../di/locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final homeRepo = getIt<HomeRepository>();
  HomeCubit() : super(HBLoading());

  getApi() async{
    try{
      emit(HBLoading());
      var response = await homeRepo.getApi();
      emit(HBLoaded(response));

    } catch(error) {
      emit(HBError(error));
    }
  }
}
final homeCubit = HomeCubit();