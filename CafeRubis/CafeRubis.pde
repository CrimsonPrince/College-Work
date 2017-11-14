/* 
 Arthur Coll
 C16406984 
 */


ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();


void setup()
{
  size(800, 600);
  loaddata();
  printProducts();
}

void loaddata()
{
  Table table = loadTable("cafe.csv", "header");
  for (TableRow row : table.rows())
  {
    Product product = new Product(row);    
    products.add(product);
  }
}

void printProducts()
{
  for(Product product : products)
  {
    println(product);
  }
}