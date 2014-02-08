part of phonecat;

@NgController(
  selector: '[phone-list]',
  publishAs: 'ctrl',
  map: const {
    'phones': '=>phones'
  }
)
class PhoneListCtrl {
  Http _http;

  List<Map> phones = [];
  String orderProp = 'age';

  PhoneListCtrl(this._http) {
    this._http.get("./phones/phones.json").then((resp) {
      this.phones = resp.data;
    });
  }
}

@NgController(
  selector: '[phone-detail]',
  publishAs: 'ctrl',
  map: const {
    'phone': '=>phone',
    'mainImageUrl': '=>mainImageUrl'
  }
)
class PhoneDetailCtrl {
  Http _http;
  Map phone;
  String mainImageUrl;

  PhoneDetailCtrl(RouteProvider routeProvider, this._http) {
    String phoneId = routeProvider.parameters['phoneId'];
    this._http.get("./phones/$phoneId.json").then((resp) {
      this.phone = resp.data;
      this.mainImageUrl = this.phone['images'][0];
    });
  }
  
  set image(imageUrl) => mainImageUrl = imageUrl;
}
