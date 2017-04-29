import frobenoid, sys, base64, struct, hexdump
from lxml import etree

def decrypt_lines(body, OrderID):
    key="\xcd\xc5\x7e\xad\x28\x5f\x6d\xe1\xce\x8f\xcc\x29\xb1\x21\x88\x8e"
    
    IV=struct.pack("iiBBBBBBBB", OrderID, -OrderID, 0x79, 0xc1, 0x69, 0xb, 0x67, 0xc1, 0x4, 0x7d)
    buf=frobenoid.AES_CFB_decryption(key, IV, body)
    ofs=0
    ofs,str_len = frobenoid.my_struct_unpack("H", buf, ofs)
    str_len=str_len[0]
    ofs,BOM = frobenoid.my_struct_unpack("BB", buf, ofs)
    if BOM!=(255, 254):
	    raise ValueError

    s=buf[ofs:ofs+str_len*2]
    ofs=ofs+str_len*2
    hexdump.hexdump (buf[ofs:])

def process_file (fname):
    context = etree.iterparse(fname)
    for event, elem in context:
        if event=="end":
	    if elem.tag=="Data":
		decrypt_lines(base64.b64decode(elem.text), cur_OrderID)
	    elif elem.tag=="OrderID":
                cur_OrderID=int(elem.text)
	    else:
                #print "not recognized:", elem.tag, elem.text
                pass
	elem.clear()

process_file(sys.argv[1])
