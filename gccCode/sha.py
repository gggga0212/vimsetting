import hashlib
from datetime import datetime


def sha_in(shaType, dataIn):
    f.write('static char '+ shaType)
    f.write('[]= "'+ dataIn + '";\n\n')

def sha_out(shaType, dataIn):
    f.write('static char '+ shaType)
    # f.write('['+ str(len(dataIn)/2) + ']= {'+ dataIn + '};\n\n')
    f.write('['+ str(len(dataIn)/2) + '] = {')
    for i in range(0,len(dataIn),2):
       f.write('0x')
       f.write(str(dataIn[i]))
       f.write(str(dataIn[i+1]))
       if (i+2)<len(dataIn):
        f.write(',')
    f.write('};\n\n')

# def main():
path = 'shaout.txt'
f = open(path, 'w')

now = datetime.now()
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
print('date and time ='+ dt_string + '\n\n')
f.write("date and time ="+ dt_string +'\n\n');

data_64 =  "\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
0123456789\
01234567" 

data_128 = data_64  + data_64 
data_256 = data_128 + data_128
data_512 = data_256 + data_256

sha_in('sInData064',  data_64)
sha_in('sInData128', data_128)
sha_in('sInData256', data_256)
sha_in('sInData512', data_512)

data_sha256 = hashlib.sha256(data_64.encode('utf-8')).hexdigest()
sha_out('sha256_064_dg', data_sha256)
print('sha256_64_dg[]\n'+ data_sha256 +'\n')

data_sha256 = hashlib.sha256(data_128.encode('utf-8')).hexdigest()
sha_out('sha256_128_dg', data_sha256)
print('sha256_128_dg[]\n'+ data_sha256 +'\n')

data_sha256 = hashlib.sha256(data_256.encode('utf-8')).hexdigest()
sha_out('sha256_256_dg', data_sha256)
print('sha256_256_dg[]\n'+ data_sha256 +'\n')

data_sha256 = hashlib.sha256(data_512.encode('utf-8')).hexdigest()
sha_out('sha256_512_dg', data_sha256)
print('sha256_512_dg[]\n'+ data_sha256 +'\n')


# for sha 384
data_sha384 = hashlib.sha384(data_64.encode('utf-8')).hexdigest()
sha_out('sha384_064_dg', data_sha384)
print('sha256_064_dg[]\n'+ data_sha384 +'\n')

data_sha384 = hashlib.sha384(data_128.encode('utf-8')).hexdigest()
sha_out('sha384_128_dg', data_sha384)
print('sha256_128_dg[]\n'+ data_sha384 +'\n')

data_sha384 = hashlib.sha384(data_256.encode('utf-8')).hexdigest()
sha_out('sha384_256_dg', data_sha384)
print('sha256_256_dg[]\n'+ data_sha384 +'\n')

data_sha384 = hashlib.sha384(data_512.encode('utf-8')).hexdigest()
sha_out('sha384_512_dg', data_sha384)
print('sha256_512_dg[]\n'+ data_sha384 +'\n')

f.close()
# if __name__ == '__main__':
#     main()
