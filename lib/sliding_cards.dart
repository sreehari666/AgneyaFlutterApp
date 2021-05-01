import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Abhinav',
            date: 'CSE ',
            assetName: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-nL0vJZ5DiB1ShuTJgy4G6el4YCqpgcTPww&usqp=CAU',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Yadhav',
            date: 'ECE',
            assetName: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ48D2NWeJiHWSLXi5ZkpBRwVQxKrsaNDyxg&usqp=CAU',
            offset: pageOffset - 1,
          ),
           SlidingCard(
            name: 'Alan',
            date: 'MECH',
            assetName: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWYI9DXmuiYoQMmaTQxbofs90cL3ZirpgE2g&usqp=CAU',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24,top: 15),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child:Image.network('$assetName', errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
        return Image.asset(
                'assets/default_person.jpeg',
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              );
         },),

              // child: Image.asset(
              //   'assets/default_person.jpeg',
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   alignment: Alignment(-offset.abs(), 0),
              //   fit: BoxFit.none,
              // ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          
          Row(
            children: <Widget>[
              SizedBox(height:30.0),
              Text("First prize in Oil painting",style: TextStyle(fontSize: 20)),
              // Transform.translate(
              //   offset: Offset(48 * offset, 0),
              //   child: RaisedButton(
              //     color: Color(0xFFEF6C00),
              //     child: Transform.translate(
              //       offset: Offset(24 * offset, 0),
              //       child: Text('Reserve'),
              //     ),
              //     textColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(32),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              // Spacer(),
              // Transform.translate(
              //   offset: Offset(32 * offset, 0),
              //   child: Text(
              //     '0.00 \$',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
             
            ],
          )
        ],
      ),
    );
  }
}