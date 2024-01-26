def listFunc(a, b):
    return list(range(a, b+1)) #Create list of ints from 1 to 5, Haskell equivalent [1..5]

def applicatorFunc(inpFunc, s):
    if s=='s':
        return sum(inpFunc())
    else:
        return sum(inpFunc())/len(inpFunc())

result = applicatorFunc(lambda: listFunc(1, 5), 's')
print(result)
