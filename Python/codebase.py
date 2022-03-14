import random
################################################################################
def sample_under(lst):
    # samples under a distribution in lst to return the index of lst
    s = np.sum(lst)
    r = random.random()
    i = 0
    while r>lst[i]/s:
        r-=lst[i]/s
        i+=1
    return i

### testing sample_under() function
# lst = [np.exp(-((5 - (k + .5))**2)/2) for k in range(-10,10)]
# dis = np.zeros((20,1))
# for i in range(10000):
#     dis[sample_under(lst)]+=1
#
# print(np.sum(dis))
# plt.plot(dis)
# plt.show()
################################################################################
