# Multi-Signature Wallet for DeFi Platforms

## Description

The **Multi-Signature Wallet** is a smart contract designed for decentralized finance (DeFi) applications on the Aptos blockchain. This wallet allows multiple owners to securely manage assets by requiring a specified number of approvals for transactions, thereby enhancing security and trust among users.

## Vision

Our vision is to create a secure and robust multi-signature wallet that empowers users in the DeFi space. By distributing control among multiple owners, we aim to reduce the risk of unauthorized access and fraud, promoting a collaborative approach to asset management.

## Future Scope

Future enhancements may include:

- **Enhanced Transaction Features**: Implementing functionalities for transaction proposals, approvals, and execution with better visibility.
- **User Interface**: Developing a user-friendly interface for managing the wallet and monitoring transactions.
- **Integration with Other DeFi Protocols**: Facilitating interoperability with other DeFi applications for seamless asset management.
- **Governance Mechanisms**: Introducing governance features to allow wallet owners to propose changes to wallet parameters.

## Contract Details

### Module

- **Module Name**: `MultiSigDeFi::Wallet`
  
### Key Structs

- **MultiSigWallet**: Represents the multi-signature wallet with the following fields:
  - `owners`: A vector containing the addresses of wallet owners.
  - `required`: The number of signatures required for transactions.
  - `balance`: The current balance held in the wallet.

### Key Functions

1. **create_wallet**: 
   - **Parameters**: 
     - `creator`: The signer creating the wallet.
     - `owners`: A vector of addresses representing the owners.
     - `required_signatures`: The number of approvals needed for transactions.
   - **Description**: Initializes a new multi-signature wallet. Ensures that the number of owners is sufficient and that at least one signature is required.

   ```move
   public entry fun create_wallet(
       creator: &signer,
       owners: vector<address>,
       required_signatures: u64
   ) {
       // Function logic...
   }
   ```

2. **deposit_funds**: 
   - **Parameters**: 
     - `sender`: The signer sending funds to the wallet.
     - `wallet_addr`: The address of the multi-signature wallet.
     - `amount`: The amount of funds to deposit.
   - **Description**: Allows users to deposit funds into the multi-signature wallet. Updates the wallet's balance accordingly.

   ```move
   public entry fun deposit_funds(
       sender: &signer,
       wallet_addr: address,
       amount: u64
   ) acquires MultiSigWallet {
       // Function logic...
   }
   ```

### Usage

To deploy and use this contract, follow the guidelines in the deployment section of this repository. Ensure you have the necessary Aptos setup and access to the Aptos CLI.
