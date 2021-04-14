package web.commands;

import business.entities.BmiEntry;
import business.entities.User;
import business.exceptions.UserException;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ShowMyBmiPageCommand extends CommandProtectedPage
{
    BmiFacade bmiFacade;

    public ShowMyBmiPageCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        this.bmiFacade = new BmiFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        List<BmiEntry> bmiEntryList = bmiFacade.getBmiDataEntriesByUserId(user.getId());
        request.setAttribute("bmiEntryList", bmiEntryList);
        return pageToShow;
    }
}
