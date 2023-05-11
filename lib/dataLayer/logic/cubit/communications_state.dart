part of 'communications_cubit.dart';

abstract class CommunicationsState extends Equatable {
  const CommunicationsState();

  @override
  List<Object> get props => [];
}

class CommunicationsInitial extends CommunicationsState {}

class ArticleCommunicationsLoading extends CommunicationsState {}

class ArticleCommunicationsLoaded extends CommunicationsState {
  final ArticleCommunication articleCommunication;
  List<Object> get props => [articleCommunication];
  ArticleCommunicationsLoaded(this.articleCommunication);
}
