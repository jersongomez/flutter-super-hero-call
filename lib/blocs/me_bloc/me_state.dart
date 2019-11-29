import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;
import 'package:super_hero_call/models/super_hero.dart';

enum Status { loading, picking, connected, calling, incomming, inCalling }

class MeState extends Equatable {
  final Status status;
  final String requestId;
  final SuperHero me, him;
  final Map<String, SuperHero> heroes;

  MeState(
      {@required this.status, this.requestId, this.me, this.him, this.heroes});

  @override
  List<Object> get props => [status, requestId, me, him, heroes];

  factory MeState.initialState() => MeState(status: Status.loading);

  copyWith(
      {@required Status status,
      String requestId,
      SuperHero me,
      Map<String, SuperHero> heroes,
      SuperHero him}) {
    return MeState(
        status: status,
        requestId: requestId ?? this.requestId,
        me: me ?? this.me,
        heroes: heroes ?? this.heroes,
        him: him ?? this.him);
  }

  updateHero(bool isTaken, String heroName) {
    final tmp = Map<String, SuperHero>();
    tmp.addAll(heroes);
    tmp[heroName] = tmp[heroName].copyWith(isTaken: isTaken);

    return MeState(
        status: status,
        requestId: this.requestId,
        me: this.me,
        him: this.him,
        heroes: tmp);
  }
}
