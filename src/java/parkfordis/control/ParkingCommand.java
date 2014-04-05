package parkfordis.control;

import hivelibrarymodel.Parking;
import loaders.ParkingLoader;
import parkfordis.model.LatLng;
import parkfordis.model.ZonesMap;

public class ParkingCommand extends FrontCommand{

    @Override
    public void process() {
        String zone = request.getParameter("zone");
        Parking parking = new ParkingLoader().load(zone);
        LatLng position = new ZonesMap().get(zone);
        request.setAttribute("parking", parking);
        request.setAttribute("position", position);
        forward("/index.jsp");
    }
}
