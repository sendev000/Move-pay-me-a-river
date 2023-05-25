module overmind::pay_me_a_river {
    use aptos_std::table::Table;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::coin::Coin;

    const ESENDER_CAN_NOT_BE_RECEIVER: u64 = 1;
    const ENUMBER_INVALID: u64 = 2;
    const EPAYMENT_DOES_NOT_EXIST: u64 = 3;
    const ESTREAM_DOES_NOT_EXIST: u64 = 4;
    const ESTREAM_IS_ACTIVE: u64 = 5;
    const ESIGNER_ADDRESS_IS_NOT_SENDER_OR_RECEIVER: u64 = 6;

    struct Stream has store {
        sender: address,
        receiver: address,
        length_in_seconds: u64,
        start_time: u64,
        coins: Coin<AptosCoin>,
    }

    struct Payments has key {
        streams: Table<address, Stream>,
    }

    inline fun check_sender_is_not_receiver(sender: address, receiver: address) {}

    inline fun check_number_is_valid(number: u64) {}

    inline fun check_payment_exists(sender_address: address) {}

    inline fun check_stream_exists(payments: &Payments, stream_address: address) {}

    inline fun check_stream_is_not_active(payments: &Payments, stream_address: address) {}

    inline fun check_signer_address_is_sender_or_receiver(
        signer_address: address,
        sender_address: address,
        receiver_address: address
    ) {}

    inline fun calculate_stream_claim_amount(total_amount: u64, start_time: u64, length_in_seconds: u64): u64 {}

    public entry fun create_stream(
        signer: &signer,
        receiver_address: address,
        amount: u64,
        length_in_seconds: u64
    ) acquires Payments {}

    public entry fun accept_stream(signer: &signer, sender_address: address) acquires Payments {}

    public entry fun claim_stream(signer: &signer, sender_address: address) acquires Payments {}

    public entry fun cancel_stream(
        signer: &signer,
        sender_address: address,
        receiver_address: address
    ) acquires Payments {}

    #[view]
    public fun get_stream(sender_address: address, receiver_address: address): (u64, u64, u64) acquires Payments {}
}