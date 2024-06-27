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