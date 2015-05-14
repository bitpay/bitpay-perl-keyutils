# File : Makefile.PL
use ExtUtils::MakeMaker;
WriteMakefile(
	'NAME'    => 'BitPay::key_utils',                  # Name of package
	'LIBS'    => ['-lm -lssl -lcrypto'],                    # Name of custom libraries
	'OBJECT'  => 'key_utils.o key_utils_wrap.o'  # Object files
);
