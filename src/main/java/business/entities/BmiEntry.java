package business.entities;

import java.sql.Timestamp;

public class BmiEntry
{
    private int id;
    private int height;
    private int weight;
    private String category;
    private double bmi;
    private String gender;
    private Sport sport;
    private User user;
    private Timestamp created;

    public BmiEntry(int id, int height, int weight, String category, double bmi, String gender, Timestamp created)
    {
        this.id = id;
        this.height = height;
        this.weight = weight;
        this.category = category;
        this.bmi = bmi;
        this.gender = gender;
        this.created = created;
        this.user = null;
        this.sport = null;
    }

    public void setSport(Sport sport)
    {
        this.sport = sport;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public int getId()
    {
        return id;
    }

    public int getHeight()
    {
        return height;
    }

    public int getWeight()
    {
        return weight;
    }

    public String getCategory()
    {
        return category;
    }

    public double getBmi()
    {
        return bmi;
    }

    public String getGender()
    {
        return gender;
    }

    public Sport getSport()
    {
        return sport;
    }

    public User getUser()
    {
        return user;
    }

    public Timestamp getCreated()
    {
        return created;
    }
}
