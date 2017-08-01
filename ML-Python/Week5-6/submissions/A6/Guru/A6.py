#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np
from scipy.io import loadmat
from sys import exit
from os.path import isfile
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import argparse
from sklearn.preprocessing import PolynomialFeatures
from sklearn import linear_model
from sklearn.decomposition import PCA
from sklearn.datasets import load_iris

def sigmoid(x):
    return (1.0/(1.0 + np.exp((-1.0)*x)))

def plotme(regression,ytypes,y,h=0.2):
    if regression[0].canPlot():
        new_x = regression[0].get_x()
        x_min, x_max = new_x[:, 1].min() - .5, new_x[:, 1].max() + .5
        y_min, y_max = new_x[:, 2].min() - .5, new_x[:, 2].max() + .5
        xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))

        fig1 = plt.figure("multi class")

        Z = [ regression[i].predict(np.c_[ xx.ravel(), yy.ravel()],scale=False) for i in range(ytypes.size)]

        colors = cm.plasma(np.linspace(0,1,ytypes.size))

        for i in range(ytypes.size):
            Z[i] = Z[i].reshape(xx.shape)
            plt.contour(xx, yy, Z[i],levels=[0.5],colors=( tuple(colors[i]) , 0 ))

        plt.scatter(new_x[:,1],new_x[:,2],c=y,cmap=cm.plasma)
        plt.xlim(xx.min(), xx.max())
        plt.ylim(yy.min(), yy.max())
        plt.xticks(())
        plt.yticks(())

        fig1.show()


class scale:
    def __init__(self, data):
        self.mean = np.mean(data,axis=0)
        self.std = np.std(data,axis=0)

    def scaling(self,data):
        data = (data - self.mean)/self.std
        return data

class Regression:

    def __init__(self):
        self.x = np.array([])
        self.y = np.array([])

    def fit(self, Features, Result, RegressionType, mapping = True):

        self.x     = Features
        self.type  = RegressionType
        self.y     = Result

        self.original_x = self.x

        self.Scale = scale(self.x)

        #self.x     = self.Scale.scaling(self.x)
        #self.x     = np.c_[np.ones(self.x.shape[0]),self.x]
        if self.type == 'logistic' and mapping:
            self.featureMaps = 6
            poly = PolynomialFeatures(self.featureMaps)
            self.x = poly.fit_transform(self.x)
            self.lam = 0.1

        else:
            self.lam = 0
        self.mapping = mapping
        self.Parameters = np.zeros(self.x.shape[1])
        self.Hypothesis = np.dot(self.x,self.Parameters)
        self.cost       = np.array([])
        self.precisionValue = 10**-10
        self.displayIteration = False

        if(self.type != 'logistic' and self.type != 'linear'):
            print("\n\nError: Can't find Regression Type")
            exit()
        if(self.type == 'logistic'):
            self.Hypothesis = sigmoid(self.Hypothesis)

    def canPlot (self):
        if self.original_x.shape[1] == 2:
            return True
        else:
            return False

    def calculateCost (self):
        m, n = self.x.shape
        if (self.type == 'linear'):
            error = self.Hypothesis - self.y
            cost = (np.sum((error)**2)/(2*error.size))
        if (self.type == 'logistic'):
            cost1 = (-1) * self.y * np.log(self.Hypothesis)
            cost2 = (1.0 - self.y) * np.log(1.0 - self.Hypothesis)
            cost = ((np.sum(cost1 - cost2) )/ m) + (0.5 * self.lam * sum(self.Parameters[1:] ** 2)) / m

        return cost

    def derivativeOf(self):
        error       = self.Hypothesis - self.y
        derivative  = np.dot(self.x.transpose(), error)
        if self.type == 'logistic' and self.mapping:
            derivative[1:] += 0.5 * self.lam * self.Parameters[1:]
        derivative /= self.y.shape[0]
        return derivative

    def setPrecisionValue(self,new_value):
        self.precisionValue = new_value

    def get_x(self):
        return self.x

    def minimize(self):
        LearningRate   = 1
        if(self.type == 'logistic'):
            LearningRate = 1
        iterations     = 0
        while True:
            self.Parameters = self.Parameters - LearningRate*(self.derivativeOf())
            self.Hypothesis = np.dot(self.x,self.Parameters)
            if(self.type == 'logistic'):
                self.Hypothesis = sigmoid(self.Hypothesis)
            self.cost       = np.append(self.cost, self.calculateCost())
            if (self.displayIteration):
                print(self.cost[iterations])
            if (iterations >= 1 ):
                if (self.cost[iterations] <= self.precisionValue):
                    break
                #if (abs(self.cost[iterations] - self.cost[iterations-1]) <= (self.precisionValue*self.cost[iterations])):
                #    break
                if (np.isnan(self.cost[iterations])):
                    iterations -= 1
                    break
                if ( self.cost[iterations] > self.cost[iterations - 1]):
                    LearningRate /= 10
                    if (self.displayIteration):
                        print ("\nLearning rate change: ", LearningRate)
                if (iterations > 10**4):
                    break
            iterations += 1
        #print("\nLearning rate: ", LearningRate)
    def verbose(self):
        self.displayIteration = True

    def hypothesis(self):
        return self.Parameters

    def niceOutput(self):
        print("\nThe Hypothesis Function is \n",self.Hypothesis)
        print("\nFinal Cost is ",self.cost[-1])


    def predict(self,data,scale=True):
        if scale:
            data       = self.Scale.scaling(data)
        #data       = np.c_[np.ones(data.shape[0]),data]
        poly = PolynomialFeatures(self.featureMaps)
        data = poly.fit_transform(data)
        prediction = np.dot ( data, self.Parameters)
        #if ( self.type == 'logistic'):
        #    prediction = sigmoid(prediction)
        return prediction

    def plotCost(self):
        plt.plot(self.cost)

def classfinder(y):
    ytypes = np.array([])
    for i in y:
        found = False
        for j in ytypes:
            if i == j:
                found = True
                break;
        if not found:
            ytypes = np.append(ytypes,i)
    return ytypes

def y_splitter(y,ytypes):
    new_y = [ y.copy() for i in ytypes]
    for i in range(0,ytypes.size):
        if (ytypes[i] == 0.0):
            new_y[i][new_y[i] != ytypes[i]] = 1.0
            new_y[i] = 1 - new_y[i]
        else:
            new_y[i][new_y[i] != ytypes[i]] = 0
            new_y[i][new_y[i] == ytypes[i]] = 1
    return new_y

def skcompare(X,y,args):

    if (args.RegressionType == 'logistic'):
        mapping = True
        if args.nomapping:
            mapping = False

        canPlot = False
        if X.shape[1] == 2:
            canPlot = True

        if mapping:
            poly = PolynomialFeatures(6)
            X = poly.fit_transform(X)

        ytypes = classfinder(y)

        if ytypes.size >= 2:
            logreg = linear_model.LogisticRegression(C=0.01,max_iter=10000)
            logreg.fit(X,y)
            if canPlot:
                h = 0.2

                x_min, x_max = X[:, 1].min() - .5, X[:, 1].max() + .5
                y_min, y_max = X[:, 2].min() - .5, X[:, 2].max() + .5
                xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
                Z = logreg.predict(poly.fit_transform(np.c_[xx.ravel(), yy.ravel()]))

                # Put the result into a color plot
                Z = Z.reshape(xx.shape)
                plt.figure(1, figsize=(4, 3))
                plt.pcolormesh(xx, yy, Z, cmap=cm.plasma)

                # Plot also the training points
                plt.scatter(X[:, 1], X[:, 2], c=y, edgecolors='k', cmap=cm.plasma)
                plt.xlabel('Sepal length')
                plt.ylabel('Sepal width')

                plt.xlim(xx.min(), xx.max())
                plt.ylim(yy.min(), yy.max())
                plt.xticks(())
                plt.yticks(())

                plt.show()


def multi_class(x,y,args):
    if(args.RegressionType == 'logistic'):
        ytypes = classfinder(y)
        if ytypes.size == 2:
            print ("\n\nBinary Classification for ",ytypes)
            ytypes = ytypes[:-1]
        else:
            print ("\n\nAll vs One Classification for", ytypes)
        split_y = y_splitter(y,ytypes)
        regression = [Regression() for i in ytypes]
        h = 0.2
        mapping = True
        for i in range(ytypes.size):
            if args.nomapping:
                mapping = False
            regression[i].fit(x,split_y[i],args.RegressionType,mapping)
            if args.verbose:
                regression[i].verbose()
            print ("\n\nMinimizing for class ", ytypes[i])
            regression[i].minimize()
            regression[i].niceOutput()
        plotme(regression,ytypes,y)

    if(args.RegressionType == 'linear'):
        regression = Regression()
        regression.fit(x,y,args.RegressionType)
        if args.verbose:
            regression.verbose()
        regression.minimize()
        print("\n\nThe Hypothesis Function is \n",regression.hypothesis())
        predicted = 0
        if args.test_file is not None :
            if isfile(args.test_file):
                test_data  = pd.read_csv(args.test_file,header = 0)
                test_data  = test_data.values
                prediction = regression.predict(test_data)
                test_data = np.c_[test_data,prediction]
                predicted = 1
                print ("\n\nPredictions complete.")

                if args.verbose:
                    print ("\n\n", test_data)
            else:
                print ("\n\nERROR: Invalid --predict argument. File doesn't exist.")

        if args.output_file is not None :
            if predicted is 1 :
                np.savetxt(args.output_file,test_data,delimiter=",")
            else :
                np.savetxt(args.output_file,regression.hypothesis(),delimiter=",")

        print ("\n\nThe ouput file <",args.output_file,"> has been created.")

        print ("\n\nShowing Cost Plot ...")

        fig2 = plt.figure("Cost Plot")
        regression.plotCost()
        fig2.show()

        #skcompare(x,y,args.RegressionType)

def main():

    parser = argparse.ArgumentParser(description = 'This is a regression algorithm')
    parser.add_argument('-v','--verbose', help = 'displays more details.', action="store_true")
    parser.add_argument('-p','--predict', help='to add a csv file that holds input data whose output values need to be predicted', dest='test_file', metavar='data_file')
    parser.add_argument('-nm','--nomapping', help='Switch off feature mapping',action = "store_true")
    parser.add_argument('RegressionType', help='what type of regression algorithm to use')
    parser.add_argument('train_file', help='to input the csv file with the data to be trained on')
    parser.add_argument('-o','--output_file', help='to input the file name used to store the prediction data or the hypothesis function (depending on whether --predict is used or not)', metavar='file_name')
    args = parser.parse_args()

    if args.train_file == 'iris':
        iris = load_iris()
    	# Reduce iris data from 4 dimensions to 2 for ease of plotting
        pca = PCA(n_components=2).fit(iris.data)
        pca_2d = pca.transform(iris.data)
        y = iris.target
        x = pca_2d

    elif args.train_file == 'mnist':
        mnist = loadmat('mnist.mat')
        x = np.array(mnist['X'])
        y = np.array(mnist['y'])
        y = np.reshape(y,y.shape[0])

    else:
        train_data = pd.read_csv(args.train_file,header = 0)
        y = train_data.iloc[:,-1]
        y = y.values
        train_data = train_data.iloc[:,:-1]
        x = train_data.values


    #multi_class(x,y,args)
    skcompare(x,y,args)
    input()
if __name__ == "__main__":
    main()
