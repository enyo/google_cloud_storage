part of asn1lib;


class ASN1Boolean  extends ASN1Object {

  bool _boolValue;


  static final ASN1Boolean ASN1TrueBoolean = new ASN1Boolean(true);
  static final ASN1Boolean ASN1FalseBoolean = new ASN1Boolean(false);


  bool get booleanValue => _boolValue;

  ASN1Boolean(this._boolValue):super(tag:BOOLEAN_TYPE) {
    encode();
  }


  ASN1Boolean.fromBytes(Uint8List bytes) {
    _encodedBytes = bytes;
    _initFromBytes();
    var b = bytes[valueStartPosition];
    _boolValue = (b == BOOLEAN_TRUE_VALUE);
  }

  Uint8List encode() {
    _encodedBytes = new Uint8List(3);
    _encodedBytes[0] = BOOLEAN_TYPE;
    _encodedBytes[1] = 0x01;
    _encodedBytes[2] = ( _boolValue == true ? BOOLEAN_TRUE_VALUE : BOOLEAN_FALSE_VALUE);
    return _encodedBytes;
  }

}
