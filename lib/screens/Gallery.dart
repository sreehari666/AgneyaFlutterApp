import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'details_page.dart';
import 'package:aagneya_flutter_app/utilities/Url.dart';
int index=0;
Future imgState;
Future<List<ImageDetails>> getImage() async {
    Dio dio = new Dio();
    List<ImageDetails> _images = [];
    List<ImageDetails> _images_ = [];
    
    var res = await dio.get(URL+"/app-get-gallery-photos");
    print(res);
    print(res.data[0]);
    //var _data=res.data[0];
    //print(_data['_id']);
    var i=0;
    do{
      var _data=res.data[i];

      ImageDetails imgObject=ImageDetails(imagePath: URL+'/gallery-images/'+_data['_id']+'.jpg', details: _data['description']);

      _images_.add(imgObject);

      i=i+1;
      if (res.data.length == i) {
        _images = _images_;
        break;
      }

    }while(res.data[i] != null);
    print(_images);
    return(_images);
  }





class GalleryPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFFFF9800)),
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: 
      SafeArea(
        child:FutureBuilder(
          future: getImage(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            
            print('snap');
            //print(snapshot.data[0].imagePath);
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator(
                      
                  )));
            }else{
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF9800),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: snapshot.data[index].imagePath,
                              
                              details: snapshot.data[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              //image: AssetImage(_images[index].imagePath),
                              image: NetworkImage(snapshot.data[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              ),
            )
          ],
        );
          }
          }
        ),
      ),
    
    );
  }
}

class ImageDetails {
  final String imagePath;
  
  final String details;
  ImageDetails({
    @required this.imagePath,
    
    @required this.details,
  });
}