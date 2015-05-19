# Using the BitPay Key Utilities Library

This library provides utilities for use with the BitPay API. It enables creating keys, retrieving public keys, creating the SIN that is used in retrieving tokens from BitPay, and signing payloads for the `X-Signature` header in a BitPay API request.

# Prerequisites
 * libssl-dev (OpenSSL 0.9.8+)
 * SWIG (3.0.5+)
 * Perl (5.18+)
 * Make

## Quick Start
### Installation

Install from cpan by typing the following:

```bash
cpanm BitPay::key_utils
```

or

Clone the github repository and type the following:

```bash
perl Makefile.pl
make
make test
sudo make install
```

### Usage
Use the key utils by including `use BitPay::key_utils` in your project. This should give you access to the functions:

```perl
my $pem = BitPay::key_utils::mygeneratePem(); #creates ECDSA Keys and sets the value of pem to the PEM encoding of the key
my $pub = BitPay::key_utils::mygetPublicKeyFromPem($pem); #takes a pem string and sets the value of pubkey to the compressed public key extracted from the pem
my $sin = BitPay::key_utils::mygenerateSinFromPem($sin); #gets the base58 unique identifier associated with the pem
my $signature = BitPay::key_utils::mysignMessageWith($pem, $message); #sets signature to the signature of the sha256 of the message
```
## Dev Environment

Clone the github repository.

```bash
./clean
./build
```

## API Documentation

API Documentation is available on the [BitPay site](https://bitpay.com/api).

## Running the Tests

```bash
$ perl test.pl
```
