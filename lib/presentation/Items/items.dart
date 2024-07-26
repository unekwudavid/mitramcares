import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mitramcares/presentation/homeScreen/Controller/controller.dart';
import 'package:mitramcares/presentation/homeScreen/model/homeScreen_model.dart';
import 'package:mitramcares/widgets/motion_loading_text.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

final HomeController homeController = Get.put(HomeController());

var arguments = Get.arguments;

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar(
    backgroundColor: Colors.blue[200],
    centerTitle: true,
    title: const Text('chroniclingAmerica',
        )
   ),

   body: 
   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1),
        child: Column(
          children: [
            const Text(
              'Items',
              style: TextStyle(
              fontSize: 20,
              color: Colors.grey
              ),
            ),
           const SizedBox(height: 15.0),
            Expanded(
              //future builder used when expecting data from a future function.
              child: FutureBuilder<Chronicles>(
                  future: homeController.documents,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            //shimmer effect ,while fetching data
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                     return  const Text('Error');
                    } else if (!snapshot.hasData) {
                      return ListView(children: const [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "We couldn't find any result!",
                              ),
                            SizedBox(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  right: 65.0, left: 65.0, top: 5.0),
                              child: Text(
                                "Please check your search for any typos or spelling errors, or try a different search term.",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                
                              ),
                            )),
                          ],
                        ),
                      ]);
                    }

                    return 
                   //list view builder widget used to dispaly fetched data on the screen 
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          Chronicles chronicles = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                        child: 
                        Column(
                          children: [
                            ListTile(
                            title: const Text('Essay',
                            style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text('${chronicles.items[index].essay}'),  
                            ),

                            const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('Place of publication',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),),
                            subtitle: Text(chronicles.items[index].placeOfPublication),  
                            ),
                            
                              const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('Start year',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                            subtitle: Text('${chronicles.items[index].startYear}'),  
                            ),

                              const SizedBox(height: 15.0),
                              
                          ListTile(
                            title: const Text('Publisher',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text('${chronicles.items[index].publisher}'),  
                            ),

                            const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('County',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                            subtitle: Text('${chronicles.items[index].county}')
                            ),

                            const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('Edition',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                          
                            ),
                            subtitle: Text('${chronicles.items[index].edition}')
                            ),
                            
                              const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('Frequency',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            
                            ),
                            subtitle: Text('${chronicles.items[index].frequency}')
                            ),

                              const SizedBox(height: 15.0),

                          ListTile(
                            title: const Text('Url',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                            subtitle: Text(chronicles.items[index].url,
                            )
                            ),
                              const SizedBox(height: 15.0),
                              
                          ListTile(
                            title: const Text('Id',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text(chronicles.items[index].id) 
                                   ) , 
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Subject',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                            subtitle: Text('${chronicles.items[index].subject}',
                             )
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('City',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                           subtitle: Text('${chronicles.items[index].city}'),
                            ),  const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Language',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                           subtitle: Text('${chronicles.items[index].language}'),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Title',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text(chronicles.items[index].title,
                          
                            ),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Holding Type',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                           subtitle: Text('${chronicles.items[index].holdingType}'),

                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('End Year',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                          subtitle: Text('${chronicles.items[index].endYear}'),

                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Alt Title',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text('${chronicles.items[index].altTitle}'),

                             ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Note',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                          subtitle: Text('${chronicles.items[index].note}'),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('lccn',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                           subtitle: Text(chronicles.items[index].lccn),

                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('State',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                            subtitle: Text('${chronicles.items[index].state}'),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Place',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                           subtitle: Text('${chronicles.items[index].place}'),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Country',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                            subtitle: Text(chronicles.items[index].country),

                             ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Type',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),
                            ),
                           subtitle: Text('${chronicles.items[index].type}'),

                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Title_Normal'),
                          subtitle: Text(chronicles.items[index].titleNormal),
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Oclc',
                             style: TextStyle(
                              color: Colors.blueAccent
                            ),

                            ),
                           subtitle: Text(chronicles.items[index].oclc),
                            ),


















                          
                          ],
                        )
                          );
                        }
                        ); 
                  }
                  ),
            ),
          ],
        ),
      ),

);

  }
}