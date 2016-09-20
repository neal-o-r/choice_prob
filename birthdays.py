import random as rd
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()


def number_of_people():
        
        birthdays = []
        person = rd.randint(1, 365) # get a random birthday
        n_people = 1
        while person not in birthdays:
                
                birthdays.append(person)

                person = rd.randint(1, 365)       
                n_people += 1

        return n_people


number = []
for i in range(1000):

        number.append(number_of_people())

sns.distplot(number)
plt.show()

