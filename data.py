from scipy.spatial.distance import cdist
from sklearn.preprocessing import normalize
from sklearn.datasets import fetch_mldata
from sklearn.cross_validation import train_test_split
from scipy.io import savemat

mnist = fetch_mldata('MNIST original')
X, y = mnist.data/255., mnist.target

X = normalize(X, axis=1, norm='l1')
X_train, X_test = X[:60000], X[60000:]
y_train, y_test = y[:60000], y[60000:]

# CV 1,
X_train_3000, X_test_1, y_train_3000, y_test_1 = train_test_split(X, y, test_size=0, train_size=10)

# CV 2,
X_train_5000, X_test_1, y_train_5000, y_test_1 = train_test_split(X, y, test_size=0, train_size=20)

# CV 3,
X_train_8000, X_test_1, y_train_8000, y_test_1 = train_test_split(X, y, test_size=0, train_size=50)

# CV 4,
X_train_12000, X_test_1, y_train_12000, y_test_1 = train_test_split(X, y, test_size=0, train_size=100)

# # CV 5,
# X_train_17000, X_test_1, y_train_17000, y_test_1 = train_test_split(X, y, test_size=0, train_size=1700)
#
# # CV 6,
# X_train_25000, X_test_1, y_train_25000, y_test_1 = train_test_split(X, y, test_size=0, train_size=2500)


dict_data = {
    'X_train_10': X_train_3000,
    'y_train_10': y_train_3000,
    'X_train_20': X_train_5000,
    'y_train_20': y_train_5000,
    'X_train_50': X_train_8000,
    'y_train_50': y_train_8000,
    'X_train_100': X_train_12000,
    'y_train_100': y_train_12000,
    # 'X_train_1700': X_train_17000,
    # 'y_train_1700': y_train_17000,
    # 'X_train_2500': X_train_25000,
    # 'y_train_2500': y_train_25000
}


savemat('data', mdict=dict_data)
x, y = [], []
for i in range(28):
    for j in range(28):
        x.append([i,j])
        y.append([i,j])
M = cdist(x, y)
print M
savemat('M', mdict={'M':M})



