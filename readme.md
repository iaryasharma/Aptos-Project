# Multi-Signature Wallet for DeFi Platforms

## Overview
The **Multi-Signature Wallet** is a smart contract built on the **Aptos blockchain** for **decentralized finance (DeFi)** applications. This wallet enables multiple owners to manage assets securely by requiring a specified number of approvals for transactions, enhancing trust and security in the DeFi ecosystem.

## Features
- **Multi-Signature Approval**: Requires multiple approvals before transactions are executed.
- **Secure Asset Management**: Funds are protected by multiple owners, reducing unauthorized access risks.
- **On-Chain Transactions**: All transactions and approvals are recorded on-chain for transparency.
- **Deposit Functionality**: Users can deposit funds into the wallet securely.

## Future Enhancements
- **Transaction Proposals & Approvals**: Allow owners to propose and vote on transactions before execution.
- **User Interface (UI)**: A front-end for easy interaction with the wallet.
- **DeFi Integration**: Compatibility with other DeFi protocols for seamless asset management.
- **Governance Mechanisms**: Introduce governance features for modifying wallet parameters.

## Smart Contract Details

### Module
- **Module Name**: `MultiSigDeFi::Wallet`

### Structs
- **MultiSigWallet**:
  - `owners`: A list of wallet owner addresses.
  - `required`: The number of approvals needed for transactions.
  - `balance`: The current wallet balance.

### Functions
1. **create_wallet**
   - **Description**: Creates a multi-signature wallet with specified owners and required signatures.
   - **Parameters**:
     - `creator`: The signer creating the wallet.
     - `owners`: A vector of owner addresses.
     - `required_signatures`: The number of approvals required.
   
   ```move
   public entry fun create_wallet(
       creator: &signer,
       owners: vector<address>,
       required_signatures: u64
   ) {
       // Function logic...
   }
   ```

2. **deposit_funds**
   - **Description**: Allows users to deposit funds into the multi-signature wallet.
   - **Parameters**:
     - `sender`: The signer depositing funds.
     - `wallet_addr`: The multi-signature wallet address.
     - `amount`: The amount to deposit.
   
   ```move
   public entry fun deposit_funds(
       sender: &signer,
       wallet_addr: address,
       amount: u64
   ) acquires MultiSigWallet {
       // Function logic...
   }
   ```

## Deployment Instructions
### Prerequisites
- Install the **Aptos CLI**.
- Set up an Aptos account.

### Steps
1. **Compile the contract**:
   ```sh
   aptos move compile --package-path .
   ```
2. **Deploy to Aptos Testnet**:
   ```sh
   aptos move publish --package-path . --profile testnet
   ```
3. **Get the contract address** and update it in `Move.toml`.

### Contract Address
`0x4f62e786328f4d75ac9eb18b880d59ae2a94b182e29b935a1ac29178f047b148`

## Usage
1. **Create a Wallet**
   ```sh
   aptos move run --function-id '0x4f62...::Wallet::create_wallet' --args ...
   ```
2. **Deposit Funds**
   ```sh
   aptos move run --function-id '0x4f62...::Wallet::deposit_funds' --args ...
   ```

## Contributions
Contributions are welcome! Please fork the repository and submit pull requests.

## License
This project is open-source and available under the MIT License.

