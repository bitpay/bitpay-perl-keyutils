/* key_utils.i */
%module key_utils
%apply char *OUTPUT { char **pem }; 
%{
#include "bitpay.h"
extern int generatePem(char **pem);
extern int generateSinFromPem(char *pem, char **sin);
extern int getPublicKeyFromPem(char *pemstring, char **pubkey);
extern int signMessageWithPem(char *pem, char *message, char **signature); 
%}

extern int generatePem(char **pem);
extern int generateSinFromPem(char *pem, char **sin);
extern int getPublicKeyFromPem(char *pemstring, char **pubkey);
extern int signMessageWithPem(char *pem, char *message, char **signature); 

%newobject mygeneratePem;
%newobject mygenerateSinFromPem;
%newobject mygetPublicKeyFromPem;
%newobject mysignMessageWithPem;

%inline %{
	char *mysignMessageWithPem(char *pem, char *message) {
		char *ret = malloc(145);
		char *err = malloc(5);
		int errorCode;

		memcpy(err, "ERROR", 5);

		errorCode = signMessageWithPem(pem, message, &ret);
		char *signature = ret;

		if (errorCode == NOERROR) {
			return signature;
		} else {
			return err;
		}
		
	}
%}

%inline %{
	char *mygeneratePem() {
		char *ret = malloc(224);
		char *err = malloc(5);
		int errorCode;

		memcpy(err, "ERROR", 5);

		errorCode = generatePem(&ret);
		char *pem = ret;

		if (errorCode == NOERROR) {
			return pem;
		} else {
			return err;
		}
		
	}
%}

%inline %{
	char *mygenerateSinFromPem(char *pem) {
		char *ret = malloc(sizeof(char)*36);
		char *err = malloc(5);
		int errorCode;

		memcpy(err, "ERROR", 5);

		errorCode = generateSinFromPem(pem, &ret);

		char *sin = ret;

		if (errorCode == NOERROR) {
			return sin;
		} else {
			return err;
		}
		
	}
%}

%inline %{
	char *mygetPublicKeyFromPem(char *pem) {
		char *ret = malloc(67);
		char *err = malloc(5);
		int errorCode;

		memcpy(err, "ERROR", 5);

		errorCode = getPublicKeyFromPem(pem, &ret);
		char *pub = ret;

		if (errorCode == NOERROR) {
			return pub;
		} else {
			return err;
		}
		
	}
%}
