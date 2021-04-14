package business.services;

import business.entities.BmiEntry;
import business.entities.Sport;
import business.exceptions.UserException;
import business.persistence.BmiMapper;
import business.persistence.Database;

import java.util.List;

public class BmiFacade
{
    private BmiMapper bmiMapper;

    public BmiFacade(Database database)
    {
        this.bmiMapper = new BmiMapper(database);
    }

    public List<BmiEntry> getBmiDataEntriesByUserId(int userId) throws UserException
    {
        return bmiMapper.getBmiDataEntriesByUserId(userId);
    }

    public List<BmiEntry> getAllBmiDataEntries() throws UserException
    {
        return bmiMapper.getAllBmiDataEntries();
    }

    public void insertBmiEntry(
            double bmi,
            double height,
            double weight,
            String category,
            String gender,
            int sport_id,
            int user_id,
            List<Integer> hobbyList) throws UserException
    {
        bmiMapper.insertBmiEntry(bmi, height, weight, category, gender, sport_id, user_id, hobbyList);
    }

    public List<Sport> getAllSports() throws UserException
    {
        return bmiMapper.getAllSports();
    }

    public int deleteSport(int sportId) throws UserException
    {
        return bmiMapper.deleteSport(sportId);
    }

    public Sport getSportById(int sportId) throws UserException
    {
        return bmiMapper.getSportById(sportId);
    }

    public int updateSport(int sportId, String name) throws UserException
    {
        return bmiMapper.updateSport(sportId, name);
    }

}
