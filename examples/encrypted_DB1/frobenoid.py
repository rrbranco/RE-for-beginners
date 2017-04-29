# -*- coding: utf-8 -*-

# my own Python utility library
# dennis(a)yurichev.com

from Crypto.Cipher import AES
import math, random, struct
from collections import Counter

def char_is_latin(c):
    return (c>='a' and c<='z') or (c>='A' and c<='Z') 

def str_is_latin(s):
    return all(char_is_latin(c) for c in s)

def list_remove_if_present(l, item):
    if item in l:
        l.remove(item)

def remove_item_in_all_lists(list_of_lists, item):
    [list_remove_if_present(l, item) for l in list_of_lists]

def find_sets_in_lists_differ_by_1_element(set1, list_of_sets):
    rt=Set()
    i=0
    n=len(list_of_sets)
    while i<n:
	diff=set(list_of_sets[i])-set1
        if len(diff)==1:
	    #for tmp in diff:
            #    rt.add(tmp)
            [rt.add(x) for x in diff]
	    del list_of_sets[i]
	    n=n-1
        else:
	    i=i+1
    return rt

def inc_value_in_dict (d, key):
    if key not in d:
        d[key]=1
    else:
        d[key]=d[key]+1

# TODO there should be a function like "append line to the text file"
def L (fname, s):
    f=open (fname, "a")
    dt=datetime.now()
    f.write (dt.strftime("[%Y-%m-%d %H:%M:%S] "))
    f.write (s)
    print s.rstrip ("\n")
    f.close()

def get_size_in_nice_form(sz):
    if sz>1000000000:
        return "%dG" % (sz/1000000000)
    if sz>1000000:
        return "%dM" % (sz/1000000)
    if sz>1000:
        return "%dk" % (sz/1000)
    return "%d" % sz

def list_partition(lst, n):
    division = len(lst) / float(n)
    return [ lst[int(round(division * i)): int(round(division * (i + 1)))] for i in xrange(n) ]

# http://rosettacode.org/wiki/Entropy#Python_2
# 0...7.999...
def entropy(s):
    p, lns = Counter(s), float(len(s))
    return -sum( count/lns * math.log(count/lns, 2) for count in p.values())

def gen_random_block (size):
    return [random.randrange(256) for _ in range (size)]

def xor_two_strings (s1, s2):
    if len(s1)!=len(s2):
        raise AssertionError
    rt=""
    for i in range(len(s1)):
        rt+=chr(ord(s1[i]) ^ ord(s2[i]))
    return rt

def split_string_by_length(s, l):
    chunks, chunk_size = len(s), l
    return [ s[i:i+chunk_size] for i in range(0, chunks, chunk_size) ]

def AES_CFB_decryption(key, IV, c):
    # as in Wikipedia: https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Cipher_Feedback_.28CFB.29
    # I had to luck in handing PyCrypto behaviour when MODE_CFB is set there, so I wrote this function
    aes = AES.new(key, AES.MODE_ECB, IV)
    tmp=IV
    d=""
    for inp in split_string_by_length(c,16):
        encrypted_blk=aes.encrypt(tmp)
        tmp=inp
        d+=xor_two_strings(encrypted_blk[0:len(inp)], inp)
    return d

# returns new offset
def my_struct_unpack(fmt, buf, ofs):
    return ofs+struct.calcsize(fmt), struct.unpack_from(fmt, buf, ofs)

def get_text_file_contents_as_array (filename):
    f=open(filename,"r")
    ar=f.readlines()
    f.close()

    new_ar=[item.rstrip() for item in ar]
    return new_ar

# may be slow
def is_elem_last_in_list (lst, elem):
    return elem==lst[-1]

