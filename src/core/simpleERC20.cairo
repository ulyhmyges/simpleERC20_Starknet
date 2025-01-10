
#[starknet::contract]
mod SimpleERC20Contract {

    
use starknet::storage::StoragePointerReadAccess;
use starknet::storage::StoragePointerWriteAccess;
use starknet::storage::Map;
use starknet::storage::StoragePathEntry;


    #[storage]
    struct Storage {
        name: felt252,
        symbol: felt252,
        totalSupply: u128,
        balance: Map::<starknet::ContractAddress, u128>,
    }

    #[constructor]
    fn constructor(ref self: ContractState, totalSupply: u128, name: felt252, symbol: felt252) {
        self.totalSupply.write(totalSupply);
        self.name.write(name);
        self.symbol.write(symbol);
        self.balance.entry(starknet::get_caller_address()).write(totalSupply);
    }

    #[abi(embed_v0)]
    impl SimpleERC20ContractImpl of erc20::interface::simpleERC20::ISimpleERC20Contract<ContractState> {
        fn balanceOf(self: @ContractState, account: starknet::ContractAddress ) -> u128 {
            self.balance.entry(account).read()
        }
        fn transfer(ref self: ContractState, recipient: starknet::ContractAddress, amount: u128) {

        }
        fn name(self: @ContractState) -> felt252 {
            self.name.read()
        }
        fn symbol(self: @ContractState) -> felt252 {
            self.symbol.read()
        }
        fn totalSupply(self: @ContractState) -> u128 {
            self.totalSupply.read()
        }
    }
 

}
