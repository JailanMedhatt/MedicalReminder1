 abstract class PatientHistoryStates{

 }
 class LoadingHistory extends PatientHistoryStates{}
 class ListLoadedHistory extends PatientHistoryStates{}
 class SearchHistory extends PatientHistoryStates{
  List <Map<String, dynamic>>? searchedpdfData = [];
  SearchHistory({required this.searchedpdfData});
 }