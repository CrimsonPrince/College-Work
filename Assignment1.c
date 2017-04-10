/* Arthur Coll CA Assignment V3
26/10/16 
C16406984 */
#include <stdio.h>
#include <conio.h>
#include <windows.h>


#define LOW_PIN 0
#define MAX_PIN 10000
#define WAIT 500

int main()
{ 
    int inputPin, newpin, newpinC;
    int pin = 1234;
    int Ccounter = 0 ;
    int Icounter = 0 ;
    char option;
    
    
    // Displays Menu screen While option 4 is not picked
    do {
        clrscr(); 
        printf("Arthurs ATM Machine Menu \n");
        printf("Please Select an option from the menu \n \n");
        
        printf("1.Enter Pin \n");
        printf("2.Change Pin \n");
        printf("3.To see how many times pin has been entered correctly and Incorrectly \n");
        printf("4.Exit program \n");
        
        flushall();
        option = getchar();
        clrscr();
       
    
        switch(option)
        {
            // Starts Option 1 and Confirms the Pin entered matches stored default pin of 1
            case '1': 
                printf("Please enter your Pin \n");
                scanf("%d", &inputPin);
                    
                    if( pin == inputPin ) //If pin is equal to input then prints pin confirmed
                    { 
                        printf("The Pin entered is correct \n");
                        Ccounter++;
                        Sleep(WAIT);
                    }
                    
                    else // If pin is not equal to input pin, incorrect is printed.
                    { 
                        printf("The Pin entered is incorrect \n");
                        Icounter++;
                        Sleep(WAIT);
                    }
                    break;
            
            // Starts Option 2 and Allows user to change pin 
            case '2': 
                printf("Please enter your New pin now \n");
                scanf("%d", &newpin);
            
            // This statement verifies if the pin is within the range of 0 < X < 10000, if it is not within this range it is an invalid input and is rejected
                if( LOW_PIN < newpin && newpin < MAX_PIN)
                {
                    printf("Please confirm your New pin now \n \n");
                    scanf("%d", &newpinC);
                    
                    //this verifies whether the second pin entered matches the first, if it does then the changed is printed
                    if( newpin == newpinC)
                    {
                        printf("Pin Changed");
                        Sleep(WAIT);
                    }
                    
                    else
                    {
                        printf("Entered Pins do not match");
                        Sleep(WAIT);
                    }
                }
                
                //If the pin is not between the set values above, an error message is displayed by this Else statement.
                else
                { 
                    printf("The pin must be 4 numeric digits long");
                    Sleep(WAIT);
                }
                break;
            
            // Prints the Counters displaying the number of times pins have been entered.
            case '3': 
                printf("You have entered your pin incorrectly %d Times \n", Icounter);
                printf("You have entered your pin correctly %d Times \n", Ccounter);
                Sleep(WAIT + 1);
                break;
            
            // Activates exit function when 4 is selected by breaking out of loop.
            case '4': 
                printf("Program Ending, Goodbye \n");
                break;
            
            
            // Prints Invalid input if a value not in the menu is printed.
            default: 
                printf("Invalid Input, Please pick a valid option \n");
                Sleep(WAIT);
                break;

        }
        
    } while(option != '4');
    
return(0);
}