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
  displayProducts();

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
    println(product.name , product.price);
  }
}

void displayProducts()
{
  int count = products.size();
  float buffer = height * 0.05;
  float Pheight = (height - (buffer * 2)) / count;
  float wbuffer = width/2 * 0.1;
  float Pwidth = width / 2 * 0.5;
  float price;
  String Sprice;
  Product product;
  textSize(14);
  for(int i = 0; i < count; i++)
  {
    fill(255);
    product = products.get(i);
    rect(wbuffer,(Pheight * i) + buffer,wbuffer + Pwidth, Pheight - buffer );
    fill(0);
    text(product.name,(Pwidth * 0.3),(Pheight * i) + (Pheight * 0.7) );
    price = product.price;
    Sprice = nf(price,1,2);
    text(Sprice,(Pwidth),(Pheight * i) + (Pheight * 0.7) );
  }
  
  line(width/2, height * 0.1, width/2, height * 0.9);
    
}

void mousepressed()
{
  
}