package web.commands;

import business.entities.BmiEntry;
import business.exceptions.UserException;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ShowBmiPageCommand extends CommandProtectedPage
{
    BmiFacade bmiFacade;

    public ShowBmiPageCommand(String pageToShow, String role)
    {
        super(pageToShow, role);
        this.bmiFacade = new BmiFacade(database);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws UserException
    {
        List<BmiEntry> bmiEntryList = bmiFacade.getAllBmiDataEntries();
        request.setAttribute("bmiEntryList", bmiEntryList);
        return pageToShow;
    }
}
