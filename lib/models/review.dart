import 'package:goshopwooapp/contracts/base_model.dart';
import 'package:goshopwooapp/exceptions/exceptions.dart';
//Implementation of the Interface
class Review implements BaseModel{
  // All Properties
  int id, product_id, rating;
  String status, reviewer, reviewer_email, review;
  List<String> reviewer_avatar_url;

  // Named Constructor to receive All Properties from Api
  Review.fromJasonMap(Map<String, dynamic> map){
      if(map['id']== null){
        throw PropertyIsRequired( 'Review', map['id']);
      }

      this.id          = map['id'];

      if(map['product_id']== null){
        throw PropertyIsRequired( 'Review' , map['product_id']);
      }
      this.product_id          = map['product_id'];
      this.status              = map['status'];
      this.reviewer            = map['reviewer'];
      this.reviewer_email      = map['reviewer_email'];
      this.review              = map['review'];
      //this.reviewer_avatar_url =

    // ToDo: I Think this is wrong
    // ToDo: Check it out in implementation
    throw Exception(' Review Type Need To Be Checked First');
  }

  // Convert Method From jsonObject To Map
  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    return null;
  }

}