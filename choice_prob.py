import random as rd
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()
from collections import defaultdict

n = 10

picks = defaultdict(list)
for i in range(10000):
        
        picks['First'].append(rd.randrange(n))
        picks['Second'].append(
                rd.randrange(picks['First'][-1], n))
        picks['Third'].append(
                rd.randrange(picks['Second'][-1], n+1))


order = ['First', 'Second', 'Third']
for label in order:

        sns.distplot(picks[label], kde=False, label=label, hist_kws={'alpha':0.6})

plt.legend(loc='best')

plt.show()
