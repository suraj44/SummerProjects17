#include<stdio.h>
int main()
{
int x;
float y;
scanf("%d %f",&x,&y);
if(((x>=0)&&(x<=2000))&&((y>=0)&&(y<=2000)))
	{
	if(x%5==0)
		{
			if(x>=(y-0.5))
					{
							printf("%0.2f",y);
									}
										else
												{
														y=y-x;
																y=y-0.5;
																		printf("%0.2f",y);
																				}
																					}
																					else
																						printf("%0.2f",y);
																							}
																								return 0;
																								} 
