import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score

dataset = pd.read_csv('Iris.data', header=None)

input = dataset.iloc[:, :-1].values
output = dataset.iloc[:, -1].values

x_train, x_test, y_train, y_test = train_test_split(input, output, test_size=0.3)

model = KNeighborsClassifier(n_neighbors=3)
model.fit(x_train, y_train)

y_pred = model.predict(x_test)

accuracy = accuracy_score(y_test, y_pred)

print(accuracy)