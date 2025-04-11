class SearchReqParams {
  final String searchValue;
 

  SearchReqParams({
    required this.searchValue,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': searchValue
    };
  }
}
