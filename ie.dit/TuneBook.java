package ie.dit;

import java.io.IOException;
import java.io.FileReader;
import java.util.ArrayList;
import java.io.BufferedReader;


public class TuneBook {

    ArrayList<Tune> tunes = new ArrayList<Tune>();

    public TuneBook(String Filename)
    {
        this.Filename = Filename;


        BufferedReader inputStream = null;
        try {
            inputStream = new BufferedReader(new FileReader(Filename));

            String l, s;
            while ((l = inputStream.readLine()) != null) {
                if(l.substring(0,2) == "X:")
                {
                    Tune tune = new Tune();
                    tune.setX(substring(3,3));


                if(!l.startsWith("X:")) {
                    //Count Variable used to keep track of whether or not the alt titles have been entered
                    int count = 0;
                    if(l.startsWith("T:") && count == 0)
                    {
                        //Sets count to one indicating that main title was recorded
                        tune.setTitle(l);
                        count = 1;
                    }
                    //Checking for if main title is recorded and a second Title has appeared
                    if(l.startsWith("T:") && count == 1)
                    {
                        tune.setaltTitle(l);
                        count = 2;
                        //Sets count to 2, to prevent altTitle from being set to null below
                    }
                    if(count == 1) {
                        tune.setaltTitle(null);

                    }

                    if(l.startsWith("K:"))
                    {
                    s += s + l;
                    }

                }
                    tune.setNotation(s);
                    s = null;
                    this.tunes.add(tune);
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


    public String toString(){
            StringBuffer tempBuffer = new StringBuffer();
            for(String tune:tunes){
    			// append all the Tunes
                tempBuffer.append(tune + "\n");
            }
            return tempBuffer.toString();
    }


public static void main(String[] args){
        TuneBook tb = new TuneBook("hnj0.abc");
        System.out.println(tb);
        }
}

