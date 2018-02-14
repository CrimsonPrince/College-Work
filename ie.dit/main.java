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
                if(l.substring(0,2) == "X:")
                {
                    Tune tune = new Tune();
                    tune.setX(substring(3,3));
                }

                while (l.substring(0, 2) != "X:") {

                    int count = 0;
                    if(l.substring(0,2) == "T:" && count == 0)
                    {

                        tune.setTitle(l)
                        count = 1;
                    }
                    if(l.substring(0,2) == "T:" && count == 1)
                    {
                        tune.setaltTitle(l);
                        count = 2;
                    }
                    if(count = 1)
                    {
                        tune.setaltTitle(null);

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