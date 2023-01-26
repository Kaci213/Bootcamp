#!/usr/bin/env python
# coding: utf-8

# # Message Locker : Message encryption and decryption 

# This function will be used once in this instance.
# Eventually it could be used to generate a new key for each individual encryption
# 
# PSEUDOCODE
# Import random
# Declare objects:
#     dict_encrypt (empty dictionary for character:encryption pairs)
# 
# 1. In a list, define all possible characters that can be entered A-Z, a-Z, 0-9, ' ', ',','.', ':', ';', '-','_'
# 2. iterate though list, assigning a random combination of 3 characters.
# 3. in empty dictionary, assign key (original character) and value (the encyrption key)
# 4. check that the encyption combination does not already exist, if exists continue 
# 5. check that dictionary containes all original characters from list
# 6. if characters missing rerun key creation
# 7. Print dictionary
# 
# 
# 

# In[9]:


#Function to generate and encryption key, 
# for the purposes of this program it is only executed once by the programmers to generate key

def Encryption():
    import random 
    import string

    dict_encrypt={}
    encrypt_str=string.ascii_uppercase+string.ascii_lowercase +string.digits+string.punctuation
    print(encrypt_str)
    encrypt_str=encrypt_str.replace('\\',' ')
    print(encrypt_str)

    char_list=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
           'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y', 'z',
          '1','2','3','4','5','6','7','8','9','0','(',')','[',']',',', ' ','&','*','?','%','.',':',';','$','!','@',"'",'','"','#','-','_']


# generation of key:value pair for character and its 3 character encryption code

    for char in char_list:
        encrypt_list=random.choices(encrypt_str, k=3) #returns as a list convert to string
        encrypt_list= ''.join(encrypt_list)
    # check that all encoded keys are unique
        for key in dict_encrypt:
            if dict_encrypt[key]==encrypt_list:
                continue
        dict_encrypt[char]= encrypt_list

# checking that all characters in char list have been encoded

    d_list=list(dict_encrypt.keys())


    if len(set(char_list).symmetric_difference(set(d_list))) >0:
        print(set(char_list).symmetric_difference(set(d_list)))
    else:
        print('all characters are encoded in dictionary')
    print(dict_encrypt)    

Encryption()


# In[14]:


#This function allows us to reverse the key,value pair of a dictionnary, and get the key as the new value

dict_encrypt= {'A': ']Rt', 'B': '^=V', 'C': 'S"B', 'D': 'M#f', 'E': 'L>)', 'F': 'Cp&', 'G': 'U}M', 'H': ';T6', 'I': '-!}', 'J': 'Ie"', 'K': '_J?', 'L': 'iC%', 'M': 'aHp', 'N': '10Z', 'O': 'y8e', 'P': 'q_<', 'Q': ')8r', 'R': 'Ij&', 'S': '$>!', 'T': 'Uv-', 'U': 'QeY', 'V': 'Y11', 'W': '*FM', 'X': 'X,T', 'Y': '2#>', 'Z': '(c4', 'a': 'M&a', 'b': 'pPG', 'c': '_k_', 'd': 'O",', 'e': 'qlJ', 'f': 'a{$', 'g': '00~', 'h': 'ydM', 'i': '-e|', 'j': '0[P', 'k': '-S;', 'l': 'eC,', 'm': 'F|[', 'n': 'S7A', 'o': 'C?y', 'p': '&,[', 'q': '+*4', 'r': '3ud', 's': '{F~', 't': '_Eu', 'u': 'UB)', 'v': 'Gwl', 'w': '_s?', 'x': ']3#', 'y': 't@7', 'z': '6PI', '1': 'ok+', '2': 'wW&', '3': "'6_", '4': 'Ic)', '5': 'c/+', '6': '*cW', '7': 'kC!', '8': '&1}', '9': ' zn', '0': 'c%R', '(': 'trE', ')': 'rn$', '[': 't@~', ']': '36q', ',': 'IG"', ' ': 'f~C', '&': 'zp<', '*': 'R@P', '?': 'g88', '%': 'nW+', '.': '?Ga', ':': 'SEP', ';': 'N.&', '$': '*u&', '!': 'ihF', '@': 'k@$', "'": 'x2G', '': 'r#j', '"': 'Qjf', '#': '/~c', '-': 'Z7@', '_': 'DB.'}

reversed_dict_encrypt = dict()
for key in dict_encrypt:
    val = dict_encrypt[key]
    reversed_dict_encrypt[val] = key
    
print(reversed_dict_encrypt)


# In[8]:


dict_encrypt= {'A': ']Rt', 'B': '^=V', 'C': 'S"B', 'D': 'M#f', 'E': 'L>)', 'F': 'Cp&', 'G': 'U}M', 'H': ';T6', 'I': '-!}', 'J': 'Ie"', 'K': '_J?', 'L': 'iC%', 'M': 'aHp', 'N': '10Z', 'O': 'y8e', 'P': 'q_<', 'Q': ')8r', 'R': 'Ij&', 'S': '$>!', 'T': 'Uv-', 'U': 'QeY', 'V': 'Y11', 'W': '*FM', 'X': 'X,T', 'Y': '2#>', 'Z': '(c4', 'a': 'M&a', 'b': 'pPG', 'c': '_k_', 'd': 'O",', 'e': 'qlJ', 'f': 'a{$', 'g': '00~', 'h': 'ydM', 'i': '-e|', 'j': '0[P', 'k': '-S;', 'l': 'eC,', 'm': 'F|[', 'n': 'S7A', 'o': 'C?y', 'p': '&,[', 'q': '+*4', 'r': '3ud', 's': '{F~', 't': '_Eu', 'u': 'UB)', 'v': 'Gwl', 'w': '_s?', 'x': ']3#', 'y': 't@7', 'z': '6PI', '1': 'ok+', '2': 'wW&', '3': "'6_", '4': 'Ic)', '5': 'c/+', '6': '*cW', '7': 'kC!', '8': '&1}', '9': ' zn', '0': 'c%R', '(': 'trE', ')': 'rn$', '[': 't@~', ']': '36q', ',': 'IG"', ' ': 'f~C', '&': 'zp<', '*': 'R@P', '?': 'g88', '%': 'nW+', '.': '?Ga', ':': 'SEP', ';': 'N.&', '$': '*u&', '!': 'ihF', '@': 'k@$', "'": 'x2G', '': 'r#j', '"': 'Qjf', '#': '/~c', '-': 'Z7@', '_': 'DB.'}
reversed_dict_encrypt= {']Rt': 'A', '^=V': 'B', 'S"B': 'C', 'M#f': 'D', 'L>)': 'E', 'Cp&': 'F', 'U}M': 'G', ';T6': 'H', '-!}': 'I', 'Ie"': 'J', '_J?': 'K', 'iC%': 'L', 'aHp': 'M', '10Z': 'N', 'y8e': 'O', 'q_<': 'P', ')8r': 'Q', 'Ij&': 'R', '$>!': 'S', 'Uv-': 'T', 'QeY': 'U', 'Y11': 'V', '*FM': 'W', 'X,T': 'X', '2#>': 'Y', '(c4': 'Z', 'M&a': 'a', 'pPG': 'b', '_k_': 'c', 'O",': 'd', 'qlJ': 'e', 'a{$': 'f', '00~': 'g', 'ydM': 'h', '-e|': 'i', '0[P': 'j', '-S;': 'k', 'eC,': 'l', 'F|[': 'm', 'S7A': 'n', 'C?y': 'o', '&,[': 'p', '+*4': 'q', '3ud': 'r', '{F~': 's', '_Eu': 't', 'UB)': 'u', 'Gwl': 'v', '_s?': 'w', ']3#': 'x', 't@7': 'y', '6PI': 'z', 'ok+': '1', 'wW&': '2', "'6_": '3', 'Ic)': '4', 'c/+': '5', '*cW': '6', 'kC!': '7', '&1}': '8', ' zn': '9', 'c%R': '0', 'trE': '(', 'rn$': ')', 't@~': '[', '36q': ']', 'IG"': ',', 'f~C': ' ', 'zp<': '&', 'R@P': '*', 'g88': '?', 'nW+': '%', '?Ga': '.', 'SEP': ':', 'N.&': ';', '*u&': '$', 'ihF': '!', 'k@$': '@', 'x2G': "'", 'r#j': '', 'Qjf': '"', '/~c': '#', 'Z7@': '-', 'DB.': '_'}

def start_game():
    print('''Welcome to Message Locker!

This a handy tool to encrypt a message, simply enter your text in English in the input box.
When you are ready to decrypt simply come back here with your encrypted message and follow the instructions.
Have a good day!!!
    ''')

    choice=int(input("If you want to encrypt press 1 and if you want to decrypt press 2 :"))
    if choice==1:
        encryption_process()
    elif choice==2:
        decryption_process()
    else:
        choice=input("Please chose between, 1 or 2")
    print("\n")
    print('Thank you for using Message Locker! We hope to see you again !!')

    
def encryption_process():
    # english message entered
    msg = input("Write down the message you wish to encrypt. It must be in English, it can contain numbers and these special characters only '.:;$!@'-_:)(][ \n")
    encrypted_msg = []
    
    # this part returns us the encrypted message
    for character in msg:
        encrypted_msg.append(dict_encrypt[character])
    
    with open('encrypt.txt', 'w') as f:
        f.write("".join(encrypted_msg))
    print("\n")
    print("\n", "Here is your encrypted message : ", "\n", "".join(encrypted_msg))        


def decryption_process():
    # encrypted message entered
    encr_txt = input("Write down the message you wish to decrypt : \n")
    encr_lst = []
    decr_msg=[]

    #this part splits the string 3 characters by 3 characters
    n=3
    for index in range(0, len(encr_txt), n):
        encr_lst.append(encr_txt[index : index + n])
    print(encr_lst)
    
    #this part returns us the decrypted message
    for k in encr_lst:
        decr_msg.append(reversed_dict_encrypt[k])
    
    print("\n")
    print("Here is your decrypted message : ", "\n", "".join(decr_msg))

    
start_game()


# In[ ]:





# In[ ]:





# In[ ]:




