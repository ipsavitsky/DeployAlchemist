import sys
from eth_abi import encode
import json


def encode_arguments(data):
    # Encode the arguments
    prepared_data = list(
        map(
            lambda x: {
                "type_": x["type_"],
                "value": x["value"] if x["type_"] not in ["bytes", "bytes32"] else x["value"].encode("utf-8"),
            }, data
        )
    )
    types = list(map(lambda x: x["type_"], prepared_data))
    values = list(map(lambda x: x["value"], prepared_data))
    encoded_data = encode(types, values)
    return encoded_data.hex()


if __name__ == "__main__":
    # sys.stderr.write(sys.argv[1])
    data = json.loads(sys.argv[1])
    result = encode_arguments(data)
    print(json.dumps({"payload": result}))
