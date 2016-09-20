import random as rd
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()

n = 10

first, second, third = [], [], []
for i in range(10000):
        
        first.append(rd.randrange(n))
        second.append(rd.randrange(first[-1], n))
        third.append(rd.randrange(second[-1], n+1))


sns.distplot(first, hist=False)
sns.distplot(second, hist=False)
sns.distplot(third, hist=False)

plt.show()

