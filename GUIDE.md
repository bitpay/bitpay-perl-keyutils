# Using the BitPay Key Utilities Library

This library provides utilities for use with the BitPay API. It enables creating keys, retrieving public keys, creating the SIN that is used in retrieving tokens from BitPay, and signing payloads for the `X-Signature` header in a BitPay API request.

## Quick Start
### Installation

Clone the github repository and include the bitpay.h header in your project. This should give you access to the functions:

```c
int generatePem(char **pem) // creates an ECKEY and sets the value of pem to the PEM encoding of the key
int getPublicKeyFromPem(char *pemstring, char **pubkey) //takes a pem string and sets the value of pubkey to the compressed public key extracted from the pem
int generateSinFromPem(char *pem, char **sin) //gets the base58 unique identifier associated with the pem
int signMessageWithPem(char *message, char *pem, char **signature) //sets signature to the signature of the sha256 of the message
```

## API Documentation

API Documentation is available on the [BitPay site](https://bitpay.com/api).

## Running the Tests

```bash
$ sh build.sh
```

