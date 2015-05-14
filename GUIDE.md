# Using the BitPay Key Utilities Library

This library provides utilities for use with the BitPay API. It enables creating keys, retrieving public keys, creating the SIN that is used in retrieving tokens from BitPay, and signing payloads for the `X-Signature` header in a BitPay API request.

## Quick Start
### Installation

Clone the github repository.

```bash
./build
```

Use the key_utils module in your project. This should give you access to the functions:

```perl
my $pem = key_utils::mygeneratePem(); #creates ECDSA Keys and sets the value of pem to the PEM encoding of the key
my $pub = key_utils::mygetPublicKeyFromPem($pem); #takes a pem string and sets the value of pubkey to the compressed public key extracted from the pem
my $sin = key_utils::mygenerateSinFromPem($sin); #gets the base58 unique identifier associated with the pem
my $signature = key_utils::mysignMessageWith($pem, $message); #sets signature to the signature of the sha256 of the message
```

## API Documentation

API Documentation is available on the [BitPay site](https://bitpay.com/api).

## Running the Tests

```bash
$ perl test.pl
```

