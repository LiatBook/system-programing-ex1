#include <stdio.h>
#include "NumClass.h"

int isPrime(int p)
{
        if (p == 1)
        {
                return true;
        }

        if (p % 2 == 0)
        {
                return false;
        }
        if (p < 1)
        {
                return false;
        }

        for (int i = 3; i <= p / 2; i++)
        {
                if (p % i == 0)
                {
                        return false;
                }
        }
        return true;
}

long factorial(int p)
{
        if (p == 0 || p == 1)
        {
                return true;
        }
        return p * factorial(p - 1);
}
int isStrong(int x)
{
        int duplicatex = x;
        int digitnum = 0;
        int sum = 0;
        while (duplicatex != 0)
        {
                digitnum = duplicatex % 10;

                sum = sum + factorial(digitnum);
                duplicatex = duplicatex / 10;
        }
        if (sum == x)
        {
                return true;
        }
        return false;
}