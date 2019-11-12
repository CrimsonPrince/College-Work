from random import randrange, getrandbitsdef is_prime(n, k=128):
    """ Test if a number is prime        Args:  n -- int -- the number to test k -- int -- the number of tests to do        return True if n is prime """
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
                return False    return Truedef generate_prime_candidate(length):
    """ Generate an odd integer randomly        Args: length -- int -- the length of the number to generate, in bits        return a integer """
    p = getrandbits(length)
    p |= (1 << length - 1) | 1    return pdef generate_prime_number(length=1024):
    """ Generate a prime        Args: length -- int -- length of the prime to generate, in          bits        return a prime """
    p = 4
    # keep generating while the primality test fail
    while not is_prime(p, 128):
        p = generate_prime_candidate(length)
    return pprint(generate_prime_number())