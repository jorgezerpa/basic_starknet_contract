#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn set(ref self: TContractState, x:u128 );
    fn get(ref self: TContractState );
}

#[starknet::contract]
mod SimpleStorage {
    #[storage]
    struct Storage {
        stored_number: u128,
    }
    
    #[abi(embed_v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState>{
        fn set(ref self: ContractState, x:u128 ){
            self.stored_number.write(x);
        }
        fn get(ref self: ContractState){
            self.stored_number.read();
        }
    }
}

