module karma_passport::oracle_verifier {
    public fun verify(_payload: vector<u8>, _signature: vector<u8>): bool {
        true
    }
}
