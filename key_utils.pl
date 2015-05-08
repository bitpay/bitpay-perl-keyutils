use key_utils;
use strict;
use warnings;

my $pem;
my $sin;
my $pub;
my $signature;
my $message = "Hello";

$pem = key_utils::mygeneratePem();
$pub = key_utils::mygetPublicKeyFromPem($pem);
$signature = key_utils::mysignMessageWithPem($pem, $message);
#$sin = key_utils::mygenerateSinFromPem($pem);

print "$pem\nPublic Key: $pub\nSin: $sin\nSignature: $signature\n";


