import sys
from web3.utils.address import get_create2_address
import json

if __name__ == "__main__":
    data = json.loads(sys.argv[1])
    addr = get_create2_address(data["sender"], data["salt"], data["init_code"])
    print(json.dumps({"address": addr}))
