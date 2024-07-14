import sys
from web3.utils.address import get_create2_address
from Crypto.Hash import keccak
import json

if __name__ == "__main__":
    data = json.loads(sys.argv[1])
    keccak_hash = keccak.new(digest_bits=256)
    keccak_hash.update(data["init_code"].encode())
    addr = get_create2_address(data["sender"].encode(), data["salt"].encode(), keccak_hash.hexdigest())
    print(json.dumps({"address": addr}))
