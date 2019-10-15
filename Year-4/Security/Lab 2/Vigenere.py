class Vigenere:
    def __init__(self, password = "Hello world"):
        self.vigPass = ""
        self.setPassword(password)


    def chToKey(self, char):
        if char.isupper():
            return(ord(char) - ord("A"))
        elif char.islower():
            return(ord(char) - ord('a'))
        else:
            # Not a letter
            return None

    def convertStr(self, text):
        newText = ""
        for char in text:
            if char.isalpha():
                newText += char.upper()

        return(newText)


    def formatStr(self, string):
        new = ""
        for i in range(len(string)):
            if(i != 0 and i % 5 == 0):
                new += " "
            new += string[i]

        return(new)

    def crypt(self, ch, key, mode):

        if ch.isupper():
            offset = ord("A")
        elif ch.islower():
            offset = ord('a')
        else:
            return(ch)

        enc = ""

        if mode.upper() == "E":
            enc = chr((ord(ch) + key - offset) % 26 + offset)
        elif mode.upper() == "D":
            enc = chr((ord(ch) - key - offset) % 26 + offset)
        else:
            return(ch)

        return(enc)

    def decrypt(self, string):
        new = ""
        tempKey = 0
        j = 0

        for char in string:
            if(not char.isalpha()):
                new += char
                continue

            tempKey = self.chToKey(self.vigPass[j % len(self.vigPass)])
            new += self.crypt(char, tempKey, "D")
            j += 1


        return(new)

    def encrypt(self, string):
        convString = self.convertStr(string)
        new = ""
        tempKey = 0
        j = 0

        for char in convString:
            tempKey = self.chToKey(self.vigPass[j % len(self.vigPass)])
            new += self.crypt(char, tempKey, "E")
            j += 1

        return(self.formatStr(new))


    def setPassword(self, newPass):
        tmp = self.convertStr(newPass)
        if len(tmp) == 0:
            raise IndexError("Error: Bad password. Password must contain only letters")
        else:
            self.vigPass = tmp



def main():
    try:
        print("Press 1 to Encrypt")
        print("Press 2 to Decrypt")
        choice = input("Choice: ")
        if choice == '1':
            print("Enter the Key")
            v = Vigenere(input("Key: "))
            print("Enter PlainText")
            print("Encrypted Text is : ", v.encrypt(input("Plain Text: ")))
        if choice == '2':
            print("Enter the Key")
            v = Vigenere(input("Key: "))
            print("Enter cipherText")
            print("Encrypted Text is : ", v.decrypt(input("Cipher Text: ")))

            
    except Exception as e:
        print(e)



if __name__ == '__main__':
	main()