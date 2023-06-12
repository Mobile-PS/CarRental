
import 'package:car_rental/CustomRowComponent.dart';
import 'package:car_rental/models/BookingListModel.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandedTile extends StatelessWidget {
  const ExpandedTile({Key key, this.quotesResults})
      : super(key: key);

  final Data quotesResults;


  @override
  Widget build(BuildContext context) {


    buildCollapsed2() {
      return Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
          child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(children: [
           Column(
             crossAxisAlignment:
             CrossAxisAlignment.start,
             children: [
               Text(
                 'Booking No.',
                 style: TextStyle(fontSize: 18.0, color: Colors.black),
               ),
               Text(
                 quotesResults.id.toString(),
                 style: TextStyle(fontSize: 18.0, color: Colors.black),
               ),
             ],
           ),

         ],),


          SizedBox(height: 10,),
          CustomRowComponent(title: 'Customer Id',value: quotesResults.customerId),
          SizedBox(height: 5,),
          CustomRowComponent(title: 'Customer Name',value: quotesResults.customerName),
          SizedBox(height: 5,),
          CustomRowComponent(title: 'Mobile No',value: quotesResults.customerMob),
          SizedBox(height: 5,),
          CustomRowComponent(title: 'No Of Passenger',value: quotesResults.noOfPassenger),

          SizedBox(height: 10,),
      ],));

    }

    buildExpanded2() {
      return Container(
          margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking No.',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    Text(
                      quotesResults.id.toString(),
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ],
                ),

              ],),
              SizedBox(height: 10,),
              SizedBox(height: 10,),
              CustomRowComponent(title: 'Customer Id',value: quotesResults.customerId),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Customer Name',value: quotesResults.customerName),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Mobile No',value: quotesResults.customerMob),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'No Of Passenger',value: quotesResults.noOfPassenger),
              /*SizedBox(height: 5,),
              CustomRowComponent(title: 'Policy Start Date',value: '10 DEC 2021'),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Policy End Date',value: ' 09 DEC 2022'),*/
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Description',value: quotesResults.description),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'No. of Seater',value: quotesResults.seater),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Bus Type',value: quotesResults.type),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Booking Status',value: quotesResults.bookingStatus),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'From Date',value: quotesResults.fromDate),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'To Date',value: quotesResults.toDate),
              SizedBox(height: 5,),
              CustomRowComponent(title: 'Total Days',value: quotesResults.totalDate),
              SizedBox(height: 5,),
              SizedBox(height: 10,),

            ],));

    }


    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expandable(
                collapsed: buildCollapsed2(),
                expanded: buildExpanded2(),
              ),

              Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 15.0,bottom: 10),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller =
                          ExpandableController.of(context, required: true);
                      return
                        GestureDetector(onTap: () {
                          controller.toggle();

                        },child:
                        Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          controller.expanded ?
                          Text(
                            'View Lesser Details',
                            style: TextStyle(fontSize: 12.0, color: Colors.black,fontFamily:'CastelTBook'),
                          ):Text(
                            'View More Details',
                            style: TextStyle(fontSize: 12.0, color: Colors.black,fontFamily:'CastelTBook'),
                          ),

                      ],));


                       /* TextButton(
                        child: Text(
                          controller.expanded ? "COLLAPSE" : "EXPAND",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.deepPurple),
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );*/
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
