class Service {
  Service({required this.servicename, required this.Price});
  final String servicename;
  final int Price;
}

class services {
  static List<Service> serv = [
    Service(servicename: 'Washing', Price: 100),
    Service(servicename: 'Drying', Price: 100),
    Service(servicename: 'Ironing', Price: 100),
    Service(servicename: 'Wash & Iron', Price: 100),
    Service(servicename: 'Dry Cleaning', Price: 100),
    Service(servicename: 'Folding', Price: 100),
    Service(servicename: 'Fluff & Fold', Price: 100),
    Service(servicename: 'Strain', Price: 100),
    Service(servicename: 'Stain Removal', Price: 100),
  ];
}
