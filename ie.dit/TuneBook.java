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
            while ((l = inputStream.readLine()) != null)
            {
                System.out.println(l);
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