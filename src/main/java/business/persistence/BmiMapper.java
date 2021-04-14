package business.persistence;

import business.entities.BmiEntry;
import business.entities.Sport;
import business.entities.User;
import business.exceptions.UserException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BmiMapper
{
    private Database database;

    public BmiMapper(Database database)
    {
        this.database = database;
    }

    public List<BmiEntry> getBmiDataEntriesByUserId(int userId) throws UserException
    {
        List<BmiEntry> bmiEntryList = new ArrayList<>();

        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM bmi_entry WHERE user_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("bmi_entry_id");
                    int height = rs.getInt("height");
                    int weight = rs.getInt("weight");
                    String category = rs.getString("category");
                    double bmi = rs.getDouble("bmi");
                    String gender = rs.getString("gender");
                    Timestamp ts = rs.getTimestamp("created");

                    bmiEntryList.add(new BmiEntry(
                            id, height, weight, category, bmi, gender, ts));
                    // TODO: Execute methods to add:
                    // sport
                    // hobby
                    // user

                }
                return bmiEntryList;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
    }


    public List<BmiEntry> getAllBmiDataEntries() throws UserException
    {
        List<BmiEntry> bmiEntryList = new ArrayList<>();

        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM bmi_entry;";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("bmi_entry_id");
                    int height = rs.getInt("height");
                    int weight = rs.getInt("weight");
                    String category = rs.getString("category");
                    double bmi = rs.getDouble("bmi");
                    String gender = rs.getString("gender");
                    Timestamp ts = rs.getTimestamp("created");

                    bmiEntryList.add(new BmiEntry(
                            id, height, weight, category, bmi, gender, ts));
                    // TODO: Execute methods to add:
                    // sport
                    // hobby
                    // user

                }
                return bmiEntryList;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
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
        try (Connection connection = database.connect())
        {
            String sql =
            "INSERT INTO `bmi`.`bmi_entry` " +
            "(" +
            "`height`," +
            "`weight`," +
            "`category`," +
            "`bmi`," +
            "`gender`," +
            "`sport_id`," +
            "`user_id`) " +
            "VALUES (?,?,?,?,?,?,?);";

            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setDouble(1, height);
                ps.setDouble(2, weight);
                ps.setString(3, category);
                ps.setDouble(4, bmi);
                ps.setString(5, gender);
                ps.setInt(6, sport_id);
                ps.setInt(7, user_id);
                ps.executeUpdate();
                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int bmiEntryId = ids.getInt(1);

                // TODO: Her skal vi indsætte hobbyer i link_hobby_bmi_entry tabellen
                for (Integer hobbyId : hobbyList)
                {
                    insertIntoLinkHobbyBmiEntry(bmiEntryId, (int)hobbyId);
                }

            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }

    public void insertIntoLinkHobbyBmiEntry(int bmiEntryId, int hobbyId) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql =
                    "INSERT INTO link_bmi_hobby " +
                    "(`hobby_id`, " +
                    "`bmi_entry_id`) " +
                    "VALUES (?,?);";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, hobbyId);
                ps.setInt(2, bmiEntryId);
                ps.executeUpdate();
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }

    public int deleteSport(int sportId) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "DELETE FROM sport " +
                    "WHERE sport_id = ? AND " +
                    "sport_id NOT IN (SELECT sport_id FROM bmi_entry)";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, sportId);
                int rowsAffected = ps.executeUpdate();
                return rowsAffected;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException(ex.getMessage());
        }
    }


    public List<Sport> getAllSports() throws UserException
    {
        List<Sport> sportList = new ArrayList<>();

        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM sport";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    int id = rs.getInt("sport_id");
                    String name = rs.getString("name");
                    sportList.add(new Sport(id, name));
                }
                return sportList;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
    }

    public Sport getSportById(int sportId) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "SELECT * FROM sport WHERE sport_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, sportId);
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {
                    int newId = rs.getInt("sport_id");
                    String name = rs.getString("name");
                    return new Sport(newId, name);
                }
                throw new UserException("Sportsgren findes ikke for sport_id = " + sportId);
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
    }

    public int updateSport(int sportId, String name) throws UserException
    {
        try (Connection connection = database.connect())
        {
            String sql = "UPDATE sport SET name = ? WHERE sport_id = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setString(1, name);
                ps.setInt(2, sportId);
                int rowsInserted = ps.executeUpdate();
                return rowsInserted;
            }
            catch (SQLException ex)
            {
                throw new UserException(ex.getMessage());
            }
        }
        catch (SQLException ex)
        {
            throw new UserException("Connection to database could not be established");
        }
    }



}
