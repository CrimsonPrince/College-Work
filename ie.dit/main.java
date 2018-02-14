package ie.dit;
import java.util.ArrayList;

ArrayList<Tune> tunes = new ArrayList<Tune>();

public class TuneBook {

    public TuneBook(String Filename)
    {
        this.Filename = Filename;


        BufferedReader inputStream = null;
        try {
            inputStream = new BufferedReader(new FileReader(Filename));

            String l;
            while ((l = inputStream.readLine()) != null) {
                while (l.substring(0, 2) != "X:") {

                    int count = 0;
                    if(l.substring(0,2) == "T:" && count == 0)
                    {
                        Tune tune = new Tune();
                        tune.setTitle(l)
                    }
                    if(l.substring(0,2) == "T:" && count == 1)
                    {

                    }
                }
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        finally
        {
            if (inputStream != null) {
                try
                {
                    inputStream.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        }
    }

}