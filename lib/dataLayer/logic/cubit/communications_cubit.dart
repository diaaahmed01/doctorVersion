import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/dataLayer/model/ArticleCommunication.dart';
import 'package:final_project/logic/cubit/doctor_cubit.dart';

import '../../Data/Repository.dart';

part 'communications_state.dart';

class CommunicationsCubit extends Cubit<CommunicationsState> {
  CommunicationsCubit(this.repository) : super(CommunicationsInitial());
  final Repository repository;

  getArticleCommunication({required String articleCommunicationId}) async {
    final ArticleCommunication articleCommunication;
    emit(ArticleCommunicationsLoading());
    articleCommunication =
        await repository.getArticleCommunication(articleCommunicationId);
    emit(ArticleCommunicationsLoaded(articleCommunication));
  }
}
