## Create a ERC20 token from scratch with Cairo

### Contract
- name : SimpleERC2OContract
- path : src/core/simpleERC20.cairo

### Build project
```
scarb build
```

### Declare project
```
starkli declare --network=sepolia --keystore=$STARKNET_KEYSTORE --account=$STARKNET_ACCOUNT target/dev/<CONTRACT>_class.json
```

### Deploy contract on Sepolia
```
starkli deploy 
--network=sepolia 
--keystore=$STARKNET_KEYSTORE 
--account=$STARKNET_ACCOUNT 
<CLASS-HASH>
50 358434828907 5461067 <OWNER ADDRESS>
```

