## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

## EXTRA
### CAST
#### cast --to-base
- converts the base of hexadecimal into other bases like decimal
> cast --to-base 0x715b6 dec
> 464310

#### cast send
- cast send `contract_address` "function(type)" `value` --rpc-url --private-key

#### cast call
- cast call `contract_address` "function(type)" --rpc-url*
- No need of private key if not a payable transaction

### TRANSACTION (.json)
#### Missing attributes
- r, s, v == private key signature, helps to sign the transaction
#### Nonce
- Important to figure out the transaction numbers for unique transactions