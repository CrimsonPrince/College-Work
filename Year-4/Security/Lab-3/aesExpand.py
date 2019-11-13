# AES Key expansion in python with blocksize of 16

AESBlockSize = 16

def expand(self, input, AES_BLOCKSIZE):
    return input + (AES_BLOCKSIZE - len(input) % AES_BLOCKSIZE) * chr(AES_BLOCKSIZE - len(input) % AES_BLOCKSIZE)