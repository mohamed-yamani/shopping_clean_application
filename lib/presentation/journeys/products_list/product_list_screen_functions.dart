class ProductListScreenFunctions {
  void monRefresh(_refreshController) async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

//   void _onLoading() async{
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use loadFailed(),if no data return,use LoadNodata()
//     items.add((items.length+1).toString());
//     if(mounted)
//     setState(() {

//     });
//     _refreshController.loadComplete();
//   }
}
