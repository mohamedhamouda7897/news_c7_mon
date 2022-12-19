import 'package:flutter/material.dart';
import 'package:news_c7_mon/models/SourcesResponse.dart';
import 'package:news_c7_mon/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Monday'),
      ),
      body: FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Column(
                    children: [
                    Text('Something went wrong'),
                TextButton(onPressed: ()
            {},
          child: Text('Try Again'))
          ],
          )
          ,
          );
        }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??"Error"),
                TextButton(onPressed: ()
                {},
                    child: Text('Try Again'))
              ],
            );
          }
          var sources=snapshot.data?.sources??[];
          return ListView.builder(itemBuilder: (context, index) {
            return Text(sources[index].name??"");
          },itemCount:sources.length ,);
        },),
    );
  }
}
