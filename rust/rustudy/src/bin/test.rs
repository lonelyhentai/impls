#[cfg(not(test))]
fn main() {
    println!("If you see this, the tests were not compiled nor ran!");
}

#[cfg(test)]
mod test {
    fn distance(a: (f32, f32), b: (f32, f32)) -> f32 {
        (
            (b.0 - a.0).powi(2) +
                (b.1 - a.1).powi(2)
        ).sqrt()
    }

    #[test]
    fn distance_test() {
        assert!(distance((0f32, 0f32), (1f32, 1f32)) == (2f32).sqrt());
    }

    #[test]
    #[should_panic]
    fn failing_test() {
        assert!(1i32 == 2i32);
    }
}