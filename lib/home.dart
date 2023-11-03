import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movieapp_200559/media_list.dart';
import 'package:movieapp_200559/common/MediaProvider.dart';
import 'package:movieapp_200559/model/Media.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose(){
    _pageController?.dispose();
    super.dispose();
  }

  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  PageController? _pageController;
  int _page = 0;

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 180, 55, 124),
        title: new Text("MovieApp_200559"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
          backgroundColor: Color.fromARGB(255, 230, 99, 171),
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(child: new Material()),
              new ListTile(
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  title: new Text("Peliculas"),
                  selected: mediaType == MediaType.movie,
                  trailing: new Icon(Icons.local_movies),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: (){
                    _changeMediaType(MediaType.movie);
                    Navigator.of(context).pop();
                  }
                  ),
              new Divider(
                color: Color.fromARGB(235, 255, 255, 255),
                height: 5.0,
              ),
              new ListTile(
                  title: new Text("Televisión"),
                  selected: mediaType == MediaType.show,
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  trailing: new Icon(Icons.live_tv),
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  onTap: (){
                    _changeMediaType(MediaType.show);
                    Navigator.of(context).pop();
                  }
                  ),
              new Divider(
                color: Color.fromARGB(235, 255, 255, 255),
                height: 5.0,
              ),
              new ListTile(
                title: new Text("Cerrar"),
                textColor: Color.fromARGB(255, 255, 255, 255),
                trailing: new Icon(Icons.close),
                iconColor: Color.fromARGB(255, 255, 255, 255),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          )),
      body: new PageView(
        children: _changeMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 180, 55, 124),
        items: _getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return mediaType == MediaType.movie?
    [
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.thumb_up,
          ),
          label: "Populares"),
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.update,
          ),
          label: "Próximamente"),
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.star,
          ),
          label: "Mejor valoradas"),
    ]:
    [
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.thumb_up,
          ),
          label: "Populares"),
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.update,
          ),
          label: "Próximamente"),
      new BottomNavigationBarItem(
          icon: new Icon(
            Icons.star,
          ),
          label: "Mejor valoradas"),
    ];
  }

  void _changeMediaType(MediaType type){
    if(mediaType != type){
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _changeMediaList(){
    return (mediaType == MediaType.movie) ?
    <Widget>[
      new MediaList(movieProvider, "popular"),
      new MediaList(movieProvider, "upcoming"),
      new MediaList(movieProvider, "top_rated"),
    ]:
    <Widget>[
      new MediaList(showProvider, "popular"),
      new MediaList(showProvider, "on_the_air"),
      new MediaList(showProvider, "top_rated"),
    ];
  }

  void _navigationTapped(int page){
    _pageController?.animateToPage(page, duration: const Duration(milliseconds: 3), curve: Curves.ease);
  }
}
