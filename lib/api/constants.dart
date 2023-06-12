class ApiConstants {
  final serviceKey = '67shxa42pm9ho574c6wq';
  final clientId = '0';

  Map<String, String> getHeader() => {
        'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*'

      };
  Map<String, String> getHeader1(String token) => {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

 // final baseUrl = 'http://103.38.50.82:8080/DoctorAppoinment/';

  final baseUrl = 'http://103.14.99.198:8082/BusBookingApp/api/';
  final imagebaseUrl = 'http://103.14.99.198:8082/Bus_Booking_Admin_APP/images/';

  String busUrl() => baseUrl + 'Buses/BusesList';

  String verifyLoginUrl() => baseUrl + 'Customer/Login';
  String AddBookingUrl() => baseUrl + 'Booking/addBooking';

  String bookingUrl() => baseUrl + 'Booking/BookingList/Customer';
  String getCategoryUrl() => baseUrl + 'ServicesForDashboardServlet';

  String getDocServiceUrl() => baseUrl + 'HospitalsAsPerServicesServlet';
  String getDocDetailsUrl() => baseUrl + 'InformationServlet';
  String getNotificationUrl() => baseUrl + 'NotificationDetailsServlet';
  String getOfferUrl() => baseUrl + 'OfferDetailsServlet';

  String getBookAppointmentUrl() => baseUrl + 'PatientDetailBookingServlet';

  String getSubServiceUrl() => baseUrl + 'SubServicesServlet';
  String getOtpUrl() => baseUrl + 'OtpApiServlet';
  String getReferalUrl() => baseUrl + 'ReferralCodeAgentServlet';
  String verifyOtpUrl() => baseUrl + 'OtpVerifyServlet';




/*  String addServiceUrl() => baseUrl + 'ServicesAddServlet';
  String viewServiceUrl() => baseUrl + 'ServiceView';
  String updateServiceUrl() => baseUrl + 'ServiceUpdate';
  String deleteServiceUrl() => baseUrl + 'ServiceDelete';*/

  //Reg

  final parmEmail = 'email';
  final paramMobile = 'mobile';
  final paramPassword ='password';
  final paramConfpassword ='conf_password';
  final paramName = 'name';

  //Reg

  final paramKeyword = 'keyWord';

  final paramSpecid = 'servicesId';

  final paramDocId= 'hospitalId';

  final paramMobileNum = 'number';

  final privacy = "By proceeding I agree to";
  final privacy1 = "Terms of Services";
  final privacy2 = "Privacy Policy";

/*  final paramBusinessname = 'Business_Name';
  final paramProfession = 'Profession';
  final paramGender ='Gender';
  final paramAddress ='Address';
  final paramCity ='City';
  final paramState ='State';
  final paramCountry ='Country';
  final paramPincode ='Pincode';
  final paramDate_of_Birth ='Date_of_Birth';
  final paramLanguage_Known ='Language_Known';*/




  final paramService_name = 'service_name';
  final paramDescriptions = 'descriptions';
  final paramService_period ='service_period';
  final paramFees ='fees';
  final paramDocument_required ='document_required';
  final paramWork_get ='work_get';
  final paramId ='id';

  final paramPName ='patientName';
  final paramPmob ='mobileNo';
  final paramPage ='patientAge';
  final paramPgen ='gender';
  final paramPemail ='emailId';
  final paramPdate ='selectedDate';
  final paramPtime ='selectedTime';
  final paramPdocid ='doctorId';



}
