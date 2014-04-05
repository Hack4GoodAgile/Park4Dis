package parkfordis.model;

import java.util.HashMap;

public class ZonesMap extends HashMap<String, LatLng>{

    public ZonesMap() {
        put("Arquitectura", new LatLng(28.0726523, -15.45361290000000053));
        put("Hospital Doctor Negrin", new LatLng(28.1202944, -15.444732199999976));
        put("Aeropuerto", new LatLng(27.9331848, -15.387706600000001));
    }
}
