#include <stdio.h>
#include "NumClass.h"

long power(long, long);
int powerforamstrong(int);

int powerforamstrong(int p)
{
	int x = p;
	int count = 0;
	while (x != 0)
	{
		x = x / 10;
		count++;
	}
	return count;
}

long power(long base, long power)
{
	int sum = 1;
	for (int i = 1; i <= power; i++)
	{
		sum = base * sum;
	}

	return sum;
}

int isArmstrong(int p)
{
	int x = p;
	int currentdigit = 0;
	int sum = 0;
	int powero = powerforamstrong(p);
	while (x != 0)
	{
		currentdigit = x % 10;
		sum = sum + power(currentdigit, powero);
		x = x / 10;
	}
	if (sum == p)
	{
		return true;
	}
	return false;
}

int isPalindrome(int x)
{
	int duplicateX = 0;
	int sameasx = x;

	int remainder = 0;
	while (sameasx != 0)
	{
		remainder = sameasx % 10;
		duplicateX = duplicateX * 10 + remainder;
		sameasx = sameasx / 10;
	}
	if (x == duplicateX)
	{
		return true;
	}
	return false;
}