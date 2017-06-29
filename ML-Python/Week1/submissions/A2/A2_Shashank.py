
# coding: utf-8

# In[1]:

def hist(len):
    no_intervals = 10 // len
    if 10 % len != 0:
        no_intervals += 1
    for i in range(0, no_intervals):
        c = 0
        for j in range(len * i + 1, len * i + len + 1):
            if j > max:
                break
            c += count[j]
        s1 = str(len*i + 1) + " - " + str(len*i + len)
        s2 = str('-' * c)
        print(s1.center(15, ' '), s2.ljust(0))
    print("\n")


# In[5]:

mylist = [int(x) for x in input().split()]  # Enter space separated integers

count = []
min = 1
max = 10
for i in range(min, (max + 2)):
    count.append(0)
for i in mylist:
    count[i] = count[i] + 1


# In[6]:

hist(2)
hist(10)
hist(3)


# In[ ]:



