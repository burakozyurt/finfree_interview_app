import 'package:finfree_interview_app/models/price_entry_list_of_period.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page_repository.dart';
import 'package:finfree_interview_app/shared/bloc/bloc.dart';
import 'package:rxdart/subjects.dart';

class HomePageBloc extends Bloc {
  final _priceEntryListOfPeriodFetcher = BehaviorSubject<PriceEntryListOfPeriod>();
  final HomePageRepository _homePageRepository = HomePageRepository();

  Stream<PriceEntryListOfPeriod> get priceEntryListOfPeriodStream => _priceEntryListOfPeriodFetcher;

  fetchAllData() async {
    //Fetching Data
    PriceEntryListOfPeriod response = await _homePageRepository.getPriceEntryListOfPeriod();
    if (!_priceEntryListOfPeriodFetcher.isClosed) {
      _priceEntryListOfPeriodFetcher.sink.add(response);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _priceEntryListOfPeriodFetcher.close();
  }
}
