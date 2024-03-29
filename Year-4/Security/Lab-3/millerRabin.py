from random import randrange, getrandbits

def is_prime(n, k=128):
    #Prime Test, returns True when prime
    if n == 2 or n == 3:
        return True
    if n <= 1 or n % 2 == 0:
        return False
    s = 0
    r = n - 1
    while r & 1 == 0:
        s += 1
        r //= 2
    for _ in range(k):
        a = randrange(2, n - 1)
        x = pow(a, r, n)
        if x != 1 and x != n - 1:
            j = 1
            while j < s and x != n - 1:
                x = pow(x, 2, n)
                if x == 1:
                    return False
                j += 1
            if x != n - 1:
                return False    
    return True

def generate_prime_candidate(length):
    #Generates an Odd Number
    p = getrandbits(length)
    p |= (1 << length - 1) | 1    
    return p

def generate_prime_number(length=1024):
    #Generates a prime of Length passed in
    p = 4
    #Generates while prime tests fail
    while not is_prime(p, 128):
        p = generate_prime_candidate(length)
    return pprint(generate_prime_number())