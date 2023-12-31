import 'package:flutter/material.dart';
import 'package:movieapp_200559/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Stack(
              children: <Widget>[
                new FadeInImage.assetNetwork(
                  placeholder: "assets/img1.gif",
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                  fadeInDuration: Duration(milliseconds: 40),
                ),
                new Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Color.fromARGB(190, 90, 90, 90),
                    ),
                    constraints: new BoxConstraints.expand(height: 55.0),
                  ),
                ),
                new Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            media.title,
                            style: new TextStyle(
                                fontSize: 20,
                                fontFamily: 'Cormorant Garamond',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        new Container(
                          width: 300.0,
                          padding: const EdgeInsets.only(top: 4.0),
                          child: new Text(
                            media.getGenres(),
                            style: new TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )),
                new Positioned(
                    right: 5.0,
                    bottom: 10.0,
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(media.voteAverage.toString()),
                            new Container(width: 4.0),
                            new Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 250, 222, 129),
                              size: 16,
                            )
                          ],
                        ),
                        new Container(
                          height: 4.0,
                        ),
                        new Row(
                          children: <Widget>[
                            new Text(media.getRelaseYear().toString()),
                            new Container(
                              width: 4.0,
                            ),
                            new Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 16.0,
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
