class PropertyIsRequired implements Exception{

String property;


PropertyIsRequired(this.property);

@override
  String toString() {
    return 'Property ${this.property} is required';
  }
}