#include <stdio.h>
#include "NumClass.h"

int main()
{
        int num1;
        int num2;
        int i;
        // printf("give me two number:");
        scanf("%d%d", &num1, &num2);

        printf("The Armstrong numbers are:");
        for (i = num1; i <= num2; i++)
        {

                int a = isArmstrong(i);
                if (a == true)
                {
                        printf(" %d", i);
                }
        }

        printf("\nThe Palindromes are:");
        for (i = num1; i <= num2; i++)
        {

                int b = isPalindrome(i);
                if (b == true)
                {
                        printf(" %d", i);
                }
        }
        printf("\nThe Prime numbers are:");
        for (i = num1; i <= num2; i++)

        {
                int c = isPrime(i);

                if (c == true)
                {
                        printf(" %d", i);
                }
        }

        printf("\nThe Strong numbers are:");
        for (int i = num1; i <= num2; i++)

        {
                int d = isStrong(i);

                if (d == true)
                {
                        printf(" %d", i);
                }
        }
        printf("\n");

        return 0;
}