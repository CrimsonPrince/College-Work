/* Arthur Coll CA 2 Assignment V3   :26/10/16   :C16406984   :Date: 13/11/16

This is a simple Menu driven program which checks a user entered code against that of a preset code, the codes are encrypted before they are compared to mantain security..
There is also an option to decrypt the code entered if the user wishes too and check how many times the pin has been entered.
The defualt pin is 1234 
*/

#include <stdio.h>



void entercode(int *);//Function used to enter the code
void encrypt(int[], int *, int *);//Function that Encrypts the code entered in the above function
void checker(int[], int *, int *);//This function checks the code which was entered and encrypted above matches the defualt one
void decrypt(int *);//This one decrypts the code entered
void verifier(int *, char *, int[], int *, int *); //This is used to check whether options are allowed to be run or not
void info(int *, int *);


#define SIZE 4//Universal Size for the Pin, can be changed to allow larger pins, encyrption will be weakened however


int main()
{ 
    int counter = 0 ;// this variable is used to track the number of correct attempts made to do the code
    int Icounter = 0 ; //This  variable is used to track the ammount of incorrect attempts to enter code
    char option; //This is used as the variable that stores the option the user picks on the menu
    int code[SIZE];  //This array stores the code entered by  the user in option 1
    int toggle = 0; //Toggle is used to control whether a user is allowed to pick certain menu actions or not.
    int i;
    
    
    // Displays Menu screen While option 5 is not picked
    do {
        printf("\nArthurs Encryption Device \n");
        printf("Please Select an option from the menu \n \n");
        
        printf("1.Enter Code \n");
        printf("2.Encrypt Code \n");
        printf("3.Decrypt Code \n");
        printf("4.To see how many times code has been entered correctly and Incorrectly \n");
        printf("5.Exit Program \n");
        
        flushall(); //This is used to clear the getchar to prevent the menu from looping
        option = getchar(); //Char Used to prevent whitespaces affecting loop on switch
        printf("\n");
       
    
        switch(option) // Switch Provides Menu functionality
        {
            // Starts Option 1 and Confirms the Pin entered matches stored default pin of 1234
            case '1': 
                verifier(&toggle, &option, code, &counter, &Icounter);
                break;
            
            // Starts Option 2 and Allows user to encrypt and check pin
            case '2':
                verifier(&toggle, &option, code, &counter, &Icounter);
                break;
            //Enters verifier function then brings the user to Decrypt function to Decrypt code entered
            case '3': 
                verifier(&toggle, &option, code, &counter, &Icounter);
                break;
            
            // Prints the Counters displaying the number of times pins have been entered
            case '4': 
				info(&Icounter, &counter);
                break;
            //Option ends the program
            case '5': 
                printf("Program Ending Goodbye");
                break;
            
            
            // Prints Invalid input if a value not in the menu is printed.
            default: 
                printf("Invalid Input, Please pick a valid option \n");
                break;
            }
        
    } while(option != '5'); //This is to allow exiting from the program when 4 is pressed for graceful termination.
    
    for( i = 0; i < SIZE; i++)
    {
        printf("%d", *(code + i));
    }
    flushall();
    getchar();
return(0);
}

//This the the entering code function where the usert enters the code to be used later in the program
void entercode(int code)
{ 
   int i;
    
    flushall();
    for (i=0; i<SIZE; i++) //This loop asks the user to enter the code digit by digit and validates the input to ensure only digits are entered.
    { 
      printf("Please enter digit %d \n", i); 
      scanf("%d", (code + i)); //Codes are scanned here
   
        if( (*(code + i)) > 0 && (*(code + i)) < 9  )//Inputs are validated here
        {
            printf("Right");
        }
        else 
        {
            i= -1;//Set to -1 so the for loop restarts at 0 instead of 1
            printf("Invalid symbol entered try entering code again \n");
            
        }
    }
    
    printf("Code Entered \n");
}

//This is the function where the code entered in encrypted
void encrypt(int uncode[], int *counter, int *Icounter)
{
    int tmp;
    int i;
    
    //This is the Encryption algorithim asked for in the specification, digits are swapped here
    tmp = *(uncode + 0);
    *(uncode + 0) = *(uncode + 2);
    *(uncode + 2) = tmp;
    
    tmp = *(uncode + 1);
    *(uncode + 1) = *(uncode + 3);
    *(uncode + 3) = tmp;
    
    //This is where the the numbers that exceed 9 are turned into 0's
    for(i=0;i<SIZE;i++)
    {
        *(uncode + i) = *(uncode + i) + 1;
        
        if(*(uncode + i) > 9)
        {
            *(uncode + i) = 0;
        }
    }
    
    //The function that checks the inputs against the codes is called here
    checker(uncode, counter, Icounter);
    
}
   
//This is the checker function which compares the encrypted code with that of the defualt encrypted code
void checker(int enteredcode[], int *counter, int *Icounter)
{
    int access_code[4] = {4,5,2,3};//This is the default encypted code
    int i,j = 0;
    
    //Loop used to compare the access code and with the one stored in array
    for(i=0;i<SIZE;i++) 
    {
        if( *(enteredcode + i) == *(access_code + i))
        {
            j++;
        }
    }
    
    // This statement ensures counter is set to 4 matching the number of elements in the code otherwise it gets rejected
    if(j == 4)
    {
        printf("CORRECT CODE \n");
        *counter = *counter + 1;//Counter used to track correct pin entries
    }
    else 
    {
        printf("ERROR CODE \n");
        *Icounter = *Icounter + 1; //Counter used to track incorrect pin entries
    }
    
}

//Decrypt function used to decrypt the code entered by the user
void decrypt(int uncode[])
{
    int tmp;
    int i;
    
    
    //Below is the decrytpion algorithim that was supplied which is the inverse of the encryption algorithim
    for(i=0;i<SIZE;i++)
    {
        *(uncode + i) = *(uncode + i) - 1; 
        
        if(*(uncode + i) == -1)
        {
            *(uncode + i) = 9;
        }
    }
    
    //This is where the swapping of numbers happens, it's the inverse of the encryption algoritihim
    tmp = *(uncode + 2);
    *(uncode + 2) = *(uncode + 0);
    *(uncode + 0) = tmp;
    
    tmp = *(uncode + 3);
    *(uncode + 3) = *(uncode + 1);
    *(uncode + 1) = tmp;
    
    //This is used to print the decrypted code
    for( i=0; i<SIZE; i++)
    {
        printf("%d", *(uncode + i));
    }
    
    printf("\n");//This is used for astetic purposes to make the menu look clean
    
    flushall();
}

//This function controls which options the user can select at various times
void verifier(int *toggle, char *option, int code, int *counter, int *Icounter)
{
    //This switch statement is similar to the menu above and deals with the 3 restricted options
    switch(*option)
    {
        //Case 1 calls the enter code function no matter what, they can always enter a code if they wish 
        case '1':
        {
            entercode(code);
            *toggle = 1;
            break;
        }
        
        //Case 2 deals with the encryption function it will excute if the toggle is  = 1 otherwise it will display an error
        case '2':
        {
            flushall();
            if(*toggle == 3)//This check if the toggle is = 3 meaning it has been encrypted already
            {
                printf("Code is already encrypted cannot Encrypt it again \n");
                break;
            }
            else if( *toggle == 0)//This checks if the toggle is  = 0 meaning the code has not been entered
            {
                printf("You need to enter a code to encrypt one \n");
                break;
            }
            else
            {
                encrypt(code, counter, Icounter);
                *toggle = 3;
                break;
            }
        }
        
        //Case 3 is the Decryption function it will only excute provided a code has been entered and encrypted
        case '3':
        {
            flushall();
            if( *toggle == 1)// This checks if the toggle is  = to 1 meaning a code has been entered but has not been encrypted
            {
                printf("The code needs to be Encrypted to be Decrypted, please encrypt a code first \n");
                break;
            }
            else if( *toggle == 0)// This checks if the toggle is 0 meaning no code has been entered
            {
                printf("You need to enter a code to decrypt one \n");
                break;
            }
            else
            {
                decrypt(code);
                *toggle = 3;
                break;
            }
        }
    }
}

//This function used to provide info on how many times pin entered
void info(int *incorrect, int *correct)
{
	printf("You have entered your pin correctly %d Times \n", *correct);
	printf("You have entered your pin incorrectly %d Times \n", *incorrect);
}