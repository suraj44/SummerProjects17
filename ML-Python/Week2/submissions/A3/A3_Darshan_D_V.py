import numpy as np
def sum(w0,w1,w2,w3,w4,p) :
    J=0.0
    count=0.0
    list=np.genfromtxt('.//train_data.csv',delimiter=',',dtype=float)
    for i in range(1,len(list)):
        x1=list[i,0]
        x2=list[i,1]
        x3=list[i,2]
        x4=list[i,3]
        y=list[i,4]
        if p==0 :
            J+=(w0+w1*x1+w2*x2+w3*x3+w4*x4-y)
        elif p==1:
            J+=(w0+w1*x1+w2*x2+w3*x3+w4*x4-y)*x1
        elif p==2:
            J+=(w0+w1*x1+w2*x2+w3*x3+w4*x4-y)*x2
        elif p==3:
            J+=(w0+w1*x1+w2*x2+w3*x3+w4*x4-y)*x3
        elif p==4:
                J+=(w0+w1*x1+w2*x2+w3*x3+w4*x4-y)*x4
        count=count+1
    J=J/count
    return J
w0=1.0
w1=1.0
w2=2.0
w3=1.0
w4=3.0
a=0.2
list=np.genfromtxt('.//train_data.csv',delimiter=',',dtype=float)
for i in range(10**5):
        q=w0-a*sum(w0,w1,w2,w3,w4,0)
        w=w1-a*sum(w0,w1,w2,w3,w4,1)
        e=w2-a*sum(w0,w1,w2,w3,w4,2)
        r=w3-a*sum(w0,w1,w2,w3,w4,3)
        t=w4-a*sum(w0,w1,w2,w3,w4,4)
        if q==w0 and w==w1 and e==w2 and r==w3 and t==w4:
            break
        else:
            w0=q
            w1=w
            w2=e
            w3=r
            w4=t
    
print 'w0= ',w0,'\n','w1= ',w1,'\n','w2= ',w2,'\n','w3= ',w3,'\n','w4= ',w4,'\n','Output:','\n'
list1=np.genfromtxt('.//test_input.csv',delimiter=',',dtype=float)
for i in range(1,len(list1)):
        x1=list1[i,0]
        x2=list1[i,1]
        x3=list1[i,2]
        x4=list1[i,3]
        y=w0+w1*x1+w2*x2+w3*x3+w4*x4
        print y