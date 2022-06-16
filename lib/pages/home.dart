import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text('Responsive page'),
    );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
          child: (isLandScape)
              ? Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.4,
                      width: mediaQueryWidth * 0.8,
                      child: Image(
                          image: NetworkImage(
                              'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1597419259/p7p8q2zhuqmogijxjnnw.jpg')),
                    ),
                    Container(
                      height: bodyHeight * 0.6,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListView.builder(
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://picsum.photos/id/$index/200'),
                                ),
                                title: Text(faker.person.name()),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      height: bodyHeight * 0.5,
                      width: mediaQueryWidth * 0.7,
                      child: const Image(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png')),
                    ),
                    Container(
                      height: bodyHeight * 0.5,
                      child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/id/$index/200'),
                            ),
                            title: Text(faker.person.name()),
                          );
                        },
                      ),
                    ),
                  ],
                )),
    );
  }
}
