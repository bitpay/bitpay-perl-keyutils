#include "bitpay.h"

int main() {

    char *pem = malloc(240);
    char *sin = malloc(36);
    sin[35] = '\0';
    char *pub = malloc(67);
    pem[239]='\0';
    generatePem(&pem);
    char *expected_pem_S = "MHQCAQ";
    char *expected_pem_N = "SuBBAAK\n";

    char *actual_pem_S = calloc(7, sizeof(char));
    char *actual_pem_N = calloc(9, sizeof(char));
    actual_pem_S[6] = '\0';
    actual_pem_N[8] = '\0';
    memcpy(actual_pem_S, pem+31, 6);
    memcpy(actual_pem_N, pem+88, 8);

    if(strcmp(expected_pem_S, actual_pem_S) == 0)
        printf(".");
    else
        printf("Pem test - Expected: %s, Actual: %s\n", expected_pem_S, actual_pem_S);
    if(strcmp(expected_pem_N, actual_pem_N) == 0)
        printf(".");
    else
        printf("Pem test - Expected: %s, Actual: %s\n", expected_pem_N, actual_pem_N);


    char *fixed_pem = "-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIOg1/L9j0a63o5mRtzmG6N3Cn76MDpbUd2ZYAy4kYmq1oAcGBSuBBAAK\noUQDQgAE2IauvNs634tRrspRnEMbv9dQ84xoqBFilQQkmhHZJde+/8VwpMQ4wIQP\nYB429LjWsy3VyOF8vUpUmIvx17g/7g==\n-----END EC PRIVATE KEY-----\n";
    char *expected_pub = "02D886AEBCDB3ADF8B51AECA519C431BBFD750F38C68A811629504249A11D925D7";
    int pubgood = getPublicKeyFromPem(fixed_pem, &pub);
    if(pubgood == ERROR)
        printf("Error retrieving public key\n");
    if(strcmp(expected_pub, pub) == 0)
        printf(".");
    else
        printf("Public key test - Expected: %s, Actual: %s\n", expected_pub, pub);


    char *expected_sin = "Tf41EHiUGugMMeAR35DXfUrfkjzwmvqRQkz";
    int singood = generateSinFromPem(fixed_pem, &sin);
    if(singood == ERROR)
        printf("Sin Error\n");
    if(strcmp(expected_sin, sin) == 0)
        printf(".");
    else
        printf("Sin test - Expected: %s, Actual: %s\n", expected_sin, sin);

    char *message = "https://test.bitpay.com/invoices{\"currency\":\"USD\",\"price\":100,\"token\":\"GVTANyBKSJRdSzy88P72H2LB7gky7o4J8bebVbVaF6pA\"}";
    int signa;
    char *signature = calloc(145, sizeof(char));
    signa = signMessageWithPem(message, pem, &signature);
    if(signa == ERROR){
        printf("Signature Error.\n");
    };
    char *actual_start = calloc(4, sizeof(char));
    actual_start[4] = '\0';
    memcpy(actual_start, signature, 4);
    char *expected_start;
    if(strlen(signature) == 140)
        expected_start = "3044";
    else if(strlen(signature) == 142)
        expected_start = "3045";
    else if(strlen(signature) == 144)
        expected_start = "3046";
    else
        printf("Signature is not a valid length\n");

    if(strcmp(actual_start, expected_start) == 0)
        printf(".");
    else
        printf("Signature test - Expected: %s, Actual: %s\n", expected_start, actual_start);
    printf("\n");
    free(pem);
    free(pub);
    free(sin);
    free(signature);
    free(actual_pem_S);
    free(actual_pem_N);
    free(actual_start);
    return 1;
}

