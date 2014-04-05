package parkfordis.control;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public abstract class FrontCommand {

    protected ServletContext context;
    protected HttpServletRequest request;
    protected ServletResponse response;

    public void init(ServletContext context, HttpServletRequest request, ServletResponse response) {
        this.context = context;
        this.request = request;
        this.response = response;
    }

    public void forward(String target) {
        RequestDispatcher dispatcher = context.getRequestDispatcher(target);
        try {
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(FrontCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public abstract void process();
}