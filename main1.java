package ibm_eg;

// Java implementation of brute
// force solution.
import java.util.LinkedHashSet;
 
class NonRepeatingDigits
{
// Function to check if the given
// number has repeated digit or not
static int repeated_digit(int n)
{
    LinkedHashSet<Integer> s = new LinkedHashSet<>();
 
    // Traversing through each digit
    while (n != 0)
    {
    	
        int d = n % 10;
 
        // if the digit is present
        // more than once in the
        // number
        if (s.contains(d))
        {
            // return 0 if the number
            // has repeated digit
        	
            return 0;
        }
        s.add(d);
        n = n / 10;
    }
     
    // return 1 if the number has
    // no repeated digit
    return 1;
}
 
// Function to find total number
// in the given range which has
// no repeated digit
static int calculate(int L, int R)
{
    int answer = 0;
 
    // Traversing through the range
    for (int i = L; i < R + 1; ++i)
    {
 
        //// Add 1 to the answer if i has
        // no repeated digit else 0 System.out.println("n"+i);
        answer = answer + repeated_digit(i);
    }
 
    return answer;
}
 
// Driver Code
public static void main(String[] args)
{
    int L = 100, R = 120;
     //110,111,112,113,114,115,116,117,118,119
    // Calling the calculate
  //102,103,104,105,106,107,108,109,120
    System.out.println("NON REPEATING DEGITS "+ calculate(L, R));
}
}
