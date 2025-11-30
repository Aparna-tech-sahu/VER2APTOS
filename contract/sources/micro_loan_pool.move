module karma_passport::micro_loan_pool {
    use aptos_framework::signer;

    struct LoanPool has key {
        liquidity: u64,
        total_borrowed: u64,
    }

    struct UserLoan has key {
        principal: u64,
        active: bool,
    }

    public entry fun init_pool(admin: &signer) {
        move_to(admin, LoanPool { liquidity: 0, total_borrowed: 0 });
    }

    public entry fun deposit_pool(provider: &signer, amount: u64) {
        let pool = borrow_global_mut<LoanPool>(signer::address_of(provider));
        pool.liquidity = pool.liquidity + amount;
    }

    public entry fun borrow(user: &signer, amount: u64) acquires LoanPool {
        let pool = borrow_global_mut<LoanPool>(signer::address_of(user));
        pool.liquidity = pool.liquidity - amount;
        pool.total_borrowed = pool.total_borrowed + amount;
        move_to(user, UserLoan { principal: amount, active: true });
    }

    public entry fun repay(user: &signer, amount: u64) acquires UserLoan {
        let loan = borrow_global_mut<UserLoan>(signer::address_of(user));
        loan.principal = loan.principal - amount;
        if (loan.principal == 0) loan.active = false;
    }
}
