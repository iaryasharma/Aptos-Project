module MultiSigDeFi::Wallet {
    use aptos_framework::signer;                // Still needed for signer type
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;                           // Added missing vector module

    /// Struct representing a multi-signature wallet
    struct MultiSigWallet has key, store {
        owners: vector<address>,    // List of owner addresses
        required: u64,             // Number of signatures required
        balance: u64,             // Current balance in the wallet
    }

    /// Creates a new multi-sig wallet with specified owners and required signatures
    public entry fun create_wallet(
        creator: &signer,
        owners: vector<address>,
        required_signatures: u64
    ) {
        let owner_count = vector::length(&owners);
        assert!(owner_count >= required_signatures, 1001); // Ensure enough owners
        assert!(required_signatures > 0, 1002);           // At least one signature required

        let wallet = MultiSigWallet {
            owners,
            required: required_signatures,
            balance: 0
        };
        move_to(creator, wallet);
    }

    /// Allows depositing funds into the multi-sig wallet
    public entry fun deposit_funds(
        sender: &signer,
        wallet_addr: address,
        amount: u64
    ) acquires MultiSigWallet {
        let wallet = borrow_global_mut<MultiSigWallet>(wallet_addr);
        
        // Transfer funds from sender to wallet address
        let funds = coin::withdraw<AptosCoin>(sender, amount);
        coin::deposit<AptosCoin>(wallet_addr, funds);

        // Update wallet balance
        wallet.balance = wallet.balance + amount;
    }
}