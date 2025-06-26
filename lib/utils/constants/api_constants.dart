/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "http://172.201.110.216:5000";

static _EndPoints endPoints=_EndPoints();

}
class _EndPoints{
   //User
   final String login="/api/User/login";//True
   final String editPassword="/api/User/edit-password";//True
//Driver
   final String getPendingOrders="/api/Driver/get-pending-orders";//True
   final String startJob="/api/Driver/start-job";//True
   final String endJob="/api/Driver/EndJob";
   final String acceptOrder="/api/Driver/accept-order";//True
   final String getActiveOrder="/api/Driver/get-active-order";//True
   final String arrivedLocation="/api/Driver/arrived-location";
   final String startServicingOrder="/api/Driver/start-servicing-order";
   final String completeOrder="/api/Driver/complete-order";
   final String getMyOrders="/api/Driver/get-my-orders";//True
   final String cargoTank="/api/Driver/cargo-tank";//True
   final String updateDriverLocation="/api/Driver/update-driver-location";
   final String getDriverStatus="/api/Driver/get-driver-status";//True
   final String getActiveOrderStatus="/api/Order/get-active-order-status";


   //city
   final String getCities="/api/City/get-cities";

   //Neighborhood
   final String getNeighborhood="/api/Neighborhood/get-neighborhood";

   final String getGasStations="/api/GasStation/get-gas-stations";//True
   final String refill="/api/TankRefill/refill";
   final String refillCargoTank="/api/TankRefill/refill-cargo-tank";//True
   final String refillFuelTank="/api/TankRefill/refill-fuel-tank";//True

   final String getProfile = "/api/User/get-profile";



}