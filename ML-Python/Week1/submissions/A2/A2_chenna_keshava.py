import sys
s = raw_input("Enter a list of numbers for representation as histogram\n")

li = list(map(int,s.split()));
# s is a string, I  am converting it to a list of integers
# hist() function displays the histogram for the input data 
def hist(bin_size,li):
    li.sort();

    minimum = min(li)
    maximum = max(li)
    bin_size = bin_size - 1
    count = []
# count list contains the number of values  in each of the respective classes
# As many zeroes are appended into count list as there are number of classes

    lower_limit = minimum
    for i in range((maximum-minimum)/(bin_size+1)+1):
        count.append(0)
    
    
    ll = minimum
    k = 0

# ll is the lower limit of the classes

    for i in range(len(li)):
        if(li[i]<=ll + bin_size):
            count[k] = count[k] + 1
        else:
            k = k + 1
            count[k] = count[k] + 1
            ll = ll + bin_size + 1




    ll = minimum
    k = 0
    for value in count:
        

        
        sys.stdout.write(" [%d - %d] " %(ll,ll + bin_size))  
        sys.stdout.flush()
        for i in range(value):
            sys.stdout.write("-")
            sys.stdout.flush()


# sys.stdout.write() ans sys.stdout.flush() functions are used to ensure a newline is not inserted into the STDOUT(as is the  case with print() function).
        
        for i in range(20-value):
            sys.stdout.write(" ")
            sys.stdout.flush()

        sys.stdout.write(" %d elements" %value)
        
        
        ll = ll + bin_size + 1
        print ("\n")
        

        





while(True):
    j = raw_input("Enter the size of the class for the histogram representation\n")
    bin_size = int(j)
    hist(bin_size,li)
    c = raw_input("Enter \'y\' to continue, otherwise press \'n\'\n")
    if(c=='y' or c=='Y'):
        continue
    else:
        break

# user is to input different bin_sizes for the same list values.



    
    
