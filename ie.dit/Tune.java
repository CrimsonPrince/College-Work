package ie.dit;

public class Tune {

    private int x;
    private String title, altTitle, notation;


    public int getX() {
        return x;
    }

    public String getTitle()
    {
        return title;
    }

    public String getAltTitle()
    {
        return altTitle;
    }

    public String getNotation()
    {
        return notation;
    }

    public void setNotation(String notation) {
        this.notation = notation;
    }

    public void setAltTitle(String altTitle) {
        this.altTitle = altTitle;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public string toString
    {
        String s;
        s += x + ',' + title;
        if (altTitle != NULL)
        {
            s += altTitle;
        }
    }
}

