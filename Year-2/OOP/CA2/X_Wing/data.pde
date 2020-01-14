class Data
{

  String name;
  String climate;
  String terrain;
  int population;

  Data(TableRow row)
  {
    name = row.getString("name");
    climate = row.getString("climate");
    terrain = row.getString("terrain");
    population = row.getInt("population");
  }
}