import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/ArticleCommunication.dart';
import '../../repositroy/Repository.dart';

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
