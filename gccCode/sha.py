import hashlib
import random
import string

from datetime import datetime


def sha_in(shaType, dataIn):
    f.write('char '+ shaType)
    f.write('[]= "'+ dataIn + '";\n\n')

def sha_in_hex(shaType, dataIn):
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
    # print(shaType + '\n'+ dataIn +'\n')

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

# # >>>>>>>>>>>>>>>>>>>>>>>>>>>>> INPUT

letters = ['00','01','02','03','04','05','06','07','08','09','0a','0b','0c','0d','0e','0f','10','11','12','13','14','15','16','17','18','19','1a','1b','1c','1d','1e','1f','20','21','22','23','24','25','26','27','28','29','2a','2b','2c','2d','2e','2f','30','31','32','33','34','35','36','37','38','39','3a','3b','3c','3d','3e','3f','40','41','42','43','44','45','46','47','48','49','4a','4b','4c','4d','4e','4f','50','51','52','53','54','55','56','57','58','59','5a','5b','5c','5d','5e','5f','60','61','62','63','64','65','66','67','68','69','6a','6b','6c','6d','6e','6f','70','71','72','73','74','75','76','77','78','79','7a','7b','7c','7d','7e','7f']

# letters = ['00','01','02','03','04','05','06','07','08','09','0a','0b','0c','0d','0e','0f','10','11','12','13','14','15','16','17','18','19','1a','1b','1c','1d','1e','1f','20','21','22','23','24','25','26','27','28','29','2a','2b','2c','2d','2e','2f','30','31','32','33','34','35','36','37','38','39','3a','3b','3c','3d','3e','3f','40','41','42','43','44','45','46','47','48','49','4a','4b','4c','4d','4e','4f','50','51','52','53','54','55','56','57','58','59','5a','5b','5c','5d','5e','5f','60','61','62','63','64','65','66','67','68','69','6a','6b','6c','6d','6e','6f','70','71','72','73','74','75','76','77','78','79','7a','7b','7c','7d','7e','7f','80','81','82','83','84','85','86','87','88','89','8a','8b','8c','8d','8e','8f','90','91','92','93','94','95','96','97','98','99','9a','9b','9c','9d','9e','9f','a0','a1','a2','a3','a4','a5','a6','a7','a8','a9','aa','ab','ac','ad','ae','af','b0','b1','b2','b3','b4','b5','b6','b7','b8','b9','ba','bb','bc','bd','be','bf','c0','c1','c2','c3','c4','c5','c6','c7','c8','c9','ca','cb','cc','cd','ce','cf','d0','d1','d2','d3','d4','d5','d6','d7','d8','d9','da','db','dc','dd','de','df','e0','e1','e2','e3','e4','e5','e6','e7','e8','e9','ea','eb','ec','ed','ee','ef','f0','f1','f2','f3','f4','f5','f6','f7','f8','f9','fa','fb','fc','fd','fe','ff',]

data_64   = ''.join(random.choice(letters) for i in range(64))
data_128  = ''.join(random.choice(letters) for i in range(128))
data_256  = ''.join(random.choice(letters) for i in range(256))
data_512  = ''.join(random.choice(letters) for i in range(512))
data_1024 = ''.join(random.choice(letters) for i in range(1024))
data_2048 = ''.join(random.choice(letters) for i in range(2048))

sha_in_hex('sInData064',  data_64)
sha_in_hex('sInData128',  data_128)
sha_in_hex('sInData256',  data_256)
sha_in_hex('sInData512',  data_512)
sha_in_hex('sInData1024', data_1024)
sha_in_hex('sInData2048', data_2048)

data_2048x6=''
for i in range (0,6,1):
    data_2048x6 += data_2048
dataA = '41'
dataB = '4142'
dataC = '414243'
dataD = '41424344'
dataE = '4142434445'
dataF = '414243444546'
dataG = '41424344454647'

data_sha256 = hashlib.sha256(dataA.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2A_dg', data_sha256)
data_sha256 = hashlib.sha256(dataB.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2B_dg', data_sha256)
data_sha256 = hashlib.sha256(dataC.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2C_dg', data_sha256)
data_sha256 = hashlib.sha256(dataD.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2D_dg', data_sha256)
data_sha256 = hashlib.sha256(dataE.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2E_dg', data_sha256)
data_sha256 = hashlib.sha256(dataF.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2F_dg', data_sha256)
data_sha256 = hashlib.sha256(dataG.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha2G_dg', data_sha256)
# print('AA = '+ data_sha256)

data_sha256 = hashlib.sha256(data_64.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_064_dg', data_sha256)

data_sha256 = hashlib.sha256(data_128.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_128_dg', data_sha256)

data_sha256 = hashlib.sha256(data_256.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_256_dg', data_sha256)

data_sha256 = hashlib.sha256(data_512.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_512_dg', data_sha256)

data_sha256 = hashlib.sha256(data_1024.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_1024_dg', data_sha256)

data_sha256 = hashlib.sha256(data_2048.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_2048_dg', data_sha256)

data_sha256 = hashlib.sha256(data_2048x6.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha256_2048x6_dg', data_sha256)

# for sha 384
data_sha384 = hashlib.sha384(data_64.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_064_dg', data_sha384)

data_sha384 = hashlib.sha384(data_128.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_128_dg', data_sha384)

data_sha384 = hashlib.sha384(data_256.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_256_dg', data_sha384)

data_sha384 = hashlib.sha384(data_512.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_512_dg', data_sha384)

data_sha384 = hashlib.sha384(data_1024.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_1024_dg', data_sha384)

data_sha384 = hashlib.sha384(data_2048.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_2048_dg', data_sha384)

data_sha384 = hashlib.sha384(data_2048x6.decode("hex").encode('utf-8')).hexdigest()
sha_out('sha384_2048x6_dg', data_sha384)

# data_sha384 = hashlib.sha384(data_4096.encode('utf-8')).hexdigest()
# sha_out('sha384_4096_dg', data_sha384)
#
# data_sha384 = hashlib.sha384(data_8192.encode('utf-8')).hexdigest()
# sha_out('sha384_8192_dg', data_sha384)
# data_i = 0x4141 
# data_s = hashlib.sha256(chr(data_i).encode('utf-8')).hexdigest()
# print(data_s)
f.close()
# if __name__ == '__main__':
#     main()
