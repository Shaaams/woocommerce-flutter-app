
class PaymentResponse{
  String id, status;


  PaymentResponse(this.id, this.status);

  PaymentResponse.fromJson(Map<String, dynamic> map){
    this.id     = map['id'];
    this.status = map['status'];
  }
}