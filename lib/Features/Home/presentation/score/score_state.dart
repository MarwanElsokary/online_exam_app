part of 'score_cubit.dart';

sealed class ScoreState extends Equatable {
  const ScoreState();
}

final class ScoreInitial extends ScoreState {
  @override
  List<Object> get props => [];
}
