package parkfordis.control;

import parkfordis.model.LatLng;

public class MainCommand extends FrontCommand{

    @Override
    public void process() {
        request.setAttribute("latlng", new LatLng(28.114382, -15.471510));
        forward("/index.jsp");
    }
}
