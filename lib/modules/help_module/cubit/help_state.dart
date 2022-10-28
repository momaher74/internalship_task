part of 'help_cubit.dart';

@immutable
abstract class HelpState {}

class HelpInitial extends HelpState {}

class GetHelpLoadingState extends HelpState {}

class GetHelpSuccessState extends HelpState {}

class GetHelpErrorState extends HelpState {}
