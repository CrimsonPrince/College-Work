def encrypt(input, key):
    encrypted = []
    for i in range(0, len(input)):
        a = ord(input[i])

        for j in range (0, key):
             a = a + 1
             
             if (a>122):
                a = 97

        encrypted.append(chr(a))
    return "".join(encrypted)

def decrypt(input, key):
    decrypted = []
    for i in range(0, len(input)):
        a = ord(input[i])

        for o in range (0, key):
            a = a - 1

            if (a<97):
                 a = 122

        decrypted.append(chr(a))
    return "".join(decrypted)

def main():
    try:
        print("Press 1 to Encrypt")
        print("Press 2 to Decrypt")
        choice = input("Choice: ")
        if choice == '1':
            print("Enter the Key")
            key = int(input("Key: "))
            print("Enter PlainText")
            plainText = input("Plain Text: ")
            print("Encrypted Text is : ", encrypt(plainText, key))
        if choice == '2':
            print("Enter the Key")
            key = int(input("Key: "))
            print("Enter CipherText")
            cipherText = input("Cipher Text: ")
            print("Encrypted Text is : ", decrypt(cipherText, key))

            
    except Exception as e:
        print(e)



if __name__ == '__main__':
    main()