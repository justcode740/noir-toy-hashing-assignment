use dep::std;
// use dep::noir_bigint;

global MODNUMBER: u64 = 4294967296;
// fn main(value: u32, hash_value: pub u32) {
//     let calculated_hash_value = calculate_hash(value);
    
//     // assert(calculated_hash_value == hash_value);
// }

// def fnv_hash(data):
//     size = 2**32
//     hash_value = 0x811C9DC5 2166136261
//     prime = 0x1000193 16777619

//     for byte in data:
//         product = (hash_value * prime) % size
//         hash_value = (product ^ byte)

//     return hash_value
fn calculate_hash(num: u32) -> u32 {
    let PRIME: u64 = 16777619;
    let mut hash_value = 2166136261 as u64;
    let bytes = byte_sequence(num);
    for byteval in bytes {
        let product: u64 = ((hash_value * PRIME) % (MODNUMBER)) as u64;
        let byteval_u64 = byteval as u64;
        hash_value = product ^ byteval_u64;
    }
    std::println(hash_value);
    hash_value as u32
}

fn byte_sequence(num: u32) -> [u8; 4] {
    let b1 = (num >> 24 & 0xff) as u8;
    let b2 = (num >> 16 & 0xff) as u8;
    let b3 = (num >> 8 & 0xff) as u8;
    let b4 = (num & 0xff) as u8;
    [b1, b2, b3, b4]
}


#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);
    std::println(hash);
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);
    std::println(hash);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);
    std::println(hash);

    assert(hash == 0x3F0C8995);
}
