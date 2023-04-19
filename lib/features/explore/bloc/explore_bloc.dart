import 'package:auction_api/auction_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreFetchAuctionEvent>(_fetchAuction);
  }

  Future<void> _fetchAuction(ExploreFetchAuctionEvent event, Emitter<ExploreState> emit) async {
    emit(ExploreLoading());

    // TODO: fetch data from repository

    emit(ExploreLoaded(
      latestAuctionList: Auction.dummyAuction.take(3).toList(),
      randomAuctionList: Auction.dummyAuction.take(5).toList(),
      otherAuctionList: Auction.dummyAuction.take(5).toList(),
    ));
  }
}
