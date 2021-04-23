import os
from pathlib import Path
from vantage6.client import encryption

# Create and store the private key
path = Path('/private_key.pem')
private_key = encryption.RSACryptor.create_new_rsa_key(path)

public_key = encryption.RSACryptor.create_public_key_bytes(private_key)
