part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetProdsLoadingState extends HomeState {}

class GetProdsSuccessState extends HomeState {}

class GetProdsErrorState extends HomeState {}
