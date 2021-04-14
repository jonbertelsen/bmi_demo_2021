package business.entities;

public class Sport
{
    private int sport_id;
    private String name;

    public Sport(int sport_id, String name)
    {
        this.sport_id = sport_id;
        this.name = name;
    }

    public int getSport_id()
    {
        return sport_id;
    }

    public String getName()
    {
        return name;
    }
}
