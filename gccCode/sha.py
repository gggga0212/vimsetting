import hashlib
import random
import string

from datetime import datetime


def sha_in(shaType, dataIn):
    f.write('char '+ shaType)
    f.write('[]= "'+ dataIn + '";\n\n')

def sha_out(shaType, dataIn):
    f.write('char '+ shaType)
    # f.write('['+ str(len(dataIn)/2) + ']= {'+ dataIn + '};\n\n')
    f.write('['+ str(len(dataIn)/2) + '] = {')
    for i in range(0,len(dataIn),2):
       f.write('0x')
       f.write(str(dataIn[i]))
       f.write(str(dataIn[i+1]))
       if (i+2)<len(dataIn):
        f.write(',')
    f.write('};\n\n')
    print(shaType + '\n'+ dataIn +'\n')

def get_random_string(ranStr, length):
        # choose from all lowercase letter
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(length))
# def main():
# printing lowercase

path = 'app_rom_test.h'
f = open(path, 'w')

now = datetime.now()
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print('date and time ='+ dt_string + '\n\n')
f.write("//date and time ="+ dt_string +'\n\n');

# data_64 =  "\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 0123456789\
# 01234567" 

# data_128  = data_64   + data_64 
# data_256  = data_128  + data_128
# data_512  = data_256  + data_256
# data_1024 = data_512  + data_512
# data_2048 = data_1024 + data_1024

letters = string.ascii_lowercase
data_64   = ''.join(random.choice(letters) for i in range(64))
data_128  = ''.join(random.choice(letters) for i in range(128))
data_256  = ''.join(random.choice(letters) for i in range(256))
data_512  = ''.join(random.choice(letters) for i in range(512))
data_1024 = ''.join(random.choice(letters) for i in range(1024))
data_2048 = ''.join(random.choice(letters) for i in range(2048))


sha_in('sInData064',  data_64)
sha_in('sInData128', data_128)
sha_in('sInData256', data_256)
sha_in('sInData512', data_512)
sha_in('sInData1024', data_1024)
sha_in('sInData2048', data_2048)

data_sha256 = hashlib.sha256(data_64.encode('utf-8')).hexdigest()
sha_out('sha256_064_dg', data_sha256)

data_sha256 = hashlib.sha256(data_128.encode('utf-8')).hexdigest()
sha_out('sha256_128_dg', data_sha256)

data_sha256 = hashlib.sha256(data_256.encode('utf-8')).hexdigest()
sha_out('sha256_256_dg', data_sha256)

data_sha256 = hashlib.sha256(data_512.encode('utf-8')).hexdigest()
sha_out('sha256_512_dg', data_sha256)

data_sha256 = hashlib.sha256(data_1024.encode('utf-8')).hexdigest()
sha_out('sha256_1024_dg', data_sha256)

data_sha256 = hashlib.sha256(data_2048.encode('utf-8')).hexdigest()
sha_out('sha256_2048_dg', data_sha256)

# for sha 384
data_sha384 = hashlib.sha384(data_64.encode('utf-8')).hexdigest()
sha_out('sha384_064_dg', data_sha384)

data_sha384 = hashlib.sha384(data_128.encode('utf-8')).hexdigest()
sha_out('sha384_128_dg', data_sha384)

data_sha384 = hashlib.sha384(data_256.encode('utf-8')).hexdigest()
sha_out('sha384_256_dg', data_sha384)

data_sha384 = hashlib.sha384(data_512.encode('utf-8')).hexdigest()
sha_out('sha384_512_dg', data_sha384)

data_sha384 = hashlib.sha384(data_1024.encode('utf-8')).hexdigest()
sha_out('sha384_1024_dg', data_sha384)

data_sha384 = hashlib.sha384(data_2048.encode('utf-8')).hexdigest()
sha_out('sha384_2048_dg', data_sha384)
f.close()
# if __name__ == '__main__':
#     main()
