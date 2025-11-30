module karma_passport::passport {
    use aptos_framework::timestamp;
    use std::signer;
    use karma_passport::oracle_verifier;

    struct Passport has key, store, copy, drop {
        score: u64,
        last_update: u64,
    }

    public entry fun init_passport(user: &signer) {
        move_to(
            user,
            Passport {
                score: 0,
                last_update: timestamp::now_seconds(),
            }
        );
    }

    public entry fun update_passport(
        user: &signer,
        payload: vector<u8>,
        signature: vector<u8>
    ) acquires Passport {
        assert!(oracle_verifier::verify(payload, signature), 1);
        let passport = borrow_global_mut<Passport>(signer::address_of(user));
        passport.score = passport.score + 1;
        passport.last_update = timestamp::now_seconds();
    }

    public fun get_passport(addr: address): Passport acquires Passport {
        let p_ref = borrow_global<Passport>(addr);
        *p_ref
    }
}
